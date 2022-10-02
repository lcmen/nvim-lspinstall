return {
  cmd = { "./elixir-ls/language_server.sh" },
  install_script = [[
    curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
    rm -rf elixir-ls
    unzip elixir-ls.zip -d elixir-ls
    rm elixir-ls.zip
    chmod +x elixir-ls/language_server.sh
  ]],
}
