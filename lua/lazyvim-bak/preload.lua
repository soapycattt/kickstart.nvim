local vim = vim
local api = vim.api

-- Function to create a list of commands and convert them to autocommands
local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group_name)
    api.nvim_command 'autocmd!'
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
      api.nvim_command(command)
    end
    api.nvim_command 'augroup END'
  end
end

-- Define autocmds in a table
local autoCommands = {
  -- Highlight on yank
  -- YankHighlight = {
  --   { 'TextYankPost', '*', 'lua vim.highlight.on_yank()' },
  -- },
  --
  -- -- Other autocmds
  -- open_folds = {
  --   { 'BufReadPost,FileReadPost', '*', 'normal zR' },
  -- },

  erbFileType = {
    { 'BufRead,BufNewFile', '*.erb', 'set filetype=eruby.html' },
  },
}

-- Create augroups using the defined autocmds
nvim_create_augroups(autoCommands)
