vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


-- Custom
vim.keymap.set('n', '<Up>', '<Nop>', { noremap = true  })
vim.keymap.set('n', '<Down>', '<Nop>', { noremap = true  })
vim.keymap.set('n', '<Left>', '<Nop>', { noremap = true  })
vim.keymap.set('n', '<Right>', '<Nop>', { noremap = true  })

vim.keymap.set('i', '<Up>', '<Nop>', { noremap = true  })
vim.keymap.set('i', '<Down>', '<Nop>', { noremap = true  })
vim.keymap.set('i', '<Left>', '<Nop>', { noremap = true  })
vim.keymap.set('i', '<Right>', '<Nop>', { noremap = true  })


vim.keymap.set('v', '<Up>', '<Nop>', { noremap = true  })
vim.keymap.set('v', '<Down>', '<Nop>', { noremap = true  })
vim.keymap.set('v', '<Left>', '<Nop>', { noremap = true  })
vim.keymap.set('v', '<Right>', '<Nop>', { noremap = true  })

vim.opt.mouse = ""


