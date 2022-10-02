return {
  cmd = { "./node_modules/.bin/prisma-language-server" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install @prisma/language-server@latest
  ]]
}
