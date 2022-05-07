local onedarkpro = require 'onedarkpro'
--
onedarkpro.setup {
    dark_theme = 'onedark', -- The default dark theme
    light_theme = 'onelight', -- The default light theme
    -- Theme can be overwritten with 'onedark' or 'onelight' as a string
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    hlgroups = {}, -- Override default highlight groups
    filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
    plugins = { -- Override which plugins highlight groups are loaded
        all = true,
    },
    styles = {
        strings = 'bold', -- Style that is applied to strings
        comments = 'italic', -- Style that is applied to comments
        keywords = 'bold,italic', -- Style that is applied to keywords
        virtual_text = 'italic', -- Style that is applied to virtual text
    },
    options = {
        transparency = false,
    }
}
onedarkpro.load()
