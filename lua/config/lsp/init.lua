require("config.lsp.cmp")
require("config.lsp.attach")
require("config.lsp.signs")

local lspconfig = require("lspconfig")

-- extended capabilities from nvim_cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- yarn global add bash-language-server
lspconfig.bashls.setup { capabilities = capabilities }

-- yarn global add vim-language-server
lspconfig.vimls.setup { capabilities = capabilities }

-- TERMUX: pkg install lua-language-server
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      hint = {
        arrayIndex = "Enable", -- enable all index hints
        setType = true, -- show type hints in assignment operations
        enable = false, -- TEST:(FAIL)
      },
      format = {
        defaultConfig = {
          quote_style = "double",
          call_arg_parentheses = "remove_table_only",
        },
      },
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = require("config.lsp.typings").getRuntimePaths(),
        -- disable addons request popup
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- yarn global add vscode-langservers-extracted
lspconfig.cssls.setup { capabilities = capabilities }

-- yarn global add cssmodules-language-server
lspconfig.cssmodules_ls.setup { capabilities = capabilities }

-- yarn global add @tailwindcss/language-server
lspconfig.tailwindcss.setup {}

-- yarn global add emmet-ls
lspconfig.emmet_ls.setup { capabilities = capabilities }

-- yarn global add vscode-langservers-extracted
lspconfig.jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas {
        select = {
          ".commitlintrc",
          ".eslintrc",
          ".lintstagedrc",
          ".postcssrc",
          ".stylelintrc",
          "babelrc.json",
          "browser.i18n.json",
          "Chrome Extension",
          "chrome-extension-locales-messages.json",
          "cypress.json",
          "Expo SDK",
          "Firebase",
          "GitHub Action",
          "GitHub Workflow",
          "huskyrc",
          "jsconfig.json",
          "package.json",
          "prettierrc.json",
          "semantic-release",
          "tsconfig.json",
          "vega.json",
          "vega-lite.json",
          "WebExtensions",
        },
      },
      validate = { enable = true },
    },
  },
}

-- yarn global add vscode-langservers-extracted
lspconfig.eslint.setup {
  -- capabilities = capabilities,
  settings = {
    experimental = { useFlatConfig = true },
    format = false,
    packageManager = "yarn",
  },
}

-- yarn global add typescript typescript-language-server
require("typescript").setup {
  debug = false, -- enable debug logging for commands
  disable_commands = true, -- prevent the plugin from creating Vim commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    capabilities = capabilities,
  },
}

local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    -- yarn global add @fsouza/prettierd
    null_ls.builtins.formatting.prettierd,
    -- TERMUX: archive [ar](binutils) is no longer part of build-essential
    -- TERMUX: run `pkg install binutils`
    --
    -- TODO: packer.userocks { "lanes", "luacheck" }
    -- requires forking luarocks and updating src/luarocks/core/utils.lua
    -- to use TMPDIR instead of TMP and removing the os.tmpname() ternary branch
    -- because os.tmpname doesn't work in NDK environments.
    -- Not to mention there needs to be a way to fork/edit packer_hererocks/hereeocks.py
    -- to target the forked luarocks repo. Also: packer/lua/luarocks.lua 82-90
    -- FALLBACK:  pkg install lua51 luarocks && luarocks install luacheck
    -- rocks = { "lanes", "luacheck" },
    null_ls.builtins.diagnostics.luacheck,
    -- pkg install stylua
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.lua_format
    require("typescript.extensions.null-ls.code-actions"),
  },
}
