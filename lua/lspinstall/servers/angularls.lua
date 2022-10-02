return {
  cmd = { "./node_modules/.bin/ngserver" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install @angular/language-server@latest
  ]]
}
