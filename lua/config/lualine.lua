local icons = require("util.icons")

require("lualine").setup {
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    ignore_focus = { "undotree", "diff" },
    theme = "onedark",
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "filetype" },
    lualine_z = { "progress" },
  },
  sections = {
    lualine_a = {
      {
        "mode",

        fmt = function(str)
          if vim.g.termux then return string.lower(str:sub(1, 1)) end
          return str
        end,
      },
    },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = icons.Error,
          warn = icons.Warn,
          info = icons.Info,
          hint = icons.Hint,
        },
        sources = {
          "nvim_lsp",
          "nvim_diagnostic",
          -- "nvim_workspace_diagnostic",
        },
      },
    },
    -- lualine_x = { { "diagnostics", { sources = { "coc" } } } },
    lualine_x = {
      {
        "filetype",

        fmt = function(str)
          if str == "typescript" then
            return "ts"
          elseif str == "typescriptreact" then
            return "tsx"
          elseif str == "javascript" then
            return "js"
          elseif str == "javascriptreact" then
            return "jsx"
          elseif str == "markdown" then
            return "md"
          end
          return str
        end,
      },
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",

        color = "NonText",
        path = 1,
        shorting_target = 11,
        padding = 3,
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}
