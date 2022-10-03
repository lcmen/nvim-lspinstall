return {
  cmd = { "./node_modules/.bin/typescript-language-server", "--stdio" }
  -- TODO: FIX to work with latest version
  -- Install 1.2.0 version of typescript-language-server as 2.0.0 cause some issues with omnifunc
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install typescript-language-server@1.2.0 typescript@latest
  ]]
}
