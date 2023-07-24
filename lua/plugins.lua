local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup {
  function(use)
    -- NOTE(packer): If you are on Windows 10, you need developer mode enabled
    -- in order to use local plugins (creating symbolic links requires
    -- admin privileges on Windows - credit to @TimUntersberger for this note)

    use { "wbthomason/packer.nvim" }

    -- use { "nathom/filetype.nvim" }

    use { "rafcamlet/nvim-luapad" }
    use { "milisims/nvim-luaref" }

    use {
      "kkharji/sqlite.lua",
      setup = function() require("setup.sqlite") end,
    }

    -- bind keymaps, commands & autocommands.
    use {
      "mrjones2014/legendary.nvim",
      config = function() require("config.legendary") end,
    }

    use {
      "navarasu/onedark.nvim",
      config = function() require("config.onedark") end,
    }

    use { "nvim-tree/nvim-web-devicons" }

    use {
      "nvim-lualine/lualine.nvim",
      config = function() require("config.lualine") end,
    }

    -- TODO: check if auto pairing is available lsp functionality
    use {
      "jiangmiao/auto-pairs",
      setup = function() require("setup.auto-pairs") end,
    }

    -- handy bracket (]) mappings: ]e, ]b, ]<space> etc
    use { "tpope/vim-unimpaired" }

    -- add(y), change(c) surrounding(s) pairs
    use { "tpope/vim-surround" }

    -- repeat vim-surround, vim-unimpared
    use { "tpope/vim-repeat" }

    -- syntax highlighting
    use { "antonk52/vim-browserslist" }

    -- textobjects
    use { "wellle/targets.vim" }

    -- treesitter highlighting, textobjects, etc
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function() require("config.treesitter") end,
      run = ":TSUpdate", -- post update/install hook: update all parsers
      requires = {
        -- highlighting current symbols, scope, smart rename and goto definitions
        -- TODO: possibly redundant w/ lsp
        "nvim-treesitter/nvim-treesitter-refactor",
        -- semantic textobjects
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- commentstring (Comment.nvim)
        "JoosepAlviste/nvim-ts-context-commentstring",
      },
    }

    -- gcc comment plugin, supports treesitter, dot repeat, left-right/up-down motions, hooks,
    use {
      "numToStr/Comment.nvim",
      config = function() require("config.comments") end,
    }

    use {
      "mbbill/undotree",
      setup = function() require("setup.undotree") end,
      config = function() require("config.undotree") end,
    }

    -- yank and put ring. AcksID/neoclip is decent alternative.
    use {
      "gbprod/yanky.nvim",
      config = function() require("config.yanky") end,
    }

    -- used by telescope, null-ls
    use { "nvim-lua/plenary.nvim" }

    use {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      config = function() require("config.telescope") end,
      requires = {
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = vim.g.termux and "make" or "mingw32-make",
        },
        "nvim-telescope/telescope-packer.nvim",
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-smart-history.nvim",
        "nvim-telescope/telescope-frecency.nvim",
        "nvim-telescope/telescope-symbols.nvim",
      },
    }

    -- TODO
    use {
      "stevearc/dressing.nvim",
      config = function() require("config.dressing") end,
    }

    use { "neovim/nvim-lspconfig" }

    -- json lsp schemas
    use { "b0o/schemastore.nvim" }

    -- config = function() require("config.lsp") end,
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "jose-elias-alvarez/typescript.nvim" }

    -- lsp progress
    use {
      "j-hui/fidget.nvim",
      tag = "legacy",
      config = function()
        require("fidget").setup {
          text = { spinner = "dots", done = "" },
        }
      end,
    }

    -- autocompletions, snippets
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "onsails/lspkind.nvim",
        -- sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        -- snippets
        {
          "L3MON4D3/LuaSnip",
          tag = "v1.*",
          -- install jsregexp (optional!:).
          run = "make install_jsregexp",
        },
      },
      config = function() require("config.lsp") end,
    }

    if packer_bootstrap then require("packer").sync() end
  end,
  -- startup options
  config = { git = { clone_timeout = false } },
}
