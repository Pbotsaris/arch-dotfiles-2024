-- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)
local dap = require('dap')

dap.adapters.dart = {
    type = "executable",
    command = "node",
    args = {"/home/pedro/.config/nvim/debuggers/debug.js", "flutter"}
  }
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch flutter",
      dartSdkPath = os.getenv('HOME').."/flutter/bin/cache/dart-sdk/",
      flutterSdkPath = os.getenv('HOME').."/flutter",
      program = "${workspaceFolder}/lib/main.dart",
      cwd = "${workspaceFolder}",
    }
  }
