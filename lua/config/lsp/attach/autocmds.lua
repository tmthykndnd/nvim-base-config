local legendary = require("legendary")
local M = {}

M.attach = function(ev)
  legendary.autocmds {
    {
      name = "LspConfig",
      {
        "BufWritePre",
        function() vim.lsp.buf.format() end,
        description = "Format on save",
      },
      -- {
      --   "BufWritePost",
      --   function() require("lint").try_lint() end,
      --   description = "Lint on save"
      -- },
      -- {
      --   { "CursorHold", "CursorHoldI" },
      --   vim.lsp.buf.document_highlight,
      --   description = "Highlight document symbol under cursor"
      -- },
      -- {
      --   { "CursorMoved", "CursorMovedI" },
      --   vim.lsp.buf.clear_references,
      -- }
    }
  }
end

return M
