return {
  { "preservim/vim-colors-pencil" },

  {
    "https://gitlab.com/itaranto/plantuml.nvim",
    version = "*",
    config = function()
      require("plantuml").setup({
        renderer = {
          type = "image",
          options = {
            prog = "feh --scale-down -R 1",
            dark_mode = false,
          },
        },
        render_on_write = true,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "pencil",
    },
  },
}
