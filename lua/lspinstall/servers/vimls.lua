return {
  cmd = { "./node_modules/.bin/vim-language-server" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install vim-language-server@latest
  ]]
}
