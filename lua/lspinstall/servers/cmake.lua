return {
  cmd = { "./venv/bin/cmake-language-server" },
  install_script = [[
  python3 -m venv ./venv
  ./venv/bin/pip3 install -U pip
  ./venv/bin/pip3 install -U cmake-language-server
  ]]
}
