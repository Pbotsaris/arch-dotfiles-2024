require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'terafox',
     globalstatus = false,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {{'mode', padding = 2}},
	  lualine_b = {{'branch', 'diff', 'diagnostics', padding = 2}},
    lualine_c = {{'filename', padding = 2, path = 1}},
    lualine_x = {'encoding', '', 'filetype'},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
