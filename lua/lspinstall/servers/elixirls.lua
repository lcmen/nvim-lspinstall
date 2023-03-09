return {
  cmd = { "./elixir-ls/language_server.sh" },
  install_script = [[
    dir=$(pwd)
    repo=$(mktemp -d)
    git clone --depth 1 https://github.com/elixir-lsp/elixir-ls "${repo}"
    cd "${repo}" || exit 1
    mix deps.get
    mix elixir_ls.release -o "${dir}/elixir-ls"
  ]],
}
