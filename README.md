## About

This is fork of [nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall) plugin, adopted to the latest version of
Neovim and `nvim-lspconfig`. The main difference between this and the original version, is that this fork does not override default
settings from `nvim-lspconfig` but provides configuration (including `cmd` to start lsp server), that can be passed to
`setup` function at runtime.

The language servers are installed *locally* (via `:LspInstall <language>` command) into `stdpath("data")`. You can use `:echo stdpath("data")` to find out which directory that is on your machine.

## Installation
Via [Vim-Plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'neovim/nvim-lspconfig'
Plug 'lcmen/nvim-lspinstall'
```
The following is a good starting point to integrate with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
```lua
local servers = require'lspinstall'.installed_servers()
for server, config in pairs(servers) do
  require'lspconfig'[server].setup(config)
end
```
## Usage
* `:LspInstall <language>` to install/update the language server for `<language>` (e.g. `:LspInstall python`).
* `:LspUninstall <language>` to uninstall the language server for `<language>`.

## Advanced Configuration (recommended)

A configuration like this automatically reloads the installed servers after installing a language server via `:LspInstall` such that we don't have to restart neovim.

```lua
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for server, config in pairs(servers) do
    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
```

## Bundled Installers

| Language    | Language Server                                                             |
|-------------|-----------------------------------------------------------------------------|
| angular     | Angular Language Service                                                    |
| bash        | bash-language-server                                                        |
| clojure     | clojure-lsp                                                                 |
| cmake       | cmake-language-server                                                       |
| cpp         | clangd                                                                      |
| csharp      | OmniSharp                                                                   |
| css         | css-language-features (pulled directly from the latest VSCode release)      |
| dockerfile  | docker-langserver                                                           |
| elixir      | Elixir Language Server (elixir-ls)                                          |
| elm         | Elm Language Server (elm-ls)                                                |
| ember       | Ember Language Server                                                       |
| fortran     | Fortran Language Server (fortls)                                            |
| go          | gopls                                                                       |
| graphql     | GraphQL language service                                                    |
| haskell     | haskell-language-server                                                     |
| html        | html-language-features (pulled directly from the latest VSCode release)     |
| json        | json-language-features (pulled directly from the latest VSCode release)     |
| latex       | texlab                                                                      |
| lua         | (sumneko) lua-language-server                                               |
| php         | intelephense                                                                |
| prisma      | prisma-language-server                                                      |
| puppet      | puppet-editor-services                                                      |
| purescript  | purescript-language-server                                                  |
| python      | pyright-langserver                                                          |
| ruby        | solargraph                                                                  |
| rust        | rust-analyzer                                                               |
| svelte      | svelte-language-server                                                      |
| tailwindcss | tailwindcss-intellisense (pulled directly from the latest VSCode extension) |
| terraform   | Terraform Language Server (terraform-ls)                                    |
| typescript  | typescript-language-server                                                  |
| vim         | vim-language-server                                                         |
| vue         | vls (vetur)                                                                 |
| yaml        | yaml-language-server                                                        |
| zig         | zls                                                                         |

| Name        | Description                                                                 |
|-------------|-----------------------------------------------------------------------------|
| deno        | https://deno.land/                                                          |
| diagnosticls| https://github.com/iamcco/diagnostic-languageserver                         |
| efm         | https://github.com/mattn/efm-langserver                                     |
| rome        | https://rome.tools/                                                         |

Note: css, json and html language servers are pulled directly from the latest VSCode release, instead of using the outdated versions provided by e.g. `npm install vscode-html-languageserver-bin`.


## Custom Installer

Use `require'lspinstall/servers'.<lang> = config` to register a config with an installer.
Here `config` is a LSP config for [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), the only difference is that there are two additional keys `install_script` and `uninstall_script` which contain shell scripts to install/uninstall the language server.

The following example provides an installer for `bash-language-server`.
```lua
require'lspinstall/servers'.bash = {
  -- 1. provide cmd to start the server.
  -- elative paths are allowed, lspinstall automatically adjusts the cmd and cmd_cwd for us!
  config.default_config.cmd = { "./node_modules/.bin/bash-language-server" },

  -- 2. provide script to install the server.
  -- lspinstall will automatically create/delete the install directory for every server
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install bash-language-server@latest
  ]],
  uninstall_script = nil -- can be omitted
}
```

Make sure to do this before you call `require'lspinstall'.installed_servers()`.

## Lua API

* `require'lspinstall'.setup()`

* `require'lspinstall'.installed_servers()`

* `require'lspinstall'.install_server(<lang>)`
* `require'lspinstall'.post_install_hook`

* `require'lspinstall'.uninstall_server(<lang>)`
* `require'lspinstall'.post_uninstall_hook`

* `require'lspinstall/servers'`
