-- Send Neovim selections to Claude Code running in a separate tmux pane, via
-- the official IDE WebSocket/MCP protocol (coder/claudecode.nvim).
--
-- Because Claude runs in another tmux pane (not inside nvim), we disable the
-- built-in terminal (`provider = "none"`) and just run the IDE server; the
-- external Claude connects to it. Loaded at startup so the server + lockfile
-- (~/.claude/ide/<port>.lock) exist before Claude connects.
--
-- Usage:
--   1. Start nvim (server auto-starts).
--   2. In the Claude pane, run `/ide` to connect to this Neovim (or `claude --ide`).
--   3. Visually select lines in nvim, press <leader>as -> sent as an @file
--      + line-range reference into the Claude conversation.
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    event = "VeryLazy",
    opts = {
      terminal = { provider = "none" }, -- Claude lives in a tmux pane, not in nvim
    },
    keys = {
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
      { "<leader>a?", "<cmd>ClaudeCodeStatus<cr>", desc = "Claude connection status" },
    },
    config = function(_, opts)
      require("claudecode").setup(opts)
      -- After a send, jump to the Claude tmux pane (the in-editor focus option
      -- doesn't apply with provider = "none").
      vim.api.nvim_create_autocmd("User", {
        pattern = "ClaudeCodeSendComplete",
        callback = function()
          if vim.env.TMUX then
            vim.fn.system({ "tmux", "select-pane", "-t", "{last}" })
          end
        end,
      })
    end,
  },
}
