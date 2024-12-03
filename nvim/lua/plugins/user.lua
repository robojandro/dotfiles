return {
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim"
	},
	{
		"FabijanZulj/blame.nvim"
	},
	{
		"ojroques/nvim-osc52"
		-- https://github.com/ojroques/nvim-osc52
		--
    -- In normal mode, <leader>c is an operator that will copy the given text to the clipboard.
    -- In normal mode, <leader>cc will copy the current line.
    -- In visual mode, <leader>c will copy the current selection.
	},
	{                           
		"leoluz/nvim-dap-go",
		--lazy = false,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		event = "User AstroFile",
	},
	{
  	"ray-x/go.nvim",
  	dependencies = {  -- optional packages
    	"ray-x/guihua.lua",
    	"neovim/nvim-lspconfig",
    	"nvim-treesitter/nvim-treesitter",
    	"theHamsta/nvim-dap-virtual-text",
  	},
  	config = function()
    	require("go").setup()
  	end,
  	event = {"CmdlineEnter"},
  	ft = {"go", 'gomod'},
  	build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},
	{
  	"folke/noice.nvim",
  	event = "VeryLazy",
  	-- config.lsp.signature.enabled = false, where should this go?
  	opts = {
    	-- add any options here
			lsp = {
        signature = {
					enabled = false,
				},
        hover = {
					enabled = false,
				},
      },
  	},
  	dependencies = {
    	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    	"MunifTanjim/nui.nvim",
    	-- OPTIONAL:
    	--   `nvim-notify` is only needed, if you want to use the notification view.
    	--   If not available, we use `mini` as the fallback
    	"rcarriga/nvim-notify",
    	}
	},
	{
  	"rcarriga/nvim-notify",
  	opts = {
    	--level = 3,
    	level = 2,
    	stages = "static",
    	--render = "minimal",
    	render = "wrapped-compact",
  	},
	},
}
