return {
  cmd = { "./node_modules/.bin/svelteserver" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install svelte-language-server@latest
  ]]
}
