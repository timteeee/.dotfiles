local M = {}

---@param colors Colors
function M.get(colors)
    return {
        -- Dashboard
        SnacksDashboardDesc = { fg = colors.fg },
        SnacksDashboardFooter = { fg = colors.comment },
        SnacksDashboardHeader = { fg = colors.cyan },
        SnacksDashboardTitle = { fg = colors.blue },
        SnacksDashboardIcon = { fg = colors.blue },
        SnacksDashboardKey = { fg = colors.orange },
        SnacksDashboardSpecial = { fg = colors.orange },
        SnacksDashboardDir = { fg = colors.blue },

        -- Indent
        SnacksIndent = { fg = colors.fg_dark, nocombine = true },
        SnacksIndentScope = { fg = colors.comment, nocombine = true },
    }
end

return M
