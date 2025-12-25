# seq-lisp.nvim

Neovim support for the [SeqLisp programming language](https://github.com/navicore/seq-lisp).

## Features

- **Syntax highlighting** - Keywords, builtins, strings, comments, s-expressions
- **Auto-indentation** - Smart Lisp-style indentation
- **LSP integration** - Real-time diagnostics with line/column positions

## Requirements

- Neovim 0.10+ (for `vim.lsp.start` and `vim.filetype.add`)
- SeqLisp installed and built

### Installing SeqLisp

```bash
git clone https://github.com/navicore/seq-lisp
cd seq-lisp
just build
```

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "navicore/seq-lisp.nvim",
  ft = "seqlisp",
  opts = {
    -- Path to seqlisp binary and lsp.lisp
    cmd = { "/path/to/seq-lisp/target/seqlisp", "/path/to/seq-lisp/lib/lsp.lisp" },
  },
}
```

### With custom configuration

```lua
{
  "navicore/seq-lisp.nvim",
  ft = "seqlisp",
  opts = {
    -- Command to start the LSP server
    cmd = { "/path/to/seq-lisp/target/seqlisp", "/path/to/seq-lisp/lib/lsp.lisp" },

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
require("seqlisp-lsp").setup({
  cmd = { "/path/to/seq-lisp/target/seqlisp", "/path/to/seq-lisp/lib/lsp.lisp" },
})
```

## File Extensions

The plugin recognizes:
- `.seqlisp` - SeqLisp source files
- `.slisp` - SeqLisp source files (short form)

## Usage

Once installed, open any `.seqlisp` or `.slisp` file and the LSP will start automatically. Diagnostics appear inline as you type.

## Current LSP Features

- **Diagnostics** - Parse and evaluation errors with precise positions
- **textDocument/didOpen** - Validates on file open
- **textDocument/didChange** - Validates on edit

## License

MIT
