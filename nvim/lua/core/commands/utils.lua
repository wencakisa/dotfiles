--
-- Utility functions used in custom commands
--

local api = vim.api
local buffer_options = vim.bo

local M = {}

function M.is_lua()
  return buffer_options.filetype == 'lua'
end

function M.is_python()
  return buffer_options.filetype == 'python'
end

function M.is_js()
  local filetype = buffer_options.filetype

  return filetype == 'javascript'
      or filetype == 'typescript'
      or filetype == 'javascriptreact'
      or filetype == 'typescriptreact'
end

function M.append_line(content)
  api.nvim_feedkeys('o', 'n', true)
  api.nvim_feedkeys(content, 'm', true)

  local esc_key = api.nvim_replace_termcodes('<Esc>', true, false, true)
  api.nvim_feedkeys(esc_key, 'm', true)
end

return M
