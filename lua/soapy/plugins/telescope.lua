  -- Fuzzy Finder (files, lsp, etc)
  return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("projects")
      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
      keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "[S]earch [R]ecent Files" })
      keymap.set("n", "<leader>ss", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
      keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = '[S]earch by [W]ord' })
      keymap.set('n', '<leader>sk', "<cmd>Telescope keymaps<cr>", { desc = '[S]earch [K]eymaps' })
    end,
  }
