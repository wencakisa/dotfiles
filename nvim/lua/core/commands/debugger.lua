--
-- Debugger command
-- Inserts a debugger statement in each specified language
--

local utils = require 'core/commands/utils'

local M = { name = 'Debugger' }

function M.command()
  local debugger_statement

  if utils.is_python() then
    debugger_statement = 'import ipdb; ipdb.set_trace();'
  elseif utils.is_js() then
    debugger_statement = 'debugger'
  end

  if debugger_statement then
    utils.append_line(debugger_statement)
  end
end

return M
