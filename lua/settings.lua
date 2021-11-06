-- Global Settings Configuration --
--
-- Aliases begin --

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt
-- Aliases end --


-- Main options begin --
opt.number = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
-- Main options end --
-- Gutentag options begin --
g.gutentags_trace = false
g.gutentags_add_default_project_roots = false
g.gutentags_project_root = {'package.json', '.git'}
g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/ctags/')
g.gutentags_generate_on_new = true
g.gutentags_generate_on_missing = true
g.gutentags_generate_on_write = true
g.gutentags_generate_on_empty_buffer = true
cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
g.gutentags_ctags_extra_args = {'--tag-relative=yes', '--fields=+ailmnS', }

local statusline = require('statusline')
statusline.tabline = false

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}



local cmp = require 'cmp'
cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', opts = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
           },
        },
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      }),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
   },
}

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

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
--require('telescope').setup{ defaults = { file_ignore_patterns = {'.Ggit/'} } }
local telescope = require("telescope")
telescope.setup {
    defaults = {
        file_sorter = require "telescope.sorters".get_fzy_sorter,
        generic_sorter = require "telescope.sorters".get_fzy_sorter,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--ignore-file"
        },
        file_ignore_patterns = {
            ".cache/.*",
            ".idea/.*",
            "dist/.*",
            ".git/.*"
        },
    }
}
