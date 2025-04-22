return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
      },
    },

    signature = { enabled = true },
    keymap = {
      preset = "super-tab",
      -- ["<C-y>"] = { "select_and_accept" },
    },
  }
}
