local build_config = {
  {
    filetype = 'lua',
    build = {
      cmd = 'lua %',
      show = 'always',
      toggle = 'yes',
    },
    complexBuild = {
      cmd = 'lua %',
      show = 'error',
      toggle = 'yes',
    },
  },
  {
    filetype = 'python',
    build = {
      cmd = 'python %',
      show = 'always',
      toggle = 'yes',
    },
    complexBuild = {
      cmd = 'python %',
      show = 'error',
      toggle = 'yes',
    },
  },
  {
    filetype = 'markdown',
    build = {
      cmd = 'pandoc % -o %:t:r.pdf',
      show = 'error',
      toggle = 'no',
    },
    complexBuild = {
      cmd = 'pandoc % -o %:t:r.pdf ; zathura %:t:r.pdf',
      show = 'error',
      toggle = 'no',
    },
  },
  {
    filetype = 'yaml',
    build = {
      cmd = 'kubectl apply -f %',
      show = 'error',
      toggle = 'no',
    },
    complexBuild = {
      cmd = 'helm upgrade --install . abc',
      show = 'error',
      toggle = 'no',
    },
  },
  {
    filetype = 'sh',
    build = {
      cmd = 'bash -c %',
      show = 'always',
      toggle = 'yes',
    },
    complexBuild = {
      cmd = 'bash -c %',
      show = 'error',
      toggle = 'no',
    },
  },
  {
    filetype = 'dockerfile',
    build = {
      cmd = 'hadolint %',
      show = 'always',
      toggle = 'yes',
    },
    complexBuild = {
      cmd = 'hadolint %',
      show = 'error',
      toggle = 'no',
    },
  },
}
function Build()
  for _, config in ipairs(build_config) do
    if config.filetype == vim.bo.filetype then
      local cmd = config.build.cmd
      if config.build.show == 'always' then
        cmd = cmd .. ' ; bash -c "read -n 1 -s -r"'
      elseif config.build.show == 'error' then
        cmd = cmd .. ' || bash -c "read -n 1 -s -r"'
      elseif config.build.show == 'success' then
        cmd = cmd .. ' && bash -c "read -n 1 -s -r"'
      end

      local Terminal = require('toggleterm.terminal').Terminal
      local terminal = Terminal:new({ cmd = Expand(cmd), hidden = true })

      function ToggleBuild()
        terminal:toggle()
      end

      if config.build.toggle then
        ToggleBuild()
      end
    end
  end
end

function ComplexBuild()
  for _, config in ipairs(build_config) do
    if config.filetype == vim.bo.filetype then
      local cmd = config.complexBuild.cmd
      if config.complexBuild.show == 'always' then
        cmd = cmd .. ' ; bash -c "read -n 1 -s -r"'
      elseif config.complexBuild.show == 'error' then
        cmd = cmd .. ' || bash -c "read -n 1 -s -r"'
      elseif config.complexBuild.show == 'success' then
        cmd = cmd .. ' && bash -c "read -n 1 -s -r"'
      end

      local Terminal = require('toggleterm.terminal').Terminal
      local terminal = Terminal:new({ cmd = Expand(cmd), hidden = true })

      function ToggleComplexBuild()
        terminal:toggle()
      end

      if config.complexBuild.toggle then
        ToggleComplexBuild()
      end
    end
  end
end
