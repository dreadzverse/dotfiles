return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        css = { "prettier" },
        html = { "prettier", "rustywind" },
        javascript = { "biome" },
        javascriptreact = { "biome", "rustywind" },
        json = { "prettier" },
        lua = { "stylua" },
        markdown = { "prettier", "mmdc" },
        python = { "black" },
        sh = { "shfmt" },
        svelte = { "prettier", "rustywind" },
        typescript = { "biome" },
        typescriptreact = { "biome", "rustywind" },
        typst = { "prettypst" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    },
  },
}
