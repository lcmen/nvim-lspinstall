return {
  cmd = { "./venv/bin/fortls" },
  install_script = [[
  python3 -m venv ./venv
  ./venv/bin/pip3 install -U pip
  ./venv/bin/pip3 install -U fortran-language-server
  ]]
}
