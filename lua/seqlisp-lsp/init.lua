-- seqlisp-lsp.nvim
-- Neovim LSP configuration for the SeqLisp programming language

local M = {}

M.setup = function(opts)
  opts = opts or {}

  -- Register .seqlisp and .slisp filetypes
  vim.filetype.add({
    extension = {
      seqlisp = "seqlisp",
      slisp = "seqlisp",
    },
  })

  -- Default command - runs seqlisp with lsp.lisp
  -- User should set cmd to point to their seqlisp installation
  local cmd = opts.cmd or { "seqlisp", "lsp.lisp" }

  -- Set up LSP when opening seqlisp files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "seqlisp",
    callback = function(args)
      vim.lsp.start({
        name = "seqlisp-lsp",
        cmd = cmd,
        root_dir = vim.fs.dirname(
          vim.fs.find({ ".git", "justfile", "lib" }, {
            upward = true,
            path = vim.fs.dirname(args.file),
          })[1]
        ) or vim.fn.getcwd(),
        capabilities = opts.capabilities,
        on_attach = opts.on_attach,
      })
    end,
  })
end

return M
