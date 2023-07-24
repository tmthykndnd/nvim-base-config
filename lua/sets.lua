local opt = vim.opt
local tabstop = 2

opt.guicursor = ""
opt.mouse = "a"
opt.showmode = false
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.list = true
opt.listchars = {
  tab = "❘-",
  trail = "·",
  lead = "·",
  extends = "»",
  precedes = "«",
  nbsp = "×",
}

opt.nu = true
opt.relativenumber = true
opt.breakindent = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 4 -- Lines to scroll horizontally
opt.colorcolumn = "80"
opt.signcolumn = "number" -- if fn.has("nvim-0.5.0")
opt.completeopt = { "menu", "menuone", "noselect" }

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.expandtab = true
opt.smartindent = true
opt.tabstop = tabstop
opt.softtabstop = tabstop
opt.shiftwidth = tabstop

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

opt.isfname:append("@-@")
opt.clipboard:append("unnamedplus")
opt.shortmess = opt.shortmess + { c = true, I = true }
opt.matchpairs = { "(:)", "{:}", "[:]", "<:>" }
opt.wildignore = opt.wildignore + { "*/node_modules/*", "*/.git/*" }

-- perfomance
-- opt.timeoutlen = 200
-- opt.ttimeoutlen = 10
opt.redrawtime = 1500
opt.updatetime = 100
