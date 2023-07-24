local legendary = require("legendary")
local cmpabilities = require("config.lsp.attach.cmpabilities")

local M = {}

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then return true end
  end
  return false
end

M.attach = function(ev)
  local opts = { buffer = ev.buf }
  local ft = vim.bo[ev.buf].filetype

  legendary.keymaps {
    {
      "gT",
      "<Cmd>Telescope lsp_type_definitions<CR>",
      opts = opts,
    },
    {
      "gd",
      "<Cmd>Telescope lsp_definitions<CR>",
      opts = opts,
    },
    {
      "gs",
      function()
        local tsserve = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        }
        local winnr = vim.api.nvim_get_current_win()
        if table.contains(tsserve, ft) then
          require("typescript").goToSourceDefinition(winnr, { fallback = true })
        else
          require("telescope.builtin").lsp_definitions()
        end
      end,
      opts = opts,
    },
    {
      "gi",
      "<Cmd>Telescope lsp_implementations<CR>",
      opts = opts,
    },
    -- { "gd",         vim.lsp.buf.definition,      opts = opts },
    -- { "gi",         vim.lsp.buf.implementation,  opts = opts },
    { "gD",         vim.lsp.buf.declaration,     opts = opts },
    { "gr",         vim.lsp.buf.references,      opts = opts },
    { "K",          vim.lsp.buf.hover,           opts = opts },
    { "qk",         vim.lsp.buf.signature_help,  opts = opts },
    { "qd",         cmpabilities.PeekDefinition, opts = opts },
    { "[d",         vim.diagnostic.goto_prev,    opts = opts },
    { "]d",         vim.diagnostic.goto_next,    opts = opts },
    { "<Leader>d.", vim.diagnostic.open_float,   opts = opts },
    { "<Leader>rn", vim.lsp.buf.rename,          opts = opts },
    {
      "<Leader>ca",

      vim.lsp.buf.code_action,
      mode = { "n", "i" },
      opts = opts,
    },
    {
      "<Leader>.?",
      "<Cmd>Telescope lsp_references<CR>",
      description = "List references for word under cursor",
    },
    {
      "<Leader>r?",
      "<Cmd>Telescope lsp_document_symbols<CR>",
      description = "List all buffer references",
    },
    {
      "<Leader>R?",
      "<Cmd>Telescope lsp_workspace_symbols<CR>",
      description = "List all workspace references in buffer",
    },
    {
      "<Leader>d?",
      "<Cmd>Telescope diagnostics<CR>",
      description = "List all diagnostics in current buffer",
    },
  }
end

return M
