require('telescope').setup({
  defaults = {
    preview = false,
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "%.jpg",
      "%.png",
      "vcr_cassettes",
    },
  },
})
