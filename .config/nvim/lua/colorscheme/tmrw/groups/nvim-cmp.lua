local M = {}

---@param colors Colors
function M.get(colors)
    return {
        CmpDocumentation = { fg = colors.fg, bg = colors.bg },
        CmpDocumentationBorder = { fg = colors.fg, bg = colors.bg },
        CmpGhostText = { fg = colors.fg_dark },
        CmpItemAbbr = { fg = colors.fg },
        CmpItemAbbrDeprecated = { fg = colors.comment, strikethrough = true },
        CmpItemAbbrMatch = "Search",
        CmpItemAbbrMatchFuzzy = "Search",
        CmpItemMenu = "Pmenu",
    }
end

return M
