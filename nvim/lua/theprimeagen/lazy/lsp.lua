return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")

        -- Set up capabilities
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Configure Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- Core
                "lua_ls",
                "rust_analyzer",

                -- C/C++
                "clangd",
                "cmake",

                -- Java
                "jdtls",

                -- Shell
                "bashls",

                -- Python
                "pyright",

                -- Web
                "html",
                "cssls",
                "jsonls",

                -- Docker
                "dockerls",

                -- Go
                "gopls",
            },
            handlers = {
                -- Default handler
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end,

                ["cmake"] = function()
                    require("lspconfig").cmake.setup({
                        capabilities = capabilities
                    })
                end,
                -- Lua special configuration
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    })
                end,

                -- C/C++ configuration
                ["clangd"] = function()
                    require("lspconfig").clangd.setup({
                        cmd = {
                            "clangd",
                            "--query-driver=/usr/bin/clang-19",
                            "--clang-tidy",
                            "--header-insertion=never",
                        }
                    })
                end,

                -- Java configuration
                ["jdtls"] = function()
                    local home = os.getenv("HOME")
                    require("lspconfig").jdtls.setup({
                        cmd = {
                            "java",
                            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                            "-Dosgi.bundles.defaultStartLevel=4",
                            "-Declipse.product=org.eclipse.jdt.ls.core.product",
                            "-Xmx4G",
                            "--add-modules=ALL-SYSTEM",
                            "--add-opens", "java.base/java.util=ALL-UNNAMED",
                            "-jar", vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
                            "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
                            "-data", home .. "/.jdtls-workspace"
                        }
                    })
                end
            }
        })

        -- Configure nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        -- Global diagnostic config
        vim.diagnostic.config({
            virtual_text = true,
            float = {
                border = "rounded",
                source = "always"
            }
        })
    end
}
