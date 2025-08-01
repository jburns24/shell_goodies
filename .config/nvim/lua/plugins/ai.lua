return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      version = "*",
      branch = "main",
      dependencies = {
        { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
      },
      build = "make tiktoken",
      keys = {
        {
          "<leader>ca",
          function()
            local actions = require("CopilotChat.actions")
            require("CopilotChat.snacks").pick(actions.select_prompts)
          end,
          desc = "Actions",
        },
        { "<leader>co", "<cmd>CopilotChatOpen<cr>", desc = "Open" },
        { "<leader>cc", "<cmd>CopilotChatClose<cr>", desc = "Close" },
        { "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "Toggle" },
        { "<leader>cr", "<cmd>CopilotChatReset<cr>", desc = "Reset" },
      },
      opts = {
        model = "claude-sonnet-4",
        agent = "copilot",
      },
      -- See Commands section for default commands if you want to lazy load on them
    },
  },
}
