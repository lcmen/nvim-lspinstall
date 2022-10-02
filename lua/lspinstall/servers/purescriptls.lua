return {
  cmd = { "./node_modules/.bin/purescript-language-server" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install purescript-language-server@latest
  ]]
}
