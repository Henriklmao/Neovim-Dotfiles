return {
  -- Disable heavy UI components
  { "folke/noice.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "RRethy/vim-illuminate", enabled = false }, -- Highlighting word under cursor can be slow
  { "folke/todo-comments.nvim", enabled = false }, -- Searching todos on load can be slow
  { "nvim-mini/mini.animate", enabled = false }, -- Disable animations

  -- Disable Mason auto-installation
  -- {
  --   "mason-org/mason.nvim",
  --   opts = function(_, opts)
  --     opts.ensure_installed = {} -- Don't install anything automatically
  --   end,
  -- },

  -- Disable null-ls / none-ls (linters and formatters)
  { "nvimtools/none-ls.nvim", enabled = false },

  -- Optimize Treesitter: disable for large files
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.matchup = { enable = false }
      opts.highlight = opts.highlight or {}
      opts.highlight.disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end
    end,
  },
}
