return {
  cmd = { "./node_modules/.bin/intelephense" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install intelephense@latest
  ]]
}
