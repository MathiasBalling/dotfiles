return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = true,
    ft = "typst",
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["tinymist"] = {
          cmd = { "tinymist" },
          filetypes = { "typst" },
          settings = {
            formatterMode = "typstyle",
            projectResolution = "lockDatabase",
            -- exportPdf = "onSave",
            -- semanticTokens = "disable",
          },
        },
      },
    },
  },
}
