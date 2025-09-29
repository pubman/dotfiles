-- Detect tabstop and shiftwidth automatically
return {
  "NMAC427/guess-indent.nvim",
  config = function()
    require('guess-indent').setup({
      filetype_exclude = {
        "python"
      },
      -- Don't override expandtab - respect your global setting
      override_editorconfig = false,
      -- Only detect shiftwidth and tabstop, don't change expandtab
      auto_cmd = true,
      -- Custom detection that preserves expandtab
      on_tab_options = function(options)
        -- Keep the detected tabstop and shiftwidth but don't change expandtab
        return {
          tabstop = options.tabstop,
          shiftwidth = options.shiftwidth,
          -- Don't set expandtab - let global setting persist
        }
      end,
      on_space_options = function(options)
        return {
          tabstop = options.tabstop,
          shiftwidth = options.shiftwidth,
          expandtab = true,
        }
      end,
    })
  end
}