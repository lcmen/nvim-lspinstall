return {
  cmd = { "node", "./vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio" },
  install_script = [[
  curl -L -o vscode.tar.gz https://update.code.visualstudio.com/latest/linux-x64/stable
  rm -rf vscode
  mkdir vscode
  tar -xzf vscode.tar.gz -C vscode --strip-components 1
  rm vscode.tar.gz

  rm -rf vscode-html
  mkdir vscode-html
  cp -r vscode/resources/app/extensions/node_modules vscode-html
  cp -r vscode/resources/app/extensions/html-language-features vscode-html

  rm -rf vscode
  ]]
}
