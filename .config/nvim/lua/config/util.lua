local M = {}

M.find_project_root = function()
  local initial_cwd = vim.fn.getcwd()
  local current_dir = initial_cwd
  local home_dir = vim.fn.expand("$HOME")
  local max_depth = 7

  for _ = 1, max_depth do
    if
      vim.fn.isdirectory(current_dir .. "/.git") == 1
      or vim.fn.filereadable(current_dir .. "/Makefile") == 1
      or vim.fn.filereadable(current_dir .. "/init.lua") == 1
    then
      return current_dir
    end
    current_dir = vim.fn.fnamemodify(current_dir, ":h")
    if current_dir == home_dir then
      break
    end
  end
  return initial_cwd
end

return M
