require("onedark").setup {
  style = "dark",
  toggle_style_key = "<Leader>th",
  toggle_style_list = { "dark", "light" },
  code_style = {
    -- italics break on Termux?
    comments = "none",
  },
}

require("legendary").keymap {
  "<Leader>th",
  description = "Toggle Onedark 'dark' and 'light' themes",
}

require("onedark").load()
