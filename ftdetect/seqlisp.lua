-- Detect .slisp files as seqlisp filetype
vim.filetype.add({
  extension = {
    slisp = "seqlisp",
  },
})
