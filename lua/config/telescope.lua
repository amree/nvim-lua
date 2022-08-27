require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "%.jpg",
      "%.png",
      "vcr_cassettes",
    },
  },
})
