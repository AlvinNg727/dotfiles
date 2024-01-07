return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		tag = "0.1.5",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				event = "VeryLazy",
				lazy = true,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				enabled = vim.fn.executable("make") == 1,
				event = "VeryLazy",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"ahmedkhalf/project.nvim",
				opts = {
					manual_mode = true,
				},
				event = "VeryLazy",
				config = function(_, opts)
					require("project_nvim").setup(opts)
				end,
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")

			-- Find
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (cwd)" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find files (git)" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
			vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })

			-- Grep
			vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Live grep string (cwd)" })
			vim.keymap.set("n", "<leader>pf", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Grep string (cwd)" })

			-- Git
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
			vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })

			vim.keymap.set("n", "<leader>fp", "<Cmd>Telescope projects<CR>", { desc = "Projects" })

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-Up>"] = actions.preview_scrolling_up,
							["<C-Down>"] = actions.preview_scrolling_down,
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					current_buffer_fuzzy_find = { sorting_strategy = "ascending" },
				},
			})

			require("telescope").load_extension("projects")
		end,
	},
}
