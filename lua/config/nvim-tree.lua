require("nvim-tree").setup({
  actions = {
    expand_all = {
      max_folder_discovery = 1,
      exclude = {},
    },
  },
  filters = {
    custom = { "^.git$" },
  },
})
