return {
  cmd = { "./node_modules/.bin/graphql-lsp" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install graphql-language-service-cli@latest
  ]]
}
