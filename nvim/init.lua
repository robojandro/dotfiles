if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

for _, source in ipairs {
  "astronvim.bootstrap",
  "astronvim.options",
  "astronvim.lazy",
  "astronvim.autocmds",
  "astronvim.mappings",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
  if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
    require("astronvim.utils").notify(
      ("Error setting up colorscheme: `%s`"):format(astronvim.default_colorscheme),
      vim.log.levels.ERROR
    )
  end
end

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)

vim.cmd "set nornu"
vim.cmd "set expandtab"
vim.cmd "set shiftwidth=4"
vim.cmd "set softtabstop=4"
vim.cmd "set tabstop=4"
vim.cmd "set wrap"
--vim.cmd "hi Search guibg=LightBlue"
vim.cmd "hi Search guibg=darkorchid4"
--vim.opt.guicursor = "" 
vim.opt.guicursor = "n-v-c-sm:block,i:block-blinkwait175-blinkoff150-blinkon175,r-cr-o:hor20" 

-- set foldcolumn=0, since I don't currently use them
vim.cmd("set foldcolumn=0")
-- set sign column to auto, other values are yes and no
vim.cmd("set scl=auto")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("setIndent", { clear = true })
autocmd("Filetype", {
   group = "setIndent",
   pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
   command = "setlocal shiftwidth=2 tabstop=2",
})

-- get rid of the pipe character normally used for indents
require("ibl").setup {
  indent = { char = "" },
}

-- turn off hiding of backticks
--vim.cmd("set conceallevel=0")

-- allow markdown fencing in other than markdown filetypes
--vim.g.markdown_fenced_languages = { "css", "javascript","json=javascript", "perl", "xml", "python", "sql", "make", "typescript", "go" }

-- don't automatically display line numbers on text/markdown files
augroup("setLineNumbering", { clear = true })

autocmd("Filetype", {
   group = "setLineNumbering",
   pattern = { "text", "markdown", "lua" },
   command = "setlocal nonu",
})

require('blame').setup()

--vim.api.nvim_set_hl(0, "Search", { guibg=LightBlue })

--vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(require("noice.lsp.hover").on_hover, { border = "rounded" })
--vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(require("noice.lsp.signature_help"), { border = "rounded" })

--vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
--vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
--vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)

--on_attach = function(client, bufnr)
--  vim.keymap.set('n', 'gv', function()
--    vim.cmd([[
--  vsplit
--]]) vim.lsp.buf.definition()
--  end, bufopts)
--

--vim.g.clipboard = {
--  name = 'OSC 52',
--  copy = {
--    ['+'] = require('vim.clipboard.osc52').copy,
--    ['*'] = require('vim.clipboard.osc52').copy,
--  },
--  paste = {
--    ['+'] = require('vim.clipboard.osc52').paste,
--    ['*'] = require('vim.clipboard.osc52').paste,
--  },
--}

local map = vim.api.nvim_set_keymap

map('n', '<LEADER>gd', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', {noremap=true, silent=true})

--vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)

-- vim.diagnostic.config({virtual_text = false})
-- require("lsp_lines").setup()
-- vim.keymap.set(
--   "",
--   "<Leader>l",
--   require("lsp_lines").toggle,
--   { desc = "Toggle lsp_lines" }
-- )
