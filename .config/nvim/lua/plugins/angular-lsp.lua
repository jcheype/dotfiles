return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@angular/language-server",
        location = nil,
        enableForWorkspaceTypeScriptVersions = false,
      },
    })
  end,
}
