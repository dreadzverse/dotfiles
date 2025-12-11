return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0,
            },
          },
        },
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        basedpyright = true,
        clangd = true,
        cssls = true,
        gopls = true,
        html = true,
        jsonls = true,
        lua_ls = true,
        shellcheck = true,
        tailwindcss = true,
        tinymist = true,
        ts_ls = true,
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "biome",
        "black",
        "clang-format",
        "prettierd",
        "prettypst",
        "rustywind",
        "shfmt",
        "stylua",
      })

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}

            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
