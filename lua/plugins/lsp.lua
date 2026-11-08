require("mason").setup {}

-- Completion capabilities for every server mason-lspconfig enables.
vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- lsp-zero applies this callback on LspAttach.
require("lsp-zero").on_attach(function(_, bufnr) require("lsp-zero").default_keymaps { buffer = bufnr } end)

require("mason-lspconfig").setup {
    ensure_installed = {
        "clangd", -- C++
        "html", -- HTML
        "pyright", -- Python
        "eslint", -- JavaScript, TypeScript (linting)
        "cssls", -- CSS
        "tailwindcss", -- TailwindCSS
        "qmlls", -- QML / Quickshell
    },
}
