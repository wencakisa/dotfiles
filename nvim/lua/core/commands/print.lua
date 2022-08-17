--
-- Print command
-- Inserts a print statement in each specified language
--

local utils = require 'core/commands/utils'

local M = { name = 'Print' }

function M.command_fn()
  local print_function

  if utils.is_lua() or utils.is_python() then
    print_function = 'print'
  elseif utils.is_js() then
    print_function = 'console.log'
  end

  if print_function then
    local current_word = vim.call('expand', '<cword>')
    utils.append_line(print_function .. '(\'' .. current_word .. ': \', ' .. current_word .. ')')
  end
end

return M
