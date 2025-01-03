local M = {}

---@param colors Colors
function M.get(colors)
    return {
        ["@annotation"] = "PreProc",
        ["@attribute"] = "@variable",
        ["@boolean"] = "Boolean",
        ["@character"] = "Character",
        ["@character.printf"] = "SpecialChar",
        ["@character.special"] = "SpecialChar",
        ["@comment"] = "Comment",
        ["@comment.error"] = { fg = colors.diagnostics.error },
        ["@comment.hint"] = { fg = colors.diagnostics.hint },
        ["@comment.info"] = { fg = colors.diagnostics.info },
        ["@comment.note"] = { fg = colors.diagnostics.hint },
        ["@comment.todo"] = { fg = colors.blue },
        ["@comment.warning"] = { fg = colors.diagnostics.warning },
        ["@constant"] = "Constant",
        ["@constant.builtin"] = "Special",
        ["@constant.macro"] = "@constant",
        ["@constructor"] = "@function", -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        ["@diff.delta"] = "DiffChange",
        ["@diff.minus"] = "DiffDelete",
        ["@diff.plus"] = "DiffAdd",
        ["@enum"] = "@type",
        ["@enumMember"] = "@constant",
        ["@function"] = "Function",
        ["@function.builtin"] = "@function",
        ["@function.call"] = "@function",
        ["@function.macro"] = "Macro",
        ["@function.method"] = "@function",
        ["@function.method.call"] = "@function.method",
        ["@keyword"] = "Keyword", -- For keywords that don't fall in previous categories.
        ["@keyword.conditional"] = "Conditional",
        ["@keyword.coroutine"] = "@keyword",
        ["@keyword.debug"] = "Debug",
        ["@keyword.directive"] = "PreProc",
        ["@keyword.directive.define"] = "Define",
        ["@keyword.exception"] = "Exception",
        ["@keyword.function"] = "@keyword", -- For keywords used to define a function.
        ["@keyword.import"] = "Include",
        ["@keyword.operator"] = "@keyword",
        ["@keyword.repeat"] = "Repeat",
        ["@keyword.return"] = "@keyword",
        ["@keyword.storage"] = "StorageClass",
        ["@label"] = { fg = colors.blue }, -- For labels: `label:` in C and `:label:` in Lua.
        ["@macro"] = "Macro",
        ["@markup"] = "@none",
        ["@markup.emphasis"] = { italic = true },
        ["@markup.environment"] = "Macro",
        ["@markup.environment.name"] = "Type",
        ["@markup.heading"] = "Title",
        ["@markup.italic"] = { italic = true },
        ["@markup.link"] = { fg = colors.cyan },
        ["@markup.link.label"] = "SpecialChar",
        ["@markup.link.label.symbol"] = "Identifier",
        ["@markup.link.url"] = "Underlined",
        ["@markup.list"] = { fg = colors.fg }, -- For special punctutation that does not fall in the categories before.
        ["@markup.list.checked"] = { fg = colors.green }, -- For brackets and parens.
        ["@markup.list.markdown"] = { fg = colors.orange, bold = true },
        ["@markup.list.unchecked"] = { fg = colors.blue }, -- For brackets and parens.
        ["@markup.math"] = "Special",
        ["@markup.raw"] = "String",
        ["@markup.raw.markdown_inline"] = { fg = colors.blue },
        ["@markup.strikethrough"] = { strikethrough = true },
        ["@markup.strong"] = { bold = true },
        ["@markup.underline"] = { underline = true },
        ["@module"] = { fg = colors.fg },
        ["@module.builtin"] = "@module",
        ["@namespace.builtin"] = "@variable.builtin",
        ["@none"] = {},
        ["@number"] = "Number",
        ["@number.float"] = "Float",
        ["@operator"] = "Operator", -- For any operator: `+`, but also `->` and `*` in C.
        ["@property"] = "@variable",
        ["@punctuation"] = "Delimiter", -- For brackets and parens.
        ["@punctuation.bracket"] = "@punctuation", -- For brackets and parens.
        ["@punctuation.delimiter"] = "@punctuation", -- For delimiters ie: `.`
        ["@punctuation.special"] = { fg = colors.cyan }, -- For special symbols (e.g. `{}` in string interpolation)
        ["@string"] = "String",
        ["@string.documentation"] = { fg = colors.blue },
        ["@string.escape"] = { fg = colors.cyan }, -- For escape characters within a string.
        ["@string.regexp"] = { fg = colors.red }, -- For regexes.
        ["@tag"] = "Label",
        ["@tag.attribute"] = "@property",
        ["@tag.delimiter"] = "Delimiter",
        ["@type"] = "Type",
        ["@type.builtin"] = "@type",
        ["@type.definition"] = "Typedef",
        ["@type.qualifier"] = "@keyword",
        ["@variable"] = "Identifier", -- Any variable name that does not have another highlight.
        ["@variable.builtin"] = "@keyword", -- Variable names that are defined by the languages, like `this` or `self`.
        ["@variable.member"] = "@variable", -- For fields.
        ["@variable.parameter"] = "@variable", -- For parameters of a function.
        ["@variable.parameter.builtin"] = "@variable", -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
    }
end

return M
