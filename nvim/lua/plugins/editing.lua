-- Editing related plugins (autopairs, autotag, formatting)
return {
	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	-- Auto tag for HTML/JSX
	{
		"windwp/nvim-ts-autotag",
		lazy = false,
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Autoformat
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return {
						timeout_ms = 3000,  -- Increased timeout for slower formatters like black
						lsp_format = "fallback",
					}
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Use ruff for Python formatting and import sorting (much faster than black+isort)
				python = { "ruff_format", "ruff_organize_imports" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			formatters = {
				-- Ruff formatters are much faster and handle tabs/spaces issues better
				ruff_format = {
					timeout_ms = 2000,
				},
				ruff_organize_imports = {
					timeout_ms = 2000,
				},
			},
		},
	},

	-- Linting
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Configure linters by filetype
			lint.linters_by_ft = {
				python = { "ruff" },
			}

			-- Create autocommand for linting
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}