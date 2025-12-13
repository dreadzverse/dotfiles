return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        css = { "prettierd" },
        html = { "prettierd", "rustywind" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd", "rustywind" },
        json = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd", "mmdc" },
        python = { "black" },
        sh = { "shfmt" },
        svelte = { "prettierd", "rustywind" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd", "rustywind" },
        typst = { "prettypst" },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 1000,
      },
    },
  },
}
