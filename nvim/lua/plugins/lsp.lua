local servers = {
    { name = "bashls" }, -- bash
    { name = "clangd" }, -- C/C++
    { name = "docker_compose_language_service" }, -- docker compose
    { name = "dockerls" }, -- docker
    { name = "jsonls" }, -- json
    {
        name = "lua_ls",
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = {
                        "vim",
                    },
                },
            },
        },
    }, -- lua
    { name = "marksman" }, -- markdown
    {
        name = "pylsp", -- python
        settings = {
            pylsp = {
                plugins = {
                    autopep8 = { enabled = false },
                    pycodestyle = { enabled = false },
                    yapf = { enabled = false },
                    flake8 = { enabled = true },
                    pylint = {
                        enabled = true,
                        args = { "--extension-pkg-whitelist=cv2" },
                    },
                },
            },
        },
    },
    { name = "taplo" }, -- toml
}

return {
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = vim.tbl_map(function(server)
                return server.name
            end, servers),
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        keys = {
            {
                "<leader>ch",
                "<cmd>ClangdSwitchSourceHeader<CR>",
                desc = "Switch Source/Header (C/C++)",
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            for _, server in ipairs(servers) do
                local config = {
                    capabilities = capabilities,
                }

                if server.settings then
                    config.settings = server.settings
                end

                lspconfig[server.name].setup(config)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover information (lsp)" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Coda action (lsp)" })
        end,
    },
}
