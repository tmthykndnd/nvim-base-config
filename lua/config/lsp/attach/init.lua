local legendary = require("legendary")

legendary.autocmds {
  {
    name = "UsrLspConfig",
    {
      "LspAttach",

      function(ev)
        require("config.lsp.attach.keymaps").attach(ev)
        require("config.lsp.attach.autocmds").attach(ev)
      end
    }
  }
}
