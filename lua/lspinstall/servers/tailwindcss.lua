return {
  cmd = { "./node_modules/.bin/tailwindcss-language-server" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install @tailwindcss/language-server@latest
  ]]
}
