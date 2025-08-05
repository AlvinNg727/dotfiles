local servers = {
    { name = "bashls" }, -- bash
    { name = "clangd" }, -- C/C++
    { name = "clang-format", lsp = false }, -- C/C++
    { name = "docker_compose_language_service" }, -- docker compose
    { name = "dockerls" }, -- docker
    { name = "hadolint", lsp = false }, -- docker
    { name = "latexindent", lsp = false }, -- latex
    { name = "texlab" }, -- latex
    { name = "lua_ls" }, -- lua
    { name = "stylua", lsp = false }, --lua
    { name = "marksman" }, -- markdown
    { name = "markdownlint", lsp = false }, --markdown
    {
        name = "basedpyright",
        settings = {
            basedpyright = {
                disableOrganizeImports = true, -- use ruff's import organizer
                analysis = {
                    autoImportCompletions = true,
                    autoSearchPaths = true,
                    typeCheckingMode = "standard",
                    useLibraryCodeForTypes = true,
                    diagnosticSeverityOverrides = {
                        reportMissingTypeStubs = "information",
                        reportUnusedVariable = false,
                        reportUndefinedVariable = false,
                    },
                    stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
                    -- ignore = { "*" },
                },
            },
        },
    }, -- python
    {
        name = "ruff",
        init_options = {
            settings = {
                configurationPreference = "filesystemFirst",
                lint = {
                    preview = true,
                    select = {
                        "F",
                        "E4",
                        "E5",
                        "E7",
                        "E9",
                        "N",
                        "ANN",
                        "B",
                        "A",
                        "Q",
                        "ARG",
                        "PLC",
                        "PLE",
                        "PLR",
                        "PLW",
                        "I",
                        "NPY",
                    },
                    -- ignore = { "F401" },
                },
                format = {
                    preview = true,
                },
            },
        },
    }, -- python
    { name = "taplo" }, -- toml
    { name = "lemminx" }, -- xml
    { name = "codespell", lsp = false }, -- general
}

return {
    {
        "microsoft/python-type-stubs",
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = vim.tbl_map(
                function(server)
                    return server.name
                end,
                vim.tbl_filter(function(server)
                    return server.lsp or server.lsp == nil
                end, servers)
            ),
            automatic_installation = true,
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = vim.tbl_map(
                function(server)
                    return server.name
                end,
                vim.tbl_filter(function(server)
                    return server.lsp ~= nil and not server.lsp
                end, servers)
            ),
        },
    },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim", words = { "Snacks" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        lazy = false,
        config = function(_, opts)
            vim.diagnostic.config({ virtual_text = true })

            for _, server in ipairs(servers) do
                if server.lsp or server.lsp == nil then
                    local config = {}

                    -- setup lsp settings
                    if server.settings then
                        config.settings = server.settings
                    end
                    if server.init_options then
                        config.init_options = server.init_options
                    end

                    vim.lsp.enable(server.name)
                    vim.lsp.config(server.name, config)
                end
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == "ruff" then
                        -- Disable hover in favor of basedpyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = "LSP: Disable hover capability from Ruff",
            })

            ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
            local progress = vim.defaulttable()
            vim.api.nvim_create_autocmd("LspProgress", {
                ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
                    if not client or type(value) ~= "table" then
                        return
                    end
                    local p = progress[client.id]

                    for i = 1, #p + 1 do
                        if i == #p + 1 or p[i].token == ev.data.params.token then
                            p[i] = {
                                token = ev.data.params.token,
                                msg = ("[%3d%%] %s%s"):format(
                                    value.kind == "end" and 100 or value.percentage or 100,
                                    value.title or "",
                                    value.message and (" **%s**"):format(value.message) or ""
                                ),
                                done = value.kind == "end",
                            }
                            break
                        end
                    end

                    local msg = {} ---@type string[]
                    progress[client.id] = vim.tbl_filter(function(v)
                        return table.insert(msg, v.msg) or not v.done
                    end, p)

                    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
                    vim.notify(table.concat(msg, "\n"), "info", {
                        id = "lsp_progress",
                        title = client.name,
                        opts = function(notif)
                            notif.icon = #progress[client.id] == 0 and " "
                                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                        end,
                    })
                end,
            })
        end,
        keys = {
            { "gd", vim.lsp.buf.definition, desc = "Goto definition" },
            { "gr", vim.lsp.buf.references, desc = "References" },
            { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
            { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            {
                "K",
                function()
                    return vim.lsp.buf.hover()
                end,
                desc = "Hover",
            },
            {
                "<leader>cc",
                vim.lsp.codelens.run,
                mode = { "n", "v" },
                desc = "Run Codelens",
            },
            { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens" },
            { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
            {
                "<leader>ch",
                "<cmd>LspClangdSwitchSourceHeader<CR>",
                ft = { "c", "cpp" },
                desc = "Switch Source/Header (C/C++)",
            },
        },
    },
}
