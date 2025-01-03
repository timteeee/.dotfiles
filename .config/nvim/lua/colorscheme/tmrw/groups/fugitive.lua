local M = {}

---@param colors Colors
function M.get(colors)
    return {
        fugitiveModifier = { fg = colors.orange },
        fugitiveUnstagedModifier = "fugitiveModifier",
        fugitiveUntrackedModifier = "fugitiveModifier",
        fugitiveStagedModifier = "fugitiveModifier",

        fugitiveHeading = "Special",
        fugitiveUnstagedHeading = "fugitiveHeading",
        fugitiveUntrackedHeading = "fugitiveHeading",
        fugitiveStagedHeading = "fugitiveHeading",

        fugitiveHash = { fg = colors.cyan },
    }
end

return M
