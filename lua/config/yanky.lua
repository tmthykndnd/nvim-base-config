require("yanky").setup {
  ring = { storage = "sqlite" }
}

require("legendary").keymaps {
  {
    "p",
    "<Plug>(YankyPutAfter)",
    mode = { "n", "x" }
  },
  {
    "gp",
    "<Plug>(YankyGPutAfter)",
    mode = { "n", "x" }
  },
  {
    "<C-n>",
    "<Plug>(YankyCycleForward)",
    description = "Cycle forward through yank history"
  },
  {
    "<C-p>",
    "<Plug>(YankyCycleBackward)",
    description = "Cycle backward through yank history"
  },
}
