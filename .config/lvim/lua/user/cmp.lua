----------------------------
------- COMPLETION -------
----------------------------
-- local check_backspace = function()
--   local col = vim.fn.col "." - 1
--   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end
--Check in Manual: ":h cmp"
--   פּ ﯟ   some other good icon

local kind_icons = {
  Text = "󰅍",
  Method = "m",
  Function = "󰡱",
  Constructor = "",
  Field = "",
  Variable = "󰫧",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "󱊐",
  Struct = "",
  Event = "",
  Operator = "  ",
  TypeParameter = " ",
}

local source_icons = {
  nvim_lsp = "✔️",
  -- copilot = "📌",
  buffer = "",
  path = "",
}

-- lvim.builtin.cmp.window.documentation = false
lvim.builtin.cmp.cmdline.enable = false
lvim.builtin.cmp.window = {
  documentation = {
    border = "rounded",
    winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
  },

  completion = {
    border = "rounded",
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuThumb,Search:Error",
    side_padding = 0,
    col_offset = -4,
  },
}

lvim.builtin.cmp.snippet = {
  expand = function(args)
    require("luasnip").lsp_expand(args.body)
  end,
}

--Check in Manual: ":h cmp"
lvim.builtin.cmp.sources = {
  {name = "nvim_lsp", max_item_count = 12,  group_index = 1},
  -- {name = "copilot",  max_item_count = 4, keyword_length = 3, group_index = 1},
  {name = "buffer ", max_item_count = 5, group_index = 3},
  {name = "path", max_item_count = 5, group_index = 3},
}

lvim.builtin.cmp.formatting = {
  fields = {"menu", "abbr", "kind"},

  format = function(entry, vim_item)
    local kind = vim_item.kind
    local source = entry.source.name

    vim_item.kind = "(".. kind ..")"
    vim_item.menu = "["..source_icons[source].."]"
    vim_item.abbr = vim_item.abbr:match("[^(]+")

    if entry.source.name == "nvim_lsp" then
      vim_item.kind = kind_icons[kind].." ".."(".. kind ..")"
    -- elseif entry.source.name == "copilot" then
    --   vim_item.menu =  source_icons[source]
    --   vim_item.kind = "Copilot"
    end
    return vim_item
  end,
}

