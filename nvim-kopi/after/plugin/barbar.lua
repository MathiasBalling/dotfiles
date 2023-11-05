vim.g.barbar_auto_setup = true -- disable auto-setup
require 'barbar'.setup {
    -- WARN: do not copy everything below into your config!
    --       It is just an example of what configuration options there are.
    --       The defaults are suitable for most people.

    -- Enable/disable animations
    animation = true,

    -- Enable/disable auto-hiding the tab bar when there is a single buffer
    auto_hide = true,

    -- Enables/disable clickable tabs
    --  - left-click: go to buffer
    --  - middle-click: delete buffer
    clickable = false,

    focus_on_close = 'left',

    -- Disable highlighting alternate buffers
    highlight_alternate = false,

    -- Disable highlighting file icons in inactive buffers
    highlight_inactive_file_icons = true,

    -- Enable highlighting visible buffers
    highlight_visible = true,

    icons = {
        -- Configure the base icons on the bufferline.
        buffer_index = true,
        buffer_number = false,
        filetype = {
            -- Sets the icon's highlight group.
            -- If false, will use nvim-web-devicons colors
            custom_colors = false,
            -- Requires `nvim-web-devicons` if `true`
            enabled = true,
        },
        separator = { left = '▎', right = '' },
        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = '●' },
        pinned = { button = '車', filename = true, separator = { right = '' } },
        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = false, button = '󰐾',modified = { button = '󰐾' } },
        inactive = { button = '󰤄' },
        visible = { modified = { buffer_index = false } },
    },

    -- If true, new buffers will be inserted at the start/end of the list.
    -- Default is to insert after current buffer.
    insert_at_end = true,
    insert_at_start = false,

    -- Sets the maximum padding width with which to surround each tab
    maximum_padding = 1,

    -- Sets the minimum padding width with which to surround each tab
    minimum_padding = 1,

    -- Sets the maximum buffer name length.
    maximum_length = 30,

    -- Set the filetypes which barbar will offset itself for
    sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = { text = 'undotree' },
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify both
        Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
    },

    -- New buffer letters are assigned in this order. This order is
    -- optimal for the qwerty keyboard layout but might need adjustment
    -- for other layouts.
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

    -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
    -- where X is the buffer number. But only a static string is accepted here.
    no_name_title = "new",
}
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '‚', '<Cmd>BufferPrevious<CR>', opts)
map('n', '·', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '„', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '÷', '<Cmd>BufferMoveNext<CR>', opts)
map('n', 'π', '<Cmd>BufferPin<CR>', opts)
map('n', 'ç', '<Cmd>BufferClose!<CR>', opts)
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
