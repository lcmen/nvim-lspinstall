local M = {}

--- Gets command to start lsp server
--@returns string
function M.start_cmd(lang, cmd)
  local exe = cmd[1]
  if vim.regex([[^[.]\{1,2}\/]]):match_str(exe) then -- matches ./ and ../
    -- prepend the install path if the executable is a relative path
    cmd[1] = M.install_path(lang) .. "/" .. exe
    return cmd
  else
    return cmd
  end
end

--- Gets lsp server install directory
--@returns string
function M.install_path(lang)
  return vim.fn.stdpath("data") .. "/lspinstall/" .. lang
end

--- Gets lsp config for a server of a given language
--@returns table
function M.config(lang, server)
  opts = { cmd = M.start_cmd(lang, server.cmd) }
  for key, value in pairs(server) do
    if (key ~= "cmd" and key ~= "install_script") then
      opts[key] = value
    end
  end
  return opts
end

return M
