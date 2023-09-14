
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "clang-format", filetypes = {"cpp", "c", "h", "hpp"} },
-- }

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup{
--   { command = "cpplint", filetypes = {"cpp", "c", "h", "hpp"}},
-- }

-- -- Add offsetEncoding property in common_capabilities as locally for Clangd
-- local capabilities = require"lvim.lsp".common_capabilities()
-- capabilities.offsetEncoding = {"utf-16"}

-- local lsp_manager = require "lvim.lsp.manager"
-- lsp_manager.setup("clangd", {
--   capabilities = capabilities,
--   on_init = require "lvim.lsp".common_on_init,
--   on_attach = require "lvim.lsp".common_on_attach
-- })

local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'
local root_pattern = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")

pcall(function()
  configs.clangd.setup {
    default_config = util.utf8_config {
      cmd = {"clangd", "--background-index"};
      filetypes = {"c", "cpp", "objc", "objcpp"};
      root_dir = function(fname)
        local filename = util.path.is_absolute(fname) and fname
          or util.path.join(vim.loop.cwd(), fname)
        return root_pattern(filename) or util.path.dirname(filename)
      end;
    };
  docs = {
    description = [[
https://clang.llvm.org/extra/clangd/Installation.html

**NOTE:** Clang >= 9 is recommended! See [this issue for more](https://github.com/neovim/nvim-lsp/issues/23).

clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) specified
as compile_commands.json or, for simpler projects, a compile_flags.txt.
]];
    default_config = {
      root_dir = [[root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname]];
      on_init = [[function to handle changing offsetEncoding]];
      capabilities = [[default capabilities, with offsetEncoding utf-8]];
    };
  };
}
end)

