return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
      },
    },
  },
}
