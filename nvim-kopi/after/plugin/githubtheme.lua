local spec = {
    github_dark_high_contrast = {
        bg0 = '#000000',
        bg1 = '#000000',
        syntax = {
            -- As with palettes, a specific style's value will be used over the `all`'s value.
            number      = '#00e8d8', -- Number
            variable    = '#ffffff', -- Variable
            bracket     = '#83befd', -- Brackets and Punctuation
            comment     = '#8c8c8c', -- Comment
            string      = '#8ac2ff', -- String
            conditional = '#e59438', -- Conditional and loops
            preproc     = '#fad02c', -- Preprocessor
            builtin0    = '#ffffff', -- Builtin variables
            builtin1    = '#a37200', -- Builtin type
            builtin2    = '#ff0000', -- Builtin const
            type        = '#ffff00', -- Type
            func        = '#ffff00', -- Function names
            operator    = '#e19237', -- Operators
            const       = '#f6d242', -- Constant, imports, booleans
            field       = '#ffffff', -- Field
            keyword     = '#e19237', -- Keywords

            ident       = '#0000ff', -- Identifiers (variables, functions)
            regex       = '#0000ff', -- Regex
            statement   = '#0000ff', -- Statements
            dep         = '#ff0000', -- Deprecated
        },
    },
}
require('github-theme').setup({
    options = {
        styles = {             -- Style to be applied to different syntax groups
            comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
            functions = 'NONE',
            keywords = 'NONE',
            variables = 'NONE',
            conditionals = 'NONE',
            constants = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
            types = 'NONE',
        }
    },
    specs = spec,
})
vim.cmd('colorscheme github_dark_high_contrast')
