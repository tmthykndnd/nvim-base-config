require("legendary").autocmds {
  {
    name = "PackerConfig",
    {
      "BufWritePost",
      "source <afile> | PackerCompile",
      opts = { pattern = { "plugins.lua" } }
    }
  }
}
