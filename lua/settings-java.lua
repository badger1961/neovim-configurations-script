-- Global Settings Configuration --
--
-- Aliases begin --

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt


local config = {
  cmd = {
    'c:\\toolchains\\java\\jdk11.0.8\\bin\\java.exe',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-noverify',
    '-Xmx1G',
    '-jar ./plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar',
    '-configuration ./config_win',
    '-data c:\\temp',
    '--add-modules=ALL-SYSTEM',
    '--add-opens java.base/java.util=ALL-UNNAMED',
    '--add-opens java.base/java.lang=ALL-UNNAMED'
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})
}
require('jdtls').start_or_attach(config)
