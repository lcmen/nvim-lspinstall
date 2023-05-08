return {
  cmd = { "./node_modules/.bin/vscode-eslint-language-server", "--stdio" },
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install vscode-langservers-extracted
  ]]
}

