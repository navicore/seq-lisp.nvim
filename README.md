# seq-lisp.nvim

Neovim support for the [SeqLisp programming language](https://github.com/navicore/seq-lisp).

## Features

- **Syntax highlighting** - Keywords, builtins, strings, comments, s-expressions
- **Auto-indentation** - Smart Lisp-style indentation
- **LSP integration** - Real-time diagnostics with line/column positions

## Requirements

- Neovim 0.10+ (for `vim.lsp.start` and `vim.filetype.add`)
- [SeqLisp](https://github.com/navicore/seq-lisp) installed with `seqlisp-lsp` in your PATH

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "navicore/seq-lisp.nvim",
  ft = "seqlisp",
  opts = {},
}
```

### With custom configuration

```lua
{
  "navicore/seq-lisp.nvim",
  ft = "seqlisp",
  opts = {
    -- Custom path to seqlisp-lsp (optional, defaults to "seqlisp-lsp")
    cmd = { "seqlisp-lsp" },

    -- LSP capabilities (optional, for completion plugins)
    capabilities = require("cmp_nvim_lsp").default_capabilities(),

    -- on_attach callback (optional)
    on_attach = function(client, bufnr)
      -- Your keymaps here
    end,
  },
}
```

### Manual setup

If you prefer manual configuration:

```lua
require("seqlisp-lsp").setup({})
```

## File Extension

The plugin recognizes `.slisp` files as SeqLisp source files.

## Usage

Once installed, open any `.slisp` file and the LSP will start automatically. Diagnostics appear inline as you type.

## Current LSP Features

- **Diagnostics** - Parse and evaluation errors with precise positions
- **textDocument/didOpen** - Validates on file open
- **textDocument/didChange** - Validates on edit

## License

MIT
