local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup({function()
    use {'wbthomason/packer.nvim', opt = true}
	-- colorschmee
    use 'tomasiser/vim-code-dark'
    use 'crusoexia/vim-monokai'
    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'

    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'bufferline'.setup {} end }

    use {'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup {} end }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = [[require('plugin_settings.nvim-tree')]],}
    use({
        "hoob3rt/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = [[require('plugin_settings.lualine')]],
    })
    use 'easymotion/vim-easymotion'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'preservim/nerdcommenter'

    use {
      'nvim-telescope/telescope.nvim',
      requires =  {'nvim-lua/plenary.nvim'}}

    use {'neovim/nvim-lspconfig',
    	config = [[require('plugin_settings.lsp-config')]], }

    use {'hrsh7th/nvim-compe',
    	config = [[require('plugin_settings.compe-config')]], }

    use {"ray-x/lsp_signature.nvim",
        config = function() require'lsp_signature'.setup {} end }

    use 'glepnir/lspsaga.nvim'
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'double' })
    end
  }
}})
