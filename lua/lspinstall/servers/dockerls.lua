return {
  cmd = { "./node_modules/.bin/docker-langserver" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install dockerfile-language-server-nodejs@latest
  ]]
}
