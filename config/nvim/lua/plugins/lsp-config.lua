return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = false,
      setup = {
        vtsls = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
