require('mini.comment').setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Toggle comment (like `gcip` - comment inner paragraph) for both
    comment = '',

    -- Toggle comment on current line
    -- normal and visual modes
    comment_line = '<C-_>',

    -- Toggle comment on visual selection
    comment_visual = '<C-_>',

    -- Define 'comment' textobject (like `dgc` - delete whole comment block)
    -- Works also in Visual mode if mapping differs from `comment_visual`
    textobject = '',
  },
})
