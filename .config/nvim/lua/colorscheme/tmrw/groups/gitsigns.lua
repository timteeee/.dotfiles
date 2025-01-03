local M = {}

---@param colors Colors
function M.get(colors)
    return {
        GitSignsAdd = { fg = colors.diff.add }, -- diff mode: Added line |diff.txt|
        GitSignsChange = { fg = colors.diff.change }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = { fg = colors.diff.delete }, -- diff mode: Deleted line |diff.txt|
        GitSignsAddLn = { fg = colors.black, bg = colors.diff.add },
        GitSignsChangeLn = { fg = colors.black, bg = colors.diff.change },
        GitSignsDeleteLn = { fg = colors.black, bg = colors.diff.delete },
        GitSignsCurrentLineBlame = { fg = colors.fg_dark },
    }
end

return M
