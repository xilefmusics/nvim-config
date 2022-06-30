local status_ok, project_nvim = pcall(require, "project_nvim")
if not status_ok then
  vim.api.nvim_echo({ { "project_nvim failed to load", "None" } }, false, {})
  return
end
project_nvim.setup({})


local status_ok2, telescope = pcall(require, "telescope")
if not status_ok2 then
  return
end

telescope.load_extension('projects')
