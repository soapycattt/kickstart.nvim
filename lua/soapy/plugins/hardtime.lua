return {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = {
      restriction_mode= "hint",
      restricted_keys = {
         ["+"] = { "n", "x" },
         ["gj"] = { "n", "x" },
         ["gk"] = { "n", "x" },
         ["<CR>"] = { "n", "x" },
         ["<C-M>"] = { "n", "x" },
         ["<C-N>"] = { "n", "x" },
         ["<C-P>"] = { "n", "x" },
      },
      disabled_keys = {
         ["<Up>"] = {},
         ["<Down>"] = {},
         ["<Left>"] = {},
         ["<Right>"] = {},
      }
   }
}
