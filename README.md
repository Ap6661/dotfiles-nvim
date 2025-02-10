
# Requirements

<details>

- wget
- gcc
- ripgrep
- fd

- git
    - lazygit

- tree-sitter
    - nodejs

- Neovim (0.10+)

- Nerd Font

- (Optional)
    - Nix package manager

</details>

# Plugins (Lua/Config)

## autopair.lua

> Automatically pairs together `()`, `{}`, `[]`, `""`, `''`, and `` ` ``

Toggle: `<leader><F3>`

## colorizer.lua

> Highlight occourances of colors and hex codes with that color

## gitgutter.lua

> Show git diff markers by the number lines

## harpoon.lua

> Quickly switch between project files

Open UI: `<leader>]`

Mark File: `<leader><Tab>`

Cycle: `<C-v>` and `<C-c>`

Goto 1-3: `<leader>1` `<leader>2` `<leader>3`

## lazygit.lua

> Use the LazyGit UI

Activate: `<leader><F1>`

## lazylsp.lua

> [!IMPORTANT]
> This is only activated if Nix is in your path

> Auto install LSPs with the Nix package manager


## lsp-zero.lua

> Automatically setup lsps with LspSaga, and completion

hover_doc: `K`

peek_definition: `g`

peek_type_definition: `go`

rename: `<F2>`

code_action: `<F4>`

show_line_diagnostics: `gl`

diagnostic_jump_prev: `[d `

diagnostic_jump_next: `]d`

show_buf_diagnostics: `[D`

show_workspace_diagnostics: `]D`

## lualine.lua

> Status line

## mason.lua

> [!IMPORTANT]
> Only active without Nix

> Lsp package manager

Menu: `:Mason`

## mini.lua

> Plugin suite 

### indentscope

> Draw a line over the scope of indentations

### map

> A little minimap to view code

Toggle: `<leader>m`

### comment

> Quickly comment/uncomment lines based on Tree-sitter

Toggle: `gc[motion]`

### jump2d

> Jump anywhere on the screen with a couple presses

Activate: `<leader><Cr>`

### pick

> Picker utility for grep, registers, help, etc...

Start Command: `<leader>ff`

### files

> File explorer that treats files and folders like text in a buffer

Open: `<leader>-`
Sync: `=`
Help: `g?`

## minitator.lua

> Plugin to help annotating asciinema sessions

## rainbow.lua

> Matching rainbow delimeters

## tables.lua

> Easily create and navigate tables

Toggle Table Mode: `<leader>tm`

## transparent.lua

> Transparent background for transparent terminals

Toggle: `<leader>o`

## TreeSitter.lua

> Better syntax highlighting based on languages

> Installed by default
> - lua
> - vim
> - html
> - markdown
>   - markdown_inline
> - latex
> - java

## windowsizing.lua

> Animations on window sizing

Focus: `<leader>M`

# Keymaps



