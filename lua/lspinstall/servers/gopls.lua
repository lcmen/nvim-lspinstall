return {
  cmd = { "./gopls" },
  install_script = [[
  GOPATH=$(pwd) GOBIN=$(pwd) go install -v golang.org/x/tools/gopls@latest
  GOPATH=$(pwd) go clean -modcache
  ]]
}
