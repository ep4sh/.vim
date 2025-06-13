vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--vim.opt.pastetoggle=<F12> --pasting from Internet

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- always be on the screen middle when CTRL-U/CTRL-D listing
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- forbid the kbd arrows :)
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

-- save the buffer when cropping
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- moving across buffers
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Formats LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Undo tree
vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")

-- set temporary wrap
vim.keymap.set("n", "<leader>pw", ":set wrap!<CR>")

-- resize a buf
vim.keymap.set("n", "<leader>=", ":vertical resize +30<CR>")
vim.keymap.set("n", "<leader>-", ":vertical resize -30<CR>")

-- moving across tabs
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")

-- New tab/buf
vim.keymap.set("n", "<C-n>", ":tabnew<CR>")
vim.keymap.set("n", "<leader>v", ":vsp<CR>")

-- Show file browser
vim.keymap.set("n", "<leader>S", ":Gitsigns blame_line<CR>")

-- Show file browser
vim.keymap.set("n", "<leader>ee", ":Ex<CR>")

-- Stolen remaps
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Copies into system clip
vim.keymap.set("n", "<leader>Y", [["+Y]])


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Go format and import on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.keymap.set('n', '<leader>er', "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- nvim-spectre keymaps
vim.keymap.set('n', '<leader>s', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
