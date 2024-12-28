vim.g.python_indent = {
    open_paren = vim.opt.shiftwidth._value,
    closed_paren_align_last_line = false,
}

require("snippets.python")
