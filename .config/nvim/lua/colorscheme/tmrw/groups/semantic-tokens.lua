local M = {}

---@param colors Colors
function M.get(colors)
    return {
        ["@lsp.mod.attribute"] = "@variable",

        ["@lsp.type.boolean"] = "@boolean",
        ["@lsp.type.builtinType"] = "@type.builtin",
        ["@lsp.type.comment"] = "@comment",
        ["@lsp.type.decorator"] = "@attribute",
        ["@lsp.type.deriveHelper"] = "@attribute",
        ["@lsp.type.enum"] = "@enum",
        ["@lsp.type.enumMember"] = "@enumMember",
        ["@lsp.type.escapeSequence"] = "@string.escape",
        ["@lsp.type.formatSpecifier"] = { fg = colors.cyan },
        ["@lsp.type.generic"] = "@variable",
        ["@lsp.type.interface"] = "@type",
        ["@lsp.type.keyword"] = "@keyword",
        ["@lsp.type.lifetime"] = "@variable",
        ["@lsp.type.macro"] = "@macro",
        ["@lsp.type.namespace"] = "@module",
        ["@lsp.type.namespace.python"] = "@variable",
        ["@lsp.type.number"] = "@number",
        ["@lsp.type.operator"] = "@operator",
        ["@lsp.type.parameter"] = "@variable.parameter",
        ["@lsp.type.property"] = "@property",
        ["@lsp.type.selfKeyword"] = "@variable.builtin",
        ["@lsp.type.selfTypeKeyword"] = "@variable.builtin",
        ["@lsp.type.string"] = "@string",
        ["@lsp.type.typeAlias"] = "@type",
        ["@lsp.type.typeParameter"] = "@type",
        ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colors.diagnostics.error },
        ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables

        ["@lsp.typemod.class.defaultLibrary"] = "@type.builtin",
        ["@lsp.typemod.class.declaration"] = "@type.definition",
        ["@lsp.typemod.enum.defaultLibrary"] = "@enum",
        ["@lsp.typemod.enum.declaration"] = "@type.definition",
        ["@lsp.typemod.enumMember.defaultLibrary"] = "@enum",
        ["@lsp.typemod.function.defaultLibrary"] = "@function",
        ["@lsp.typemod.interface.declaration"] = "@type.definition",
        ["@lsp.typemod.keyword.async"] = "@keyword.coroutine",
        ["@lsp.typemod.keyword.injected"] = "@keyword",
        ["@lsp.typemod.macro.defaultLibrary"] = "@macro",
        ["@lsp.typemod.macro.declaration"] = "@type.definition",
        ["@lsp.typemod.method.defaultLibrary"] = "@function",
        ["@lsp.typemod.operator.injected"] = "@operator",
        ["@lsp.typemod.string.injected"] = "@string",
        ["@lsp.typemod.struct.defaultLibrary"] = "@type.builtin",
        ["@lsp.typemod.struct.declaration"] = "@type.definition",
        ["@lsp.typemod.type.defaultLibrary"] = "@type.builtin",
        ["@lsp.typemod.type.declaration"] = "@type.definition",
        ["@lsp.typemod.typeAlias.defaultLibrary"] = "@type.builtin",
        ["@lsp.typemod.typeAlias.declaration"] = "@type.definition",
        ["@lsp.typemod.variable.callable"] = "@function",
        ["@lsp.typemod.variable.defaultLibrary"] = "@variable",
        ["@lsp.typemod.variable.injected"] = "@variable",
        ["@lsp.typemod.variable.static"] = "@constant",
    }
end

return M
