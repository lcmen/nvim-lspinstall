return {
  cmd = { "./node_modules/.bin/vls" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install vls@latest
  ]]
}
