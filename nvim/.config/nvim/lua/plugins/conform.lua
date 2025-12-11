return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        css = { "prettierd" },
        html = { "prettierd", "rustywind" },
        javascript = { "prettierd", "biome" },
        javascriptreact = { "prettierd", "biome", "rustywind" },
        json = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd", "mmdc" },
        python = { "black" },
        sh = { "shfmt" },
        svelte = { "prettierd", "rustywind" },
        typescript = { "prettierd", "biome" },
        typescriptreact = { "prettierd", "biome", "rustywind" },
        typst = { "prettypst" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 1000,
      },
    },
  },
}
