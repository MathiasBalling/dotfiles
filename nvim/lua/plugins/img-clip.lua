return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    filetypes = {
      typst = {
        use_absolute_path = false,
        relative_to_current_file = true, ---@type boolean | fun(): boolean
        prompt_for_file_name = true, ---@type boolean | fun(): boolean
        show_dir_path_in_prompt = true, ---@type boolean | fun(): boolean
        insert_mode_after_paste = false, ---@type boolean | fun(): boolean

        template = [[
    #figure(
      image("$FILE_PATH", width: 80%),
      caption: [$CURSOR],
    )
        ]],
      },
    },
  },
  keys = {
    -- suggested keymap
    { "<M-v>", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
