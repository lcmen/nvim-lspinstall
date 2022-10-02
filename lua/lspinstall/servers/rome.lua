return {
  cmd = { "./node_modules/.bin/rome" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install rome@latest
  ]]
}
