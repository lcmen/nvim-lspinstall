return {
  cmd = { './node_modules/.bin/ember-language-server' },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install @lifeart/ember-language-server@latest
  ]]
}
