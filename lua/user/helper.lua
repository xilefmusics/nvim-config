function Expand(s)
  local idx = s:find("%%")
  while idx do
    local idx2 = idx + 1
    while s:sub(idx2, idx2) == ":" do
      idx2 = idx2 + 2
    end
    s = s:sub(0, idx - 1) .. vim.fn.expand(s:sub(idx, idx2 - 1)) .. s:sub(idx2)
    idx = s:find("%%")
  end
  return s
end
