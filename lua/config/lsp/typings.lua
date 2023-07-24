local M = {}

M.getRuntimePaths = function()
  local runtimeLibs = {
    -- only if they have typings; possibly in /types or /definitions folder
    -- TODO: commenting out because of loading performance issues
    -- "nvim-cmp",
    -- "telescope.nvim",
  }

  local libPath = vim.fn.stdpath("data") .. "/site/pack/packer/start/"
  local typingsPaths = {}

  for _, lib in ipairs(runtimeLibs) do
    table.insert(typingsPaths, libPath .. lib)
  end

  return typingsPaths
end

return M
