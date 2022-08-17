local print_command = require 'core/commands/print'
local debugger_command = require 'core/commands/debugger'

function create_command(name, cb)
  vim.api.nvim_create_user_command(name, cb, {})
end

-- TODO: Maybe automate this
create_command(print_command.name, print_command.command)
create_command(debugger_command.name, debugger_command.command)
