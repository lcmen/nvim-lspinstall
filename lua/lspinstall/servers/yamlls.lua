return {
  cmd = { "./node_modules/.bin/yaml-language-server" },
  install_script = [[
  ! test -f package.json && yarn init -y  || true
  yarn add yaml-language-server@latest
  ]]
}
