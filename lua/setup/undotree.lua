vim.g.undotree_WindowLayout = 3

if vim.g.termux then
  -- bash", "-c", "echo '$DIFF' | delta"
  vim.g.undotree_DiffCommand = "delta"
  vim.g.undotree_DiffpanelHeight = 5
  vim.g.undotree_SetFocusWhenToggle = 1
  vim.g.undotree_SplitWidth = 24
  vim.g.undotree_WindowLayout = 2
  vim.g.undotree_ShortIndicators = 1
end
