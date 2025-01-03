---@alias HighlightGroups table<string, string | vim.api.keyset.highlight>

local M = {}

function M.setup()
    local colors = require("colorscheme.tmrw.colors")

    -- TODO: discover which plugins are installed and only import those
    ---@type HighlightGroups[]
    local highlights = {
        require("colorscheme.tmrw.groups.builtin").get(colors),
        require("colorscheme.tmrw.groups.treesitter").get(colors),
        require("colorscheme.tmrw.groups.semantic-tokens").get(colors),
        require("colorscheme.tmrw.groups.nvim-cmp").get(colors),
        require("colorscheme.tmrw.groups.telescope").get(colors),
        require("colorscheme.tmrw.groups.gitsigns").get(colors),
        require("colorscheme.tmrw.groups.snacks").get(colors),
        require("colorscheme.tmrw.groups.fugitive").get(colors),
    }

    vim.cmd("hi clear")

    for _, h in ipairs(highlights) do
        for group, hl in pairs(h) do
            if type(hl) == "string" then
                hl = { link = hl }
            end

            vim.api.nvim_set_hl(0, group, hl)
        end
    end
end

return M
