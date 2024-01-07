return {
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opt = {},
		config = function(_, opts)
			require("dressing").setup(opts)
		end,
	},
}
