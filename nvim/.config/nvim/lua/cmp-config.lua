local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
   return
end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
   return
end

require("luasnip/loaders/from_vscode").lazy_load()

--   פּ ﯟ   some other good icons
local kind_icons = {
   Text = "",
   Method = "m",
   Function = "",
   Constructor = "",
   Field = "",
   Variable = "",
   Class = "",
   Interface = "",
   Module = "",
   Property = "",
   Unit = "",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "",
   Event = "",
   Operator = "",
   TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- checks if the cursor is at the beginning of the line or if the character before the cursor is a space
local check_backspace = function()
   local col = vim.fn.col(".") - 1
   return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- these functiona are called when tab or shift-tab are pressed
-- they help with navigating the completion menu
-- the fallback function is called if the tab or shift-tab is not handled by cmp

local tab_mapping_callback = function(fallback)
   if cmp.visible() then
      cmp.select_next_item()
   elseif luasnip.expandable() then
      luasnip.expand()
   elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
   elseif check_backspace() then
      fallback()
   else
      fallback()
   end
end

local shift_tab_mapping_callback = function(fallback)
   if cmp.visible() then
      cmp.select_prev_item()
   elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
   else
      fallback()
   end
end

-- cpm mappings (only available in insert mode during completion)
local mappings = {
   ["<C-k>"] = cmp.mapping.select_prev_item(),
   ["<C-j>"] = cmp.mapping.select_next_item(),
   ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
   ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
   ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
   ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
   ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
   }),
   -- Accept currently selected item. If none selected, `select` first item.
   ["<CR>"] = cmp.mapping.confirm({ select = true }),
   ["<Tab>"] = cmp.mapping(tab_mapping_callback, { "i", "s" }),
   ["<S-Tab>"] = cmp.mapping(shift_tab_mapping_callback, { "i", "s" }),
}

--
local formatting = {
   fields = { "kind", "abbr", "menu" },
   format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
         nvim_lsp = "[LSP]",
         nvim_lua = "[NVIM_LUA]",
         luasnip = "[Snippet]",
         buffer = "[Buffer]",
         path = "[Path]",
      })[entry.source.name]
      return vim_item
   end,
}

local compare = cmp.config.compare

-- SETUP
cmp.setup({
   snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
   },
   mapping = mappings,
   formatting = formatting,
   sources = {
      { name = "nvim_lsp", priority = 100 },
      { name = "nvim_lua", priority = 90 },
      { name = "luasnip",  priority = 80 },
      { name = "path",     priority = 70 },
      { name = "buffer",   priority = 60 },
   },

   sorting = {
      priority_weight = 1.0,
      comparators = {
         compare.score,
         compare.recently_used,
         compare.locality,
      },
   },

   confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
   },
   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
   },
})
