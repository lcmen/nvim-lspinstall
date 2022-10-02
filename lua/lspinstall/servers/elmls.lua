return {
  cmd = { "./node_modules/.bin/elm-language-server" },
  init_options = {
    elmPath = nil,
    elmFormatPath = nil,
    elmTestPath = nil
  },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install elm@latest elm-test@latest elm-format@latest @elm-tooling/elm-language-server@latest
  ]]
}
