return {
    "m4xshen/autoclose.nvim",
    config = function()
        require("autoclose").setup({
            -- Default configuration
            keys = {
                ["("] = { escape = false, close = true, pair = "()" },
                ["["] = { escape = false, close = true, pair = "[]" },
                ["{"] = { escape = false, close = true, pair = "{}" },

                [">"] = { escape = true, close = false, pair = "<>" },
                [")"] = { escape = true, close = false, pair = "()" },
                ["]"] = { escape = true, close = false, pair = "[]" },
                ["}"] = { escape = true, close = false, pair = "{}" },

                ['"'] = { escape = true, close = true, pair = '""' },
                ["'"] = { escape = true, close = true, pair = "''" },
                ["`"] = { escape = true, close = true, pair = "``" },
            },
            options = {
                disabled_filetypes = { "text", "markdown" },
                disable_when_touch = true,
                pair_spaces = true,
                auto_indent = true,
                disable_command_mode = false,
            },
        })
    end
}
