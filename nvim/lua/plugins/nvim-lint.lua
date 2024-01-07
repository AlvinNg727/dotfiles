return {
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		opts = {
			events = { "BufWritePost", "BufReadPost", "InsertLeave" },
			linters_by_ft = {
				fish = { "fish" },
				markdown = { "markdownlint" },
				lua = { "luacheck" },
			},
		},
		config = function()
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
