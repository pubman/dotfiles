-- LSP server configurations
return {
	-- clangd = {},
	gopls = {},
	pylsp = {
		-- Python LSP Server (pylsp) installed via Mason with jedi support for better docstrings
		settings = {
			pylsp = {
				plugins = {
					-- Jedi provides completions with docstrings
					jedi_completion = {
						enabled = true,
						include_params = true,
					},
					jedi_hover = {
						enabled = true,
					},
					jedi_references = {
						enabled = true,
					},
					jedi_signature_help = {
						enabled = true,
					},
					jedi_symbols = {
						enabled = true,
						all_scopes = true,
					},
					-- Enable linting plugins
					pyflakes = { enabled = true },
					pycodestyle = {
						enabled = true,
						maxLineLength = 88,  -- Black's default
					},
					mccabe = {
						enabled = true,
						threshold = 10,
					},
					-- Use autopep8 for formatting
					autopep8 = {
						enabled = true,
						maxLineLength = 88,
					},
					-- Disable pylint (can be slow) and flake8 (redundant with pyflakes + pycodestyle)
					pylint = { enabled = false },
					flake8 = { enabled = false },
				},
			},
		},
	},
	-- rust_analyzer = {},
	-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
	--
	-- Some languages (like typescript) have entire language plugins that can be useful:
	--    https://github.com/pmizio/typescript-tools.nvim
	--
	-- But for many setups, the LSP (`ts_ls`) will work just fine
	ts_ls = {},
	cssls = {},
	tailwindcss = {},

	lua_ls = {
		-- cmd = { ... },
		-- filetypes = { ... },
		-- capabilities = {},
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
}