
local keymap = vim.api.nvim_set_keymap -- shorten

-- NOTE: that cpm mappings are in lua/cpm.lua

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- copilot
keymap('i', '<C-c>', 'copilot#Accept("<CR>")', { noremap = false, silent = true, expr= true })

-- splits
keymap('n', 'sp', ':sp<CR>', { noremap = true })
keymap('n', 'vs', ':vs<CR>', { noremap = true })

-- resize splits
keymap('n', '<C-Left>', '<C-w><', {})
keymap('n', '<C-Right>', '<C-w>>', {})
keymap('n', '<C-Up>', '<C-w>+', {})
keymap('n', '<C-Down>', '<C-w>-', {})

-- cycle buffers
keymap('n',"<C-n>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})

-- tabs
keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
keymap('n', 'to', ':tabo<CR>', { noremap = true })

-- search pattern
keymap('n', '<C-S>', ':%s/', { noremap = true })
keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

-- J does not move cursor
keymap('n', 'J', "mzJ'z", { noremap = true })

-- Y (Yank till end of line)
keymap('n', 'Y', 'y$', {noremap = true})

-- move line up
keymap('n','<c-k>', '<Esc>:m .-2<CR>==', {noremap = true})
keymap('i','<c-k>', '<Esc>:m .-2<CR>==', {noremap = true})
keymap('v','K', ":m '>-2<CR>gv=gv", {noremap = true})

-- move line down
keymap('n','<c-j>', '<Esc>:m .+1<CR>==', {noremap = true})
keymap('i','<c-j>', '<Esc>:m .+1<CR>==', {noremap = true})
keymap('v','J', ":m '>+1<CR>gv=gv", {noremap = true})

-- undo breakpoints
keymap('i', ',', ',<c-g>u', {noremap = true})
keymap('i', '.', '.<c-g>u', {noremap = true})
keymap('i', '(', '(<c-g>u', {noremap = true})
keymap('i', '[', '[<c-g>u', {noremap = true})
keymap('i', '{', '{<c-g>u', {noremap = true})

-- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)

-- debugger
keymap('n', '<c-b>', ":lua require'dap'.toggle_breakpoint()<CR>",{noremap = true})
keymap('n', '<c-c>', ":lua require'dap'.continue() <CR>", {noremap = true})
keymap('n', '<c-o>', ":lua require'dap'.step_over() <CR>", {noremap = true})
keymap('n', '<c-i>', ":lua require'dap'.step_into() <CR>", {noremap = true})
keymap('n', '<c-d>', ":lua require'dap'.repl.open() <CR>", {noremap = true})


-- n centers with z
keymap('n', 'n', 'nzzzv', {noremap = true})
keymap('n', 'N', 'Nzzzv', {noremap = true})

keymap('n', '<c-{>', 'ysiw}', {noremap = true})

-- lsp
  vim.keymap.set( "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  vim.keymap.set( "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  vim.keymap.set( "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  vim.keymap.set( "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  vim.keymap.set( "n", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  vim.keymap.set( "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  vim.keymap.set( "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  vim.keymap.set( "n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>")

 -- vikeymap_setap(bufnr, "n", "<leader>p", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.keymap.set( "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>')
  vim.keymap.set( "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>')
  vim.keymap.set( "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>')
  vim.keymap.set( "n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>")


  -- write a kepmap that change the background color of current line
  vim.keymap.set( "n", "<leader>l", "<cmd>lua vim.diagnostic.setloclist()<CR>")

