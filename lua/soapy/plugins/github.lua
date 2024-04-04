return {
  'pwntester/octo.nvim',
  event = "VeryLazy",
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup {
      suppress_missing_scope = {
        project_v2 = true,
      }
    }
  end
}
