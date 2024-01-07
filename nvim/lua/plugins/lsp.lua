return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls", -- bash
					"clangd", -- C/C++
					"cmake", -- cmake
					"jsonls", -- json
					"texlab", -- latex
					"lua_ls", -- lua
					"marksman", -- markdown
					"pyright", -- python
					"rust_analyzer", -- rust
					"taplo", -- toml
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		keys = {
			{
				"<leader>cR",
				"<cmd>ClangdSwitchSourceHeader<cr>",
				desc = "Switch Source/Header (C/C++)",
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"bashls", -- bash
				"clangd", -- C/C++
				"cmake", -- cmake
				"jsonls", -- json
				"texlab", -- latex
				"lua_ls", -- lua
				"marksman", -- markdown
				"pyright", -- python
				"rust_analyzer", -- rust
				"taplo", -- toml
			}

			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
