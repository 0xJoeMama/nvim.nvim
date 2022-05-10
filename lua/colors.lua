local onedarkpro = require 'onedarkpro'

onedarkpro.setup {
    dark_theme = 'onedark_vivid', -- The default dark theme
    light_theme = 'onelight', -- The default light theme
    styles = {
        strings = 'NONE', -- Style that is applied to strings
        keywords = 'italic,bold',
        virtual_text = 'italic', -- Style that is applied to virtual text
    },
    options = {
        bold = true, -- Use the themes opinionated bold styles?
        italic = true, -- Use the themes opinionated italic styles?
        underline = false, -- Use the themes opinionated underline styles?
        undercurl = false, -- Use the themes opinionated undercurl styles?
        cursorline = false, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    },
}

onedarkpro.load()
