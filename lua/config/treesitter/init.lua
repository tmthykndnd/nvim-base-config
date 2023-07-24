require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "make",
    "diff",
    "git_rebase",
    "gitcommit",
    "gitignore",
    -- "help", doesn't exist
    "vim",
    "vimdoc",
    "lua",
    "markdown",
    "html",
    "css",
    "json",
    "json5",
    "regex",
    "javascript",
    "typescript",
    "tsx",
    "jsdoc",
    "python",
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  refactor = {
    highlight_current_scope = { enable = false },
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = false,
    },
  },
}

require("config.treesitter.textobjects")
require("config.treesitter.comments")
