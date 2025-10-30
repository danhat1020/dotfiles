return {
  {
    "Saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
        ["<C-space>"] = false,
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-l>"] = { "show_and_insert", "fallback" },
        ["<Esc>"] = { "cancel", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "normal",
      },
      signature = { enabled = true },
      completion = {
        menu = {
          auto_show = false,
        }
      },
      fuzzy = {
        implementation = "prefer_rust",
      },
    },
  },
}
