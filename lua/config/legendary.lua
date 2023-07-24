require("legendary").setup {
  default_opts = {
    keymaps = { silent = true }
  },
  keymaps = {
    { "<Space>", "<Nop>" },
    {
      ",",
      ",<C-g>u",
      mode = "i",
      description = ", Undo break"
    },
    {
      ".",
      ".<C-g>u",
      mode = "i",
      description = ". Undo break"
    },
    {
      "?",
      "?<C-g>u",
      mode = "i",
      description = "? Undo break"
    },
    {
      "!",
      "!<C-g>u",
      mode = "i",
      description = "! Undo break"
    },
    {
      "Y",
      "y$",
      description = "Yank and highlight to end of line"
    },
    {
      "n",
      "nzzzv",
      description = "Repeat last '/' or '?' without moving cursor"
    },
    {
      "N",
      "Nzzzv",
      description = "Repeat last '/' or '?' in opposite direction  without moving cursor"
    },
    {
      "J",
      "mzJ`z",
      description = "Join adjacent line without moving cursor"
    },
    {
      "j",
      "v:count ? 'j' : 'gj'",
      opts = { expr = true },
      description = "Go to next wrapped line"
    },
    {
      "k",
      "v:count ? 'k' : 'gk'",
      opts = { expr = true },
      description = "Go to previous wrapped line"
    },
    {
      "<Leader>h",
      "<Cmd>wincmd h<CR>",
      description = "Move to left window"
    },
    {
      "<Leader>k",
      "<Cmd>wincmd k<CR>",
      description = "Move to top window"
    },
    {
      "<Leader>l",
      "<Cmd>wincmd l<CR>",
      description = "Move to right window"
    },
    {
      "<Leader>j",
      "<Cmd>wincmd j<CR>",
      description = "Move to bottom window"
    },

    {
      "<Leader>so",
      "<Cmd>source %<CR>",
      description = "Source buffer"
    },
    {
      "<C-v>",
      '"_ciw<C-R>*<Esc>',
      description = 'Change [inner] word with contents from register "0'
    },
    {
      "<M-s>",
      "<Cmd>:noautocmd w<CR>",
      mode = { "n", "i" },
      description = "Write but skip `Format on save`"
    },
    {
      "<C-s>",
      -- <Cmd> more efficient than <C-O>:, the latter requires switching between normal & current mode
      "<Cmd>w<CR>",
      mode = { "n", "i" },
      description = "<C-r>+<Esc> buffer"
    },
    {
      "jk",
      {
        t = "<C-\\><C-n>",
        i = "<Esc>l"
      },
      description = "Switch to normal mode"
    },
  }
}
