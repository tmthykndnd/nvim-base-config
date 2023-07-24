require("legendary").keymaps {
  {
    "<Leader>ll",
    "<Cmd>Telescope loclist<CR>",
    description = "Open location list"
  },
  {
    "<Leader>qq",
    "<Cmd>Telescope quickfix<CR>",
    description = "Open quickfix"
  },
  {
    "<Leader>hh",
    "<Cmd>Telescope help_tags<CR>",
    description = "Find help"
  },
  {
    "<Leader>&&",
    "<Cmd>Telescope vim_options<CR>",
    description = "Find vim optioms"
  },
  {
    "<Leader>?p",
    "<Cmd>Telescope yank_history<CR>",
    description = "Previous yank"
  },

  -- open files, buffers, pickers and plugins
  {
    "<Leader>fw",
    "<Cmd>Telescope project<CR>",
    description = "Open workspace"
  },
  {
    "<Leader>fp",
    "<Cmd>Telescope packer<CR>",
    description = "Open packer plugin"
  },
  {
    "<Leader>ff",
    "<Cmd>Telescope find_files<CR>",
    description = "Open file"
  },
  {
    "<Leader>fi",
    "<Cmd>Telescope git_files<CR>",
    description = "Open git index ls-files"
  },
  {
    "<Leader>fb",
    "<Cmd>Telescope buffers<CR>",
    description = "Open buffer"
  },
  {
    "<Leader>fd",
    "<Cmd>Telescope file_browser<CR>",
    description = "Open directory"
  },
  {
    "<Leader>f.",
    "<Cmd>Telescope file_browser path=%:p:h<CR>",
    description = "Open relative file"
  },
  {
    "<Leader>?.",
    "<Cmd>Telescope frecency<CR>",
    description = "Previous file"
  },
  {
    "<Leader>??",
    "<Cmd>Telescope resume<CR>",
    description = "Open previous picker"
  },

  -- search
  {
    "<Leader>/g",
    "<Cmd>Telescope live_grep<CR>",
    description = "Search global"
  },
  {
    "<Leader>/b",
    "<Cmd>Telescope live_grep grep_open_files=true<CR>",
    description = "Search open buffers"
  },
  {
    "<Leader>//",
    "<Cmd>Telescope current_buffer_fuzzy_find<CR>",
    description = "Search buffer"
  },
  {
    "<Leader>/.",
    "<Cmd>Telescope grep_string<CR>",
    description = "Search word under cursor in cwd"
  },
  {
    "<Leader>?/",
    "<Cmd>Telescope search_history<CR>",
    description = "Previous search"
  },

  -- which key, command etc
  {
    "<Leader>wk",
    "<Cmd>Telescope keymaps<CR>",
    description = "Which key"
  },
  {
    "<Leader>wu",
    '<Cmd>lua require"telescope.builtin".symbols {{ sources = { "emoji", "math", "gitmoji" } }}<CR>',
    description = "Which unicode symbol"
  },
  {
    "<Leader>wa",
    "<Cmd>Telescope autocommands<CR>",
    description = "Which autocommand"
  },
  {
    "<Leader>wc",
    "<Cmd>Telescope commands<CR>",
    description = "Which command"
  },
  {
    "<Leader>?c",
    "<Cmd>Telescope command_history<CR>",
    description = "Previous command"
  },
}
