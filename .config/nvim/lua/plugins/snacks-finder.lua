-- Add a "reveal in Finder" action to the Snacks explorer/picker.
-- macOS `open -R <path>` opens Finder with the file selected in its folder.
-- Bound to `F` (Finder) inside the explorer; `o` still "open with system app".
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        actions = {
          reveal_in_finder = function(_, item)
            if not item then
              return
            end
            local path = vim.fn.fnamemodify(item.file, ":p")
            vim.system({ "open", "-R", path }, {}, function(res)
              if res.code ~= 0 then
                vim.schedule(function()
                  vim.notify("open -R failed: " .. (res.stderr or ""), vim.log.levels.ERROR)
                end)
              end
            end)
          end,
        },
        sources = {
          explorer = {
            hidden = true, -- show dotfiles by default (toggle off in-session with H)
            ignored = true, -- show git-ignored files by default (toggle off in-session with I)
            win = {
              list = {
                keys = {
                  ["F"] = "reveal_in_finder",
                },
              },
            },
          },
        },
      },
    },
  },
}
