local telescope = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")

telescope.setup {
  defaults = themes.get_dropdown {
    dynamic_preview_title = true,
    path_display = { "truncate" },
    layout_config = {
      anchor = "N",
      width = vim.g.termux and {
        padding = 2
      } or function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,
    },
    history = {
      path = vim.fn.stdpath("data") .. "/databases/telescope_history.sqlite3",
      limit = 100,
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          -- remove(delete) buffer
          ["<C-r>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  },
  extensions = {
    file_browser = { hijack_netrw = true },
    frecency = {
      db_root = vim.fn.stdpath("data") .. "/databases",
      -- TODO: this doesn't work. Might nedd to extend frecency.sorters.Sorter
      -- Issues: #44, #84
      -- sorter = require("telescope").extensions.fzf.native_fzf_sorter(),
      show_scores = false,
    },
  }
}

telescope.load_extension("fzf")
telescope.load_extension("packer")
telescope.load_extension("project")
telescope.load_extension("file_browser")
telescope.load_extension("smart_history")
telescope.load_extension("frecency")
telescope.load_extension("yank_history")

require("config.telescope.keymaps")
