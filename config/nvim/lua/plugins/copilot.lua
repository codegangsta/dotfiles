return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enabled = false,
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = false,
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-\\>",
          },
        },
      })
    end,
  },
}
