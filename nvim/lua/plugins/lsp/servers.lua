-- LSP server configurations
return {
	-- clangd = {},
	gopls = {},
	jedi_language_server = {
		-- Jedi Language Server - already installed and working
		-- Provides completions, hover, references, etc.
		-- No built-in formatting/linting - we'll use conform.nvim for formatting
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