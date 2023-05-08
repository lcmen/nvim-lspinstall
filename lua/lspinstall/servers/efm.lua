return {
  cmd = { "./efm-langserver" },
  install_script = [=[
  version="0.0.44"
  arch=$(arch)
  os=${OSTYPE}

  if [[ $os == "linux"* ]]; then
    os="linux"
  elif [[ $os == "darwin"* ]]; then
    os="darwin"
  else
    echo "Unsupported OS - ${OSTYPE}"
    exit 1
  fi

  if [[ $arch == "x86_64" ]]; then
    arch="amd64"
  elif [[ $arch == "arm64" ]]; then
    arch="arm64"
  else
    echo "Unsupported architecture - ${arch}"
    exit 1
  fi

  name="efm-langserver_v${version}_${os}_${arch}"
  url="https://github.com/mattn/efm-langserver/releases/download/v${version}/${name}.zip"
  wget -q -O tmp.zip ${url} && unzip -q tmp.zip && rm tmp.zip
  mv ${name}/efm-langserver ./efm-langserver
  rm -rf ${name}
  ]=]
}
