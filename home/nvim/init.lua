-- [[ Configure basic options ]]
vim.g.mapleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = 'yes'
vim.o.foldmethod = 'marker'
vim.o.clipboard = 'unnamedplus'

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.tgc = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight the line where the cursor is on
vim.o.scrolloff = 10

-- Don't show <tab> and trailing spaces
vim.o.list = false

vim.o.pumheight = 7
vim.o.pummaxwidth = 80
vim.o.pumborder = "single"

-- [[ Set up keymaps ]]

vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

vim.keymap.set({ 'n' }, '<leader>o', ':update<CR>:source<CR>')
vim.keymap.set({ 'n' }, '<leader>w', ':write<CR>')
vim.keymap.set({ 'n' }, '<leader>q', ':quit<CR>')
vim.keymap.set({ 'n' }, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({ 'n' }, '<leader>lr', ':lsp restart<CR>')
vim.keymap.set({ 'n' }, '<leader>lh', ':checkhealth vim.lsp<CR>')
vim.keymap.set({ 'n' }, '<leader>ld', ":Pick lsp scope='document_symbol'<CR>")
vim.keymap.set({ 'n' }, '<leader>lw', ":Pick lsp scope='workspace_symbol_live'<CR>")
vim.keymap.set({ 'n' }, '<leader>ya', ":%y<CR>")
vim.keymap.set({ 'n' }, '<leader>f', ':Pick files<CR>')
vim.keymap.set({ 'n' }, '<leader>h', ':Pick help<CR>')
vim.keymap.set({ 'n' }, '<leader>/', ':Pick grep_live<CR>')
vim.keymap.set({ 'n' }, '<leader>b', ':Pick buffers<CR>')
vim.keymap.set({ 'n' }, '<leader>e', "<CMD>Oil<CR>")


-- [[ Basic Auto Commands ]].

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.hl_op()
    end,
})

-- See: https://github.com/LazyVim/LazyVim/discussions/2184
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - "o"
    end,
})

-- [[ Plugins ]]


require('mini.ai').setup()
require('mini.extra').setup()
require('mini.surround').setup()
require('mini.pairs').setup()
require('mini.pick').setup()
require('oil').setup()
require('kanso').setup()

vim.cmd.colorscheme('kanso')

-- [[ LSP ]]

vim.lsp.enable({
    'clangd',
    'nixd',
    'ruff',
    'ty',
    'lua_ls',
    'gopls',
    'tinymist',
    'ocamllsp',
    'fish_lsp',
    'harper_ls',
    'ols',
    'hls',
    'tsc',
    'biome',
})

vim.lsp.config('clangd', {
    init_options = {
        fallbackFlags = { '--std=c++23' },
    },
})


vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            }
        }
    }
})
