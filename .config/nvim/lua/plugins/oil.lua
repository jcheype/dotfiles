return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  keys = {
    { "-",         "<cmd>Oil<cr>",         desc = "Open Oil" },
    { "<leader>-", "<cmd>Oil --float<cr>", desc = "Open Oil (float)" },
  },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      deltete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, bufnr)
          return name == ".git" or name == ".."
        end,
      },
    })
  end
}
