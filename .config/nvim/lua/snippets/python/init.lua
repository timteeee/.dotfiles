require("luasnip.session.snippet_collection").clear_snippets("python")

local ls = require("luasnip")

ls.add_snippets("python", {
    ls.parser.parse_snippet("ifname", 'if __name__ == "__main__":\n\t$0'),
})
