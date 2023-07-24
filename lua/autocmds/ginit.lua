require("legendary").autocmds {
  {
    name = "MYGVIMRC",
    {
      "BufWritePost",
      "source <afile> | echom 'Source:$MYGVIMRC'",
      opts = { pattern = { vim.fn.expand("$MYGVIMRC") } },
      description = "Source $MYVIMRC on save"
    }
  }
}
