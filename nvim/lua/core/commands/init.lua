local function create_command(name, cb)
  vim.api.nvim_create_user_command(name, cb, {})
end

local commands = {
  -- Include new commands in this table.
  -- They will be automatically created as commands.
  -- Each command module should have a `name` property and `command_fn` function attached.
  require 'core/commands/print',
  require 'core/commands/debugger',
}

for _, command in pairs(commands) do
  create_command(command.name, command.command_fn)
end
