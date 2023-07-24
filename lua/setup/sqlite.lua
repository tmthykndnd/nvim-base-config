if vim.fn.has("win32") then
  vim.g.sqlite_clib_path = vim.env.SQLITE_CLIB_PATH
end
