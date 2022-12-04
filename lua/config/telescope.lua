require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "%.jpg",
      "%.png",
      "%.csv",
      "vcr_cassettes",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
})
