local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local snips = require("go.snips")
local log = require("go.utils").log
local events = require("luasnip.util.events")

-- stylua: ignore start
local snippets = {

-- If error
  ls.s(
    { trig = "ife", name = "If error, choose me!", dscr = "If error, return wrapped with dynamic node" },
    fmt("if {} != nil {{\n\treturn {}\n}}\n{}", {
      ls.i(1, "err"),
      ls.d(2, snips.make_return_nodes, { 1 }, { user_args = { { "a1", "a2" } } }),
      ls.i(0),
    }),
    in_fn
  ),

 -- If call error
  ls.s(
    { trig = "ifc", name = "if call", dscr = "Call a function and check the error" },
    fmt(
      [[
        {val}, {err1} := {func}({args})
        if {err2} != nil {{
          return {err3}
        }}
        {finally}
      ]], {
        val     = ls.i(1, { "val" }),
        err1    = ls.i(2, { "err" }),
        func    = ls.i(3, { "func" }),
        args    = ls.i(4),
        err2    = rep(2),
        err3    = ls.d(5, snips.make_return_nodes, { 2 }),
        finally = ls.i(0),
    }),
    snips.in_fn
  ),
}

log('creating snippet')

ls.add_snippets("go", snippets)
