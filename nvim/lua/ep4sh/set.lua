vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.foldmethod = 'indent'
vim.opt.encoding = 'utf-8'
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.undodir = '/tmp/.vim/undodir'
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.autochdir = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.cmdheight = 3
vim.opt.clipboard = "unnamedplus"
---- Emoji
vim.cmd('abb :done: ✅ ')
vim.cmd('abb :todo: ⭕️')
vim.cmd('abb :ok: 👌')
vim.cmd('abb :love: ❤️')
vim.cmd('abb :mad: 🤬')
----------------------------------
vim.opt.scrolloff = 8
vim.opt.backspace = 'indent,eol,start'
vim.opt.clipboard = 'unnamedplus,unnamed'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.o.termguicolors = true
