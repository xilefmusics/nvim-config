  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    vim.api.nvim_echo({ { "comment failed to load", "None" } }, false, {})
    return
end

comment.setup {
    padding = true,
    sticky = true,
    ignore = nil,
    mappings = {
        basic = false,
        extra = false,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
}
