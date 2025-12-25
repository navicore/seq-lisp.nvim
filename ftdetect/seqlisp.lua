-- Detect .seqlisp and .slisp files as seqlisp filetype
vim.filetype.add({
  extension = {
    seqlisp = "seqlisp",
    slisp = "seqlisp",
  },
})
