-- Setup lsp-zero and nvim-cmp
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})

	-- Auto-format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_clear_autocmds({ group = vim.api.nvim_create_augroup("LspFormatting", {}), buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.format({ async = false }) end
		})
	end
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'clangd',          -- C++
		'html',            -- HTML
		'pyright',         -- Python
		'tsserver',        -- JavaScript, TypeScript
		'eslint',          -- JavaScript, TypeScript (linting)
		'cssls',           -- CSS
		'tailwindcss',     -- TailwindCSS
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({
				capabilities = require('cmp_nvim_lsp').default_capabilities(),
				on_attach = lsp_zero.on_attach,
			})
		end,
	},
})

-- Setup nvim-cmp
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Remap Enter key to confirm the selection
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- Setup nvim-autopairs
require('nvim-autopairs').setup{}

-- Integration with nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
'confirm_done',
cmp_autopairs.on_confirm_done()
)

