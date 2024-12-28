require("snippets.go")

local root = vim.treesitter.get_node()

while root ~= nil do
    local parent = root:parent()
    if parent == nil then
        break
    end
    root = parent
end

if root ~= nil then
    local query = vim.treesitter.query.parse("go", "(comment) @comment")
    for _, capture in query:iter_captures(root, 0) do
        local text = vim.treesitter.get_node_text(capture, 0)

        print("text: ", text:sub(3, 4))
    end
end
