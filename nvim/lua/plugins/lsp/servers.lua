-- LSP server configurations
return {
	-- clangd = {},
	gopls = {},
	jedi_language_server = {
		settings = {
			completion = {
				resolveEagerly = true,
				disableSnippets = false,
			},
			diagnostics = { enable = true },
			hover = { enable = true },
			signature = { enable = true },
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