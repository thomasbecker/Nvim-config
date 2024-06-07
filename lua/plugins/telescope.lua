return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    config = function(_)
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("rest")
      end)
    end,
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        file_ignore_patterns = { "node_modules", ".git", "%.class" },
        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      -- add a keymap to browse zsh files
      {
        "<leader>fz",
        function()
          require("telescope.builtin").find_files({ cwd = "~/.config/zsh", hidden = true })
        end,
        desc = "Find Zsh Files",
      },
    },
  },
}
