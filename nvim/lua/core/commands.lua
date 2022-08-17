--
-- All commands are mapped to shortcuts in `mappings.lua`
--

--
-- Utility functions used in custom commands
--

local api = vim.api

local function is_lua()
  return vim.bo.filetype == 'lua'
end

local function is_python()
  return vim.bo.filetype == 'python'
end

local function is_js()
  local filetype = vim.bo.filetype

  return filetype == 'javascript'
    or filetype == 'typescript'
    or filetyle == 'javascriptreact'
    or filetyle == 'typescriptreact'
end

local function append_line(content)
  api.nvim_feedkeys('o', 'n', true)
  api.nvim_feedkeys(content, 'm', true)

  local esc_key = api.nvim_replace_termcodes('<Esc>', true, false, true)
  api.nvim_feedkeys(esc_key, 'm', true)
end

--------------------------------------------------------------------------

--
-- Print command
-- Inserts a print statement in each specified language
--

function print_command()
  local print_function

  if is_lua() or is_python() then
    print_function = 'print'
  elseif is_js() then
    print_function = 'console.log'
  end

  if print_function then
    local current_word = vim.call('expand', '<cword>')
    append_line(print_function .. '(\'' .. current_word .. ': \', ' .. current_word .. ')')
  end
end

api.nvim_create_user_command('Print', print_command, { nargs = 0 })

--------------------------------------------------------------------------

--
-- Debugger command
-- Inserts a debugger statement in each specified language
--

function debugger_command()
  local debugger_statement

  if is_python() then
    debugger_statement = 'import ipdb; ipdb.set_trace();'
  elseif is_js() then
    debugger_statement = 'debugger'
  end

  if debugger_statement then
    append_line(debugger_statement)
  end
end

api.nvim_create_user_command('Debugger', debugger_command, { nargs = 0 })

--------------------------------------------------------------------------
