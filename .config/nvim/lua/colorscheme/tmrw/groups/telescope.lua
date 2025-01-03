local M = {}

---@param colors Colors
function M.get(colors)
    return {
        TelescopeBorder = { fg = colors.fg },
        TelescopeNormal = { fg = colors.fg },
        TelescopeMatching = "Search",

        TelescopePromptBorder = { fg = colors.fg },
        TelescopePromptPrefix = { fg = colors.orange },
        TelescopePromptTitle = { fg = colors.fg },

        TelescopeSelectionCaret = { fg = colors.orange, bg = colors.selection },
        TelescopeSelection = { fg = colors.fg, bg = colors.selection },
        TelescopeMultiSelection = { fg = colors.yellow, bg = colors.selection },

        TelescopeResultsComment = { fg = colors.fg_dark },
        TelescopeResultsDiffDelete = { fg = colors.diff.delete },
        TelescopeResultsDiffChange = { fg = colors.diff.change },
        TelescopeResultsDiffAdd = { fg = colors.diff.add },
    }
end

return M
