return {
  cmd = { "./puppet-editor-services/puppet-languageserver" },
  install_script = [[
    curl -L -o puppet-editor-services.tar.gz $(curl -s https://api.github.com/repos/puppetlabs/puppet-editor-services/releases/latest | grep -E 'browser_download_url.*tar\.gz"' | cut -d\" -f4)
    rm -rf puppet-editor-services
    mkdir puppet-editor-services
    tar -C puppet-editor-services -zxf puppet-editor-services.tar.gz
    rm puppet-editor-services.tar.gz
  ]]
}
