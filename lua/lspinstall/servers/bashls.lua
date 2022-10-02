return {
  cmd = { "./node_modules/.bin/bash-language-server" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install bash-language-server@latest
  ]]
}
