-- All commands are mapped to shortcuts in `mappings.lua`

local api = vim.api

function print_command()
  local print_function
  local filetype = vim.bo.filetype

  if filetype == 'lua' or filetype == 'python' then
    print_function = 'print'
  elseif
    filetype == 'javascript'
    or filetype == 'typescript'
    or filetyle == 'javascriptreact'
    or filetype == 'typescriptreact'
  then
    print_function = 'console.log'
  end

  if print_function then
    local current_line = api.nvim_win_get_cursor(0)[1]
    local current_word = vim.call('expand', '<cword>')
    vim.call('append', current_line, print_function .. '(\'' .. current_word .. ': \', ' .. current_word .. ')')
  end
end

api.nvim_create_user_command('Print', print_command, { nargs = 0 })
