local servers = require "lspinstall/servers"
local util = require"lspinstall/util"

local M = {}

-- INSTALL
function M.install_server(lang)
  if not servers[lang] then error("Could not find language server for " .. lang) end

  local path = util.install_path(lang)
  vim.fn.mkdir(path, "p") -- fail: throws

  local function onExit(_, code)
    if code ~= 0 then
      if vim.fn.delete(path, "rf") ~= 0 then -- here 0: success, -1: fail
        error("[nvim-lspinstall] Could not delete directory " .. lang)
      end
      error("[nvim-lspinstall] Could not install language server for " .. lang)
    end
    vim.notify("[nvim-lspinstall] Successfully installed language server for " .. lang)
    if M.post_install_hook then M.post_install_hook() end
  end

  vim.cmd("new")
  local shell = vim.o.shell
  vim.o.shell = "/usr/bin/env bash"
  vim.fn.termopen("set -e\n" .. servers[lang].install_script, { cwd = path, on_exit = onExit })
  vim.o.shell = shell
  vim.cmd("startinsert")
end

-- UNINSTALL
function M.uninstall_server(lang)
  if not servers[lang] then error("Could not find language server for " .. lang) end

  local path = util.install_path(lang)

  if vim.fn.isdirectory(path) ~= 1 then -- 0: false, 1: true
    error("Language server is not installed")
    return
  end

  local function onExit(_, code)
    if code ~= 0 then error("[nvim-lspinstall] Could not uninstall language server for " .. lang) end
    if vim.fn.delete(path, "rf") ~= 0 then -- here 0: success, -1: fail
      error("[nvim-lspinstall] Could not delete directory " .. lang)
    end
    vim.notify("[nvim-lspinstall] Successfully uninstalled language server for " .. lang)
    if M.post_uninstall_hook then M.post_uninstall_hook() end
  end

  vim.cmd("new")
  local shell = vim.o.shell
  vim.o.shell = "/usr/bin/env bash"
  vim.fn.termopen("set -e\n" .. (servers[lang].uninstall_script or ""),
                  { cwd = path, on_exit = onExit })
  vim.o.shell = shell
  vim.cmd("startinsert")
end

-- UTILITY
function M.is_server_installed(lang)
  return vim.fn.isdirectory(util.install_path(lang)) == 1 -- 0: false, 1: true
end

function M.available_servers()
  return vim.tbl_keys(servers)
end

function M.installed_servers()
  local installed = vim.tbl_filter(function(key) return M.is_server_installed(key) end, M.available_servers())
  local result = {}
  for _, lang in pairs(installed) do
    result[lang] = util.config(lang, servers[lang])
  end
  return result
end

return M
