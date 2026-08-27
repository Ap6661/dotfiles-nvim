
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

- Neovim (0.12+)

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

<!-- ## harpoon.lua -->
<!---->
<!-- > Quickly switch between project files -->
<!---->
<!-- Open UI: `<leader>]` -->
<!---->
<!-- Mark File: `<leader><Tab>` -->
<!---->
<!-- Cycle: `<C-v>` and `<C-c>` -->
<!---->
<!-- Goto 1-3: `<leader>1` `<leader>2` `<leader>3` -->

## lazygit.lua

> Use the LazyGit UI

Activate: `<leader><F1>`

## lsp-sourcing.lua

> Auto install LSPs with the Nix package manager if Nix is installed

> [!IMPORTANT]
> With ccls languages you need a `.ccls` file in the root

Manual (no nix): `:mason`

## lsp-config.lua

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

## molten.lua

> Jupyter kernel integration. Runs code in a Jupyter kernel and renders output in a floating window below the cell.

> Kernels and packages come from your project's environment, not this config. See [Jupyter / Quarto Workflow](#jupyter--quarto-workflow).

| Mapping           | Command                  | Explanation                          |
| ---               | ---                      | ---                                  |
| `<localleader>mi` | `init_env_kernel`        | Init the active env (`VIRTUAL_ENV`) or the project kernel (`JUPYTER_PATH`), else picker |
| `<localleader>rl` | `MoltenEvaluateLine`     | Evaluate the current line            |
| `<localleader>rr` | `MoltenReevaluateCell`   | Re-evaluate the active cell          |
| `<localleader>r`  | `MoltenEvaluateVisual`   | Evaluate the visual selection        |
| `<localleader>e`  | `MoltenEvaluateOperator` | Evaluate an operator selection       |
| `<localleader>rd` | `MoltenDelete`           | Delete the active cell               |
| `<localleader>oh` | `MoltenHideOutput`       | Hide the output window               |
| `<localleader>os` | `MoltenEnterOutput`      | Show/enter the output window         |
| `<localleader>oi` | `MoltenInterrupt`        | Interrupt the kernel                 |
| `<localleader>rs` | `MoltenRestart`          | Restart the kernel                   |

## quarto.lua

> Quarto mode for `.qmd` documents: code-chunk execution through Molten and per-language LSP via otter.nvim.

| Mapping           | Command               | Explanation                          |
| ---               | ---                   | ---                                  |
| `<localleader>rc` | `run_cell`            | Run the current cell                 |
| `<localleader>ra` | `run_above`           | Run the current cell and all above   |
| `<localleader>rA` | `run_all`             | Run all cells of the current language |
| `<localleader>rl` | `run_line`            | Run the current line                 |
| `<localleader>r`  | `run_range` (visual)  | Run cells touched by the selection   |
| `<localleader>qp` | `quartoPreview`       | Open `quarto preview` in a terminal tab |
| `<localleader>qc` | `quartoClosePreview`  | Close the preview                    |
| `<localleader>qr` | `:!quarto render %`   | Render the document                  |

## rainbow.lua

> Matching rainbow delimeters

## tables.lua

> Easily create and navigate tables

Toggle Table Mode: `<leader>tm`

## transparent.lua

> Transparent background for transparent terminals

Toggle: `<leader>o`

## ts-sourcing.lua

> Better syntax highlighting based on languages

> Manages installing parsers

Defaults: 

- C
- Lua
- Markdown
- Vimscript
- Vimdoc
- Nix 
- Bash

## windowsizing.lua

> Animations on window sizing

Focus: `<leader>M`

# Keymaps (lua/keymaps.lua)

| Mapping        | Command                   | Explanation                                                                |
| ---            | ---                       | ---                                                                        |
| `F1`           | `nop`                     | Disable Help                                                               |
| `L`            | `Lzz`                     | Scroll and Recenter                                                        |
| `H`            | `Hzz`                     | Scroll and Recenter                                                        |
| `<C-h>`        | `<C-w>h`                  | Quickly move to the left window                                            |
| `<C-j>`        | `<C-w>j`                  | Quickly move to the window below                                           |
| `<C-k>`        | `<C-w>k`                  | Quickly move to the window above                                           |
| `<C-l>`        | `<C-w>l`                  | Quickly move to the right window                                           |
| `<C-Up>`       | `:resize -2<CR>`          | Resize the current window                                                  |
| `<C-Down>`     | `:resize +2<CR>`          | Resize the current window                                                  |
| `<C-Left>`     | `:vertical resize -2<CR>` | Resize the current window                                                  |
| `<C-Right>`    | `:vertical resize +2<CR>` | Resize the current window                                                  |
| `<leader>t`    | `:vert bo new +term...`   | Opens up a terminal on the right                                           |
| `<C-\><C-\>`   | `<C-\><C-n>`              | Exit terminal mode. The animations can put you into a psuedo-terminal mode |
| `<leader>ss`   | `:setlocal spell!<cr>`    | Toggle spell checker                                                       |
| `<leader><F2>` | `lua function...`         | Toggle mouse input                                                         |

# Jupyter / Quarto Workflow

Molten runs code against a Jupyter kernel. Kernels and packages are **not** installed into this config or system-wide; each project brings its own. This config only provides the mechanism to discover and connect to whatever kernels your environment exposes, so it is not limited to Python.

## Python (Nix dev shell, recommended)

Each project has its own `flake.nix` that defines the project Python (its packages and versions) and registers a project-local Jupyter kernel pointing at it:

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      projectPython = pkgs.python3.withPackages (ps: with ps; [
        ipykernel jupyter-client numpy pandas # your project's packages
      ]);
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ projectPython ];
        shellHook = ''
          ${projectPython}/bin/python -m ipykernel install \
            --prefix="$PWD/.jupyter" \
            --name "$(basename $PWD)" \
            --display-name "$(basename $PWD) (nix)"
          export JUPYTER_PATH="$PWD/.jupyter/share/jupyter"
        '';
      };
    };
}
```

Then enter the shell and launch nvim from it:

```sh
nix develop
nvim
```

`<localleader>mi` auto-connects to the project's kernel (read from `JUPYTER_PATH` when exactly one project kernel is present; otherwise it opens the kernel picker). The kernel runs the Nix-built interpreter with all project packages embedded, so `import` resolves against the project's flake — no slow pip installs, and startup is under a second. `quarto render` and `<localleader>qp` (preview) pick up the same Python from `PATH`.

## Python (per-project venv, alternative)

```sh
python -m venv .venv
source .venv/bin/activate
pip install ipykernel
python -m ipykernel install --user --name <project-name>
```

Launch nvim from the activated environment; `<localleader>mi` connects to `<project-name>` via `VIRTUAL_ENV`.

## R

Add R with `IRkernel` to the project's dev shell (e.g. `pkgs.rWrapper` / `rPackages.IRkernel`) and register the kernelspec once:

```r
IRkernel::installspec()
```

Then use `<localleader>mi` and pick `ir`, or `:MoltenInit ir`. R packages resolve from the project R library path.

## Quarto

- Cells in `.qmd` files run through the same Molten kernels with the `<localleader>r*` mappings above.
- Per-language LSP (hover, go-to-def, completion, diagnostics) inside code chunks works through otter and nvim's built-in completion (trigger with `<C-x><C-o>`).
- Preview: `<localleader>qp`. Render: `<localleader>qr`.

## First run

1. Molten is a remote plugin: after the plugins install, run `:UpdateRemotePlugins`, then restart nvim.
2. Tree-sitter parsers install automatically on startup (`bash nix lua markdown markdown_inline python r`).
3. Verify with `:checkhealth`, `:MoltenInfo` (lists available kernels), then run a cell in a fresh `.qmd`.
