return {
    'sheerun/vim-polyglot',
    config = function ()
        vim.g.javascript_conceal_function = "ƒ"
        vim.g.javascript_conceal_null = "ø"
        vim.g.javascript_conceal_this = "@"
        vim.g.javascript_conceal_return = "↪"
        vim.g.javascript_conceal_undefined = "¿"
        vim.g.javascript_conceal_NaN = "ℕ"
        vim.g.javascript_conceal_static = "•"
        vim.g.javascript_conceal_super = "Ω"
        vim.g.javascript_conceal_arrow_function = "⇒"
        vim.g.javascript_conceal_noarg_arrow_function = "ƒ"
        vim.g.javascript_conceal_underscore_arrow_function = "ƒ"
        vim.g.javascript_conceal_double_equal = "≈"
        vim.g.javascript_conceal_triple_equal = "≡"
        vim.g.javascript_conceal_or_operator = "∨"
        vim.g.javascript_conceal_and_operator = "∧"
        vim.g.javascript_conceal_greater_equal_operator = "≥"
        vim.g.javascript_conceal_less_equal_operator = "≤"
        vim.g.javascript_conceal_not_equal_operator = "≠"
        vim.g.javascript_conceal_not_strict_equal_operator = "≢"
    end,
}
