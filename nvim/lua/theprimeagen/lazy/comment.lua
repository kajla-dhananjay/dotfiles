return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            padding = true,  -- Add space after comment marker
            sticky = true,   -- Keep cursor position after comment
            ignore = "^$",   -- Ignore empty lines
            mappings = {
                basic = true,  -- Enable default keybindings
                extra = true,  -- Enable extra keybindings
            },
        })

        -- Correct keymap setup
        local api = require("Comment.api")
        -- Normal mode toggle
        vim.keymap.set("n", "<leader>cc", api.toggle.linewise.current, { desc = "Toggle comment" })
        -- Visual mode toggle
        vim.keymap.set("v", "<leader>cc", function()
            api.toggle.linewise(vim.fn.visualmode())
        end, { desc = "Toggle comment (visual)" })
    end
}
