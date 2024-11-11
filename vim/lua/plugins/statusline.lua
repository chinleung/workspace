local function getInputSource()
    local source = vim.fn.system("defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID")

    if source:find('com.apple.keylayout.CanadianFrench-PC') then
        return 'FR'
    elseif source:find('com.apple.keylayout.Canadian') then
        return 'EN'
    else
        return 'Unknown'
    end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        options = {
            component_separators = {
                right = '',
            }
        },
        sections = {
            lualine_x = {
                'filetype',
                'encoding',
                'fileformat',
            },
            lualine_z = {
                'location',
                -- getInputSource,
            },
        }
    }
}
