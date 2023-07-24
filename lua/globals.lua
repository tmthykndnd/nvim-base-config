local g = vim.g
if vim.env.TERMUX_APP_PID then
  g.termux = true
end

g.mapleader = " "
g.maplocalleader = " "

-- add l=lua to embedded (Heredoc) scripts for highlighting
g.vimsyn_embed = "l"

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
