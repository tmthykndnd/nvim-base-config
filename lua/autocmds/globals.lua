require("legendary").autocmds {
  {
    name = "Globals",
    {
      "TextYankPost",
      -- silent!
      vim.highlight.on_yank
    }
  }
}
