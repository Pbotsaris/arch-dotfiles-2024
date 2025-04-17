local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
   return
end

local conditional = function(fn)
   local utils = require("null-ls.utils").make_conditional_utils()
   return fn(utils)
end

-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- current not using completion but this is basically snippets
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#completion
-- local completion = null_ls.builtins.completion


local sources = {
   -- formating
   formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
   formatting.black.with({ extra_args = { "--fast" } }),
   -- formatting.isort,
   formatting.clang_format,
   formatting.stylua,
   formatting.mix,
   formatting.rubocop,
   formatting.erb_format,
   formatting.prettier.with({
      extra_args = {
         "--print-width", "120",
      }

   }),
   --require("none-ls.diagnostics.eslint"), -- this requires none-ls-extras to be installed

   -- diagnostics

--   diagnostics.pylint.with({
--      diagnostics_postprocess = function(diagnostic)
--         diagnostic.code = diagnostic.message_id
--      end,
--   }),

   diagnostics.yamllint,
   diagnostics.erb_lint,
   diagnostics.dotenv_linter,
   -- elixir
   diagnostics.credo,
}

null_ls.setup({
   debug = false,
   sources = sources,

   -- Here we set a conditional to call the rubocop formatter.
   -- If we have a Gemfile in the project, we call "bundle exec rubocop", if not we only call "rubocop".
   conditional(function(utils)
      return utils.root_has_file("Gemfile")
          and null_ls.builtins.formatting.rubocop.with({
             command = "bundle",
             args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
          })
          or null_ls.builtins.formatting.rubocop
   end),
   -- Same as above, but with diagnostics.rubocop to make sure we use the proper rubocop version for the project
   conditional(function(utils)
      return utils.root_has_file("Gemfile")
          and null_ls.builtins.diagnostics.rubocop.with({
             command = "bundle",
             args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
          })
          or null_ls.builtins.diagnostics.rubocop
   end),
})
