-- Mouse-friendly UI tweak on top of LazyVim defaults.
--
-- LazyVim's default file explorer is Snacks Explorer (toggle with <leader>e).
-- It's already mouse-clickable, and LazyVim's default bufferline already sets
-- the sidebar offset for it, so nothing extra is needed there.
--
-- The only real addition: make the bufferline tabs clickable with the mouse.
return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        left_mouse_command = "buffer %d", -- left-click a tab -> switch to it
        right_mouse_command = "bdelete! %d", -- right-click a tab -> close it
      },
    },
  },
}
