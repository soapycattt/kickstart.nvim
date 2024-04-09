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
          -- configure to use ripgrep
          vimgrep_arguments = {
            "rg",
            "--follow",        -- Follow symbolic links
            "--hidden",        -- Search for hidden files
            "--no-heading",    -- Don't group matches by each file
            "--with-filename", -- Print the file path with the matched lines
            "--line-number",   -- Show line numbers
            "--column",        -- Show column numbers
            "--smart-case",    -- Smart case search

            -- Exclude some patterns from search
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
            "--glob=!**/.venv",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            -- needed to exclude some files & dirs from general search
            -- when not included or specified in .gitignore
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob=!**/.git/*",
              "--glob=!**/.idea/*",
              "--glob=!**/.vscode/*",
              "--glob=!**/build/*",
              "--glob=!**/dist/*",
              "--glob=!**/yarn.lock",
              "--glob=!**/package-lock.json",
              "--glob=!**/.venv",
            },
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("projects")
      telescope.load_extension("repo")
      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "[S]earch [R]ecent Files" })
      keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "[S]earch [B]uffers" })
      keymap.set("n", "<leader>ss", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
      keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = '[S]earch by [W]ord' })
      keymap.set('n', '<leader>sk', "<cmd>Telescope keymaps<cr>", { desc = '[S]earch [K]eymaps' })
    end,
  }
