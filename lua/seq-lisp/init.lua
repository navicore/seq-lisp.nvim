-- seq-lisp.nvim
-- Neovim plugin for the SeqLisp programming language

local M = {}

M.setup = function(opts)
  opts = opts or {}

  -- Register .slisp filetype
  vim.filetype.add({
    extension = {
      slisp = "seqlisp",
    },
  })

  -- Default command - assumes seqlisp-lsp is in PATH
  local cmd = opts.cmd or { "seqlisp-lsp" }

  -- Set up LSP when opening seqlisp files
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "seqlisp",
    callback = function(args)
      vim.lsp.start({
        name = "seqlisp-lsp",
        cmd = cmd,
        root_dir = vim.fs.dirname(
          vim.fs.find({ ".git", "justfile" }, {
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
