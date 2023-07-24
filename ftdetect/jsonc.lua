require("legendary").autocmds {
  {
    name = "FileTypes",

    {
      { "BufRead", "BufNewFile" },

      function()
        vim.bo.filetype = "jsonc"
      end,

      opts = { pattern = { "json" } }
    },
  }
}
