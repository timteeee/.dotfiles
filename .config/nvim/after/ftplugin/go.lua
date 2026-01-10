require("luasnip.session.snippet_collection").clear_snippets("go")

local ls = require("luasnip")
local t = require("luasnip.nodes.textNode").T
local i = require("luasnip.nodes.insertNode").I
local c = require("luasnip.nodes.choiceNode").C
local d = require("luasnip.nodes.dynamicNode").D
local sn = require("luasnip.nodes.snippet").SN
local fmta = require("luasnip.extras.fmt").fmta

---@class Context
---@field index number

---@param text string
---@return boolean
local function zero_val_is_nil(text)
    local is_ptr = string.find(text:sub(1, 1), "*", 1, true) ~= nil
    local is_slice = string.find(text:sub(1, 2), "[]", 1, true) ~= nil
    local is_map = string.find(text:sub(1, 3), "map", 1, true) ~= nil
    local is_chan = string.find(text:sub(1, 4), "chan", 1, true) ~= nil
    local is_func = string.find(text:sub(1, 4), "func", 1, true) ~= nil
    local is_any = text == "any"
    local is_empty_interface = text == "interface{}"

    return is_ptr or is_func or is_slice or is_map or is_chan or is_any or is_empty_interface
end

local primitive_types = {
    int = "0",
    int8 = "0",
    int16 = "0",
    int32 = "0",
    int64 = "0",
    int128 = "0",
    uint = "0",
    uint8 = "0",
    uint16 = "0",
    uint32 = "0",
    uint64 = "0",
    uint128 = "0",
    uintptr = "0",
    byte = "0",
    rune = "0",
    float32 = "0.0",
    float64 = "0.0",
    complex64 = "0 + 0i",
    complex128 = "0 + 0i",
    bool = "false",
    string = "",
}

---@param ctx Context
---@return vim.snippet.Node
local function error_node(ctx)
    ctx.index = ctx.index + 1

    return c(ctx.index, {
        t("err"),
        sn(nil, fmta('fmt.Errorf("<context>: %w", err)', { context = i(1) })),
    })
end

---@param ctx Context
---@param text string
---@return vim.snippet.Node
local function struct_or_interface_node(ctx, text)
    ctx.index = ctx.index + 1

    return c(ctx.index, {
        t(text .. "{}"),
        t(text),
        t("nil"),
    })
end

---@param ctx Context
---@param text string
---@return vim.snippet.Node
local function transform_text_to_node(ctx, text)
    if primitive_types[text] then
        return t(primitive_types[text])
    end

    if text == "error" then
        return error_node(ctx)
    end

    if zero_val_is_nil(text) then
        return t("nil")
    end

    return struct_or_interface_node(ctx, text)
end

---@param node TSNode
---@param ctx Context
---@return vim.snippet.Node[]
local function handle_type_idenitifier(node, ctx)
    local text = vim.treesitter.get_node_text(node, 0)
    return { transform_text_to_node(ctx, text) }
end

---@param node TSNode
---@param ctx Context
---@return vim.snippet.Node[]
local function handle_parameter_list(node, ctx)
    local results = {}

    local count = node:named_child_count()
    for idx = 0, count - 1 do
        local child = assert(node:named_child(idx), "there should be a node")
        local type_node = child:field("type")[1]
        local text = vim.treesitter.get_node_text(type_node, 0)

        table.insert(results, transform_text_to_node(ctx, text))
        if idx ~= count - 1 then
            table.insert(results, t(", "))
        end
    end

    return results
end

---@return vim.snippet.Node[]
local function create_return_value_node()
    local func_types = {
        function_declaration = true,
        method_declaration = true,
        func_literal = true,
    }

    -- find node of the function that the cursor is in
    local node = vim.treesitter.get_node()
    while node ~= nil do
        if func_types[node:type()] then
            break
        end

        node = node:parent()
    end

    if not node then
        vim.notify("Not inside of a function")
        return t("")
    end

    local ctx = { index = 0 }
    local query = assert(vim.treesitter.query.get("go", "function_return_type"), "missing function return type treesitter query")
    for _, capture in query:iter_captures(node, 0) do
        local return_type = capture:type()

        if return_type == "type_identifier" then
            return handle_type_idenitifier(node, ctx)
        elseif return_type == "parameter_list" then
            return handle_parameter_list(node, ctx)
        end
    end

    return {}
end

ls.add_snippets("go", {
    ls.snippet(
        "iferr",
        fmta(
            [[
if err != nil {
    return <result>
}
<finish>
]],
            {
                result = d(1, function()
                    return sn(nil, create_return_value_node())
                end),
                finish = i(0),
            }
        )
    ),
})
