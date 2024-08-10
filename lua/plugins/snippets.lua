local ls = require("luasnip")  -- Load the LuaSnip module
local s = ls.snippet           -- Define a snippet
local t = ls.text_node         -- Define a text node (static text)
local i = ls.insert_node       -- Define an insert node (dynamic text)

-- Snippets for C
ls.add_snippets("c", {
    s("main", {
        t({"#include <stdio.h>", "", "int main() {", "\t"}),
        i(1, "// Your code here"),
        t({"", "\treturn 0;", "}"})
    }),
})

-- Snippets for C++
ls.add_snippets("cpp", {
    s("main", {
        t({"#include <iostream>", "", "int main() {", "\t"}),
        i(1, "// Your code here"),
        t({"", "\treturn 0;", "}"})
    }),

    s("bits", {
        t({"#include <bits/stdc++.h>", "using namespace std;", "", "int main() {", "\t"}),
        i(1, "// Your code here"),
        t({"", "\treturn 0;", "}"})
    }),
})
