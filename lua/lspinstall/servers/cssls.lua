return {
  cmd = { "node", "./vscode-css/css-language-features/server/dist/node/cssServerMain.js", "--stdio" },
  install_script = [[
  curl -o vscode.tar.gz -L https://update.code.visualstudio.com/latest/linux-x64/stable
  rm -rf vscode
  mkdir vscode
  tar -xzf vscode.tar.gz -C vscode --strip-components 1
  rm vscode.tar.gz

  rm -rf vscode-css
  mkdir vscode-css
  cp -r vscode/resources/app/extensions/node_modules vscode-css
  cp -r vscode/resources/app/extensions/css-language-features vscode-css

  rm -rf vscode
  ]]
}
