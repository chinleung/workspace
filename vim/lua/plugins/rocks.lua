return {
    "theHamsta/nvim_rocks",
    event = "VeryLazy",
    build = "python3 -m pip install --user --break-system-packages hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
    config = function()
        local manager = require('nvim_rocks')

        manager.ensure_installed('dkjson')
    end,
}

