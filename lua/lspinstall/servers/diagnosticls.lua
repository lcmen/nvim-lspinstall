return {
  cmd = { "./node_modules/.bin/diagnostic-languageserver" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install diagnostic-languageserver@latest
  ]]
}
