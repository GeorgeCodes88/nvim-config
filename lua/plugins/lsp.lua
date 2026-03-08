return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "neovim/nvim-lspconfig",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'path' },
            })
        })

        vim.lsp.config('*', {
            root_markers = { '.git' },
        })

        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
            float = {
                style = 'minimal',
                border = 'rounded',
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '✘',
                    [vim.diagnostic.severity.WARN] = '▲',
                    [vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '»',
                },
            },
        })

        local orig = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or 'rounded'
            return orig(contents, syntax, opts, ...)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                local buf = args.buf
                local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = buf }) end

                map('n', 'K', vim.lsp.buf.hover)
                map('n', 'gd', vim.lsp.buf.definition)
                map('n', 'gr', vim.lsp.buf.references)
                map('n', 'gl', vim.diagnostic.open_float)
                map('n', '<F2>', vim.lsp.buf.rename)
                map('n', '<F4>', vim.lsp.buf.code_action)
            end,
        })

        local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local caps = status and cmp_nvim_lsp.default_capabilities() or {}

        vim.lsp.config['luals'] = {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            capabilities = caps,
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
        }

        vim.lsp.config['ts_ls'] = {
            cmd = { 'typescript-language-server', '--stdio' },
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            capabilities = caps,
        }

        for name, _ in pairs(vim.lsp.config._configs) do
            if name ~= '*' then
                vim.lsp.enable(name)
            end
        end
    end
}
