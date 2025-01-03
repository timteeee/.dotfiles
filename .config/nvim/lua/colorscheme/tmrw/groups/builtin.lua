local M = {}

---@param colors Colors
function M.get(colors)
    return {
        -- Syntax
        Comment = { fg = colors.comment, italic = true }, -- any comment

        Constant = { fg = colors.fg }, -- (preferred) any constant
        String = { fg = colors.green }, --   a string constant: "this is a string"
        Character = { fg = colors.green }, --  a character constant: 'c', '\n'
        Number = { fg = colors.orange }, -- a number constant: 234, 0xff
        Float = "Number", -- a floating point constant: 2.3e10
        Boolean = { fg = colors.orange }, -- a boolean constant: TRUE, false

        Identifier = { fg = colors.fg }, -- (preferred) any variable name
        Function = { fg = colors.cyan }, -- function name (also: methods for classes)
        Method = "Function",

        Statement = { fg = colors.purple }, -- (preferred) any statement
        Conditional = { fg = colors.purple }, -- if, then, else, endif, switch, etc.
        Label = "Keyword", -- case, default, etc.
        Operator = { fg = colors.fg }, -- "sizeof", "+", "*", etc.
        Keyword = { fg = colors.purple }, --  any other keyword
        Exception = { fg = colors.purple }, -- try, catch, throw

        PreProc = { fg = colors.fg }, -- (preferred) generic Preprocessor
        PreCondit = { fg = colors.purple },
        Include = { fg = colors.purple },
        Macro = { fg = colors.orange },
        Define = { fg = colors.purple },

        Type = { fg = colors.orange }, -- (preferred) int, long, char, etc.
        Structure = "Type", -- struct, union, enum, etc.
        StorageClass = { fg = colors.purple }, -- static, register, volatile, etc.
        TypeDef = { fg = colors.fg },

        Special = { fg = colors.purple }, -- (preferred) any special symbol
        SpecialComment = {}, -- special things inside a comment
        Tag = {}, -- you can use CTRL-] on this
        Error = { fg = colors.diagnostics.error }, -- (preferred) any erroneous construct
        Todo = { fg = colors.blue }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Debug = { fg = colors.orange }, --    debugging statements
        Delimiter = { fg = colors.fg }, --  character that needs attention

        -- Everything else
        ColorColumn = { bg = colors.bg }, -- used for the columns set with 'colorcolumn'
        Conceal = { fg = colors.fg_dark }, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = { reverse = true }, -- character under the cursor
        lCursor = { reverse = true }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        CursorIM = { fg = colors.bg, bg = colors.fg }, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { bg = colors.selection }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
        CursorLine = { bg = colors.selection }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
        Directory = { fg = colors.blue }, -- directory names (and other special names in listings)
        DiffAdd = { bg = colors.diff.add }, -- diff mode: Added line |diff.txt|
        DiffChange = { bg = colors.diff.change }, -- diff mode: Changed line |diff.txt|
        DiffDelete = { bg = colors.diff.delete }, -- diff mode: Deleted line |diff.txt|
        DiffText = { bg = colors.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|

        -- TODO: make this configurable, default to "hidden"
        EndOfBuffer = { fg = colors.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.

        ErrorMsg = { fg = colors.diagnostics.error }, -- error messages on the command line
        VertSplit = { fg = colors.fg_dark }, -- the column separating vertically split windows
        WinSeparator = { fg = colors.fg_dark }, -- the column separating vertically split windows
        Folded = { fg = colors.fg_dark }, -- line used for closed folds
        FoldColumn = {}, -- 'foldcolumn'
        SignColumn = { bg = colors.gutter.bg, fg = colors.gutter.fg }, -- column where |signs| are displayed
        SignColumnSB = { bg = colors.gutter.bg, fg = colors.gutter.fg }, -- column where |signs| are displayed
        Substitute = { fg = colors.black, bg = colors.orange }, -- |:substitute| replacement text highlighting
        LineNr = { fg = colors.gutter.fg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        LineNrAbove = "LineNr",
        LineNrBelow = "LineNr",
        CursorLineNr = "LineNr", -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        MatchParen = { fg = colors.orange }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg = { fg = colors.comment, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea = { fg = colors.comment }, -- Area for messages and cmdline
        MoreMsg = { fg = colors.cyan }, -- |more-prompt|
        NonText = "EndOfBuffer", -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

        Normal = { fg = colors.fg, bg = colors.bg }, -- normal text
        NormalNC = { fg = colors.fg, bg = colors.bg }, -- normal text in non-current windows
        NormalSB = { fg = colors.fg, bg = colors.bg }, -- normal text in sidebar
        NormalFloat = { fg = colors.fg, bg = colors.bg }, -- Normal text in floating windows.

        FloatBorder = { fg = colors.fg, bg = colors.bg },
        FloatTitle = { fg = colors.fg, bg = colors.bg },

        Pmenu = { fg = colors.fg, bg = colors.bg }, -- Popup menu: normal item.
        PmenuMatch = { fg = colors.white, bg = colors.selection }, -- Popup menu: Matched text in normal item.
        PmenuSel = { fg = colors.white, bg = colors.selection }, -- Popup menu: selected item.
        PmenuMatchSel = { fg = colors.white, bg = colors.selection }, -- Popup menu: Matched text in selected item.
        PmenuSbar = { bg = colors.bg }, -- Popup menu: scrollbar.
        PmenuThumb = { bg = colors.selection }, -- Popup menu: Thumb of the scrollbar.

        Question = { fg = colors.blue }, -- |hit-enter| prompt and yes/no questions

        QuickFixLine = { bg = colors.selection, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        qfFileName = { fg = colors.blue },
        qfLineNr = { fg = colors.comment },

        Search = { fg = colors.yellow, bg = colors.selection }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        IncSearch = "Search", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        CurSearch = "Search",
        SpecialKey = { fg = colors.fg_dark }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|

        SpellBad = { sp = colors.diagnostics.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap = { sp = colors.diagnostics.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal = { sp = colors.diagnostics.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare = { sp = colors.diagnostics.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

        StatusLine = { fg = colors.comment, bg = colors.bg }, -- status line of current window
        StatusLineNC = { fg = colors.fg_dark, bg = colors.bg }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

        TabLine = { fg = colors.fg_dark }, -- tab pages line, not active tab page label
        TabLineSel = { fg = colors.fg }, -- tab pages line, active tab page label
        TabLineFill = { bg = colors.bg }, -- tab pages line, where there are no labels

        Title = { fg = colors.blue }, -- titles for output from ":set all", ":autocmd" etc.
        Visual = { bg = colors.selection }, -- Visual mode selection
        VisualNOS = { bg = colors.selection }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg = { fg = colors.diagnostics.warning }, -- warning messages
        Whitespace = { fg = colors.gutter.fg }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        WildMenu = { fg = colors.fg, bg = colors.bg }, -- current match in 'wildmenu' completion

        WinBar = "StatusLine", -- window bar
        WinBarNC = "StatusLineNC", -- window bar in inactive windows

        Bold = { bold = true, fg = colors.fg }, -- (preferred) any bold text
        Italic = { italic = true, fg = colors.fg }, -- (preferred) any italic text
        Underlined = { underline = true }, -- (preferred) text that stands out, HTML links

        Added = { fg = colors.diff.add },
        Removed = { fg = colors.diff.delete },
        Changed = { fg = colors.diff.change },

        debugBreakpoint = { fg = colors.red, reverse = true }, -- used for breakpoint colors in terminal-debug
        debugPC = { bg = colors.selection }, -- used for highlighting the current line in terminal-debug

        dosIniLabel = "@property",
        helpCommand = { fg = colors.blue },

        gitCommitSummary = { fg = colors.cyan },

        -- HTML
        htmlTag = { fg = colors.cyan },
        htmlTagN = { fg = colors.cyan },
        htmlTagName = { fg = colors.fg },
        htmlEndTag = { fg = colors.cyan },
        htmlArg = { fg = colors.purple },
        htmlH1 = { fg = colors.fg },
        htmlH2 = { fg = colors.fg },
        htmlH3 = { fg = colors.fg },
        htmlH4 = { fg = colors.fg },
        htmlH5 = { fg = colors.fg },
        htmlH6 = { fg = colors.fg },
        htmlBold = { fg = colors.orange, bold = true },
        htmlItalic = { fg = colors.yellow, italic = true },
        htmlLink = { fg = colors.green },
        htmlSpecialChar = { fg = colors.purple },
        htmlSpecialTagName = { fg = colors.cyan },
        htmlTitle = { fg = colors.fg },

        -- Markdown
        markdownH1 = { fg = colors.cyan, bold = true },
        markdownH2 = { fg = colors.purple, bold = true },
        markdownH3 = { fg = colors.blue, bold = true },
        markdownH4 = { fg = colors.orange },
        markdownH5 = { fg = colors.yellow },
        markdownH6 = { fg = colors.fg },
        markdownBold = { fg = colors.orange, bold = true },
        markdownItalic = { fg = colors.yellow, italic = true },
        markdownBlockquote = { fg = colors.yellow, italic = true },
        markdownCode = { fg = colors.fg },
        markdownCodeBlock = { fg = colors.orange },
        markdownCodeDelimiter = { fg = colors.red },
        markdownHeadingDelimiter = { fg = colors.red },
        markdownHeadingRule = { fg = colors.comment },
        markdownId = { fg = colors.purple },
        markdownIdDeclaration = { fg = colors.cyan },
        markdownIdDelimiter = { fg = colors.purple },
        markdownLinkDelimiter = { fg = colors.fg },
        markdownLinkText = { fg = colors.green },
        markdownListMarker = { fg = colors.cyan },
        markdownOrderedListMarker = { fg = colors.red },
        markdownRule = { fg = colors.comment },

        -- These groups are for the native LSP client. Some other LSP clients may
        -- use these groups, or use their own.
        LspCodeLens = { fg = colors.comment },
        LspReferenceText = { bg = colors.orange }, -- used for highlighting "text" references
        LspReferenceRead = { bg = colors.orange }, -- used for highlighting "read" references
        LspReferenceWrite = { bg = colors.orange }, -- used for highlighting "write" references
        LspSignatureActiveParameter = { bg = colors.selection },
        LspInlayHint = { fg = colors.fg_dark },
        LspInfoBorder = { fg = colors.fg, bg = colors.bg },

        -- diagnostics
        DiagnosticError = { fg = colors.diagnostics.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticWarn = { fg = colors.diagnostics.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticInfo = { fg = colors.diagnostics.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticHint = { fg = colors.diagnostics.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticUnnecessary = { fg = colors.fg_dark }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
        DiagnosticVirtualTextError = { fg = colors.diagnostics.error }, -- Used for "Error" diagnostic virtual text
        DiagnosticVirtualTextWarn = { fg = colors.diagnostics.warning }, -- Used for "Warning" diagnostic virtual text
        DiagnosticVirtualTextInfo = { fg = colors.diagnostics.info }, -- Used for "Information" diagnostic virtual text
        DiagnosticVirtualTextHint = { fg = colors.diagnostics.hint }, -- Used for "Hint" diagnostic virtual text
        DiagnosticUnderlineError = { undercurl = true, sp = colors.diagnostics.error }, -- Used to underline "Error" diagnostics
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.diagnostics.warning }, -- Used to underline "Warning" diagnostics
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.diagnostics.info }, -- Used to underline "Information" diagnostics
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.diagnostics.hint }, -- Used to underline "Hint" diagnostics
        DiagnosticSignError = { fg = colors.diagnostics.error },
        DiagnosticSignWarn = { fg = colors.diagnostics.warning },
        DiagnosticSignInfo = { fg = colors.diagnostics.info },
        DiagnosticSignHint = { fg = colors.diagnostics.hint },
        DiagnosticFloatingError = { fg = colors.diagnostics.error },
        DiagnosticFloatingWarn = { fg = colors.diagnostics.warning },
        DiagnosticFloatingInfo = { fg = colors.diagnostics.info },
        DiagnosticFloatingHint = { fg = colors.diagnostics.hint },

        -- Health
        healthError = { fg = colors.diagnostics.error },
        healthSuccess = { fg = colors.green },
        healthWarning = { fg = colors.diagnostics.warning },

        -- diff (not needed anymore?)
        diffAdded = { fg = colors.git.add },
        diffRemoved = { fg = colors.git.delete },
        diffChanged = { fg = colors.git.change },
        diffOldFile = { fg = colors.git.change },
        diffNewFile = { fg = colors.git.add },
        diffFile = { fg = colors.fg_dark },
        diffLine = { fg = colors.fg_dark },
        diffIndexLine = { fg = colors.blue },
        helpExample = { fg = colors.comment },
    }
end

return M
