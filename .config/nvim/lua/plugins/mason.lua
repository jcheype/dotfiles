return {
  { "williamboman/mason-lspconfig.nvim", enabled = os.getenv("NIX_PATH") == nil },
  { "williamboman/mason.nvim",           enabled = os.getenv("NIX_PATH") == nil },
}
