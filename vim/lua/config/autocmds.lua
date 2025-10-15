-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local group = vim.api.nvim_create_augroup("AutoCommands", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    -- TODO: Check if COMMIT_EDITMSG or MERGE_MSG exists. If it does, skip the following
    vim.cmd('lua StartLaravel()')
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = group,
  callback = function()
    os.remove(".builds.lock")
    os.remove(".horizon.lock")
    os.remove(".reverb.lock")
    os.remove(".octane.lock")
  end,
})

-- Start Vite/Mix builds
function StartBuilds()
  local lock = ".builds.lock"

  if vim.fn.filereadable(lock) == 1 then
    return
  end

  if vim.loop.fs_stat("node_modules") == nil then
    return
  end

  local file = io.open("package.json", "r")

  if file ~= nil then
    local content = file:read("*all")
    file:close()

    local decoded = vim.fn.json_decode(content)
    local scripts = decoded.scripts

    if scripts ~= nil then
      if scripts.watch ~= nil then
        vim.cmd("terminal npm run watch")
      elseif scripts.dev ~= nil then
        vim.cmd("terminal npm run dev")
      end

      if string.match(content, '"vite"') then
        vim.cmd("file Vite")
      elseif string.match(content, '"laravel%-mix"') then
        vim.cmd("file Mix")
      end

      io.open(lock, "w"):close()
    end
  end
end

-- Start Horizon
function StartHorizon()
  local lock = ".horizon.lock"

  if vim.fn.filereadable(lock) == 1 then
    return
  end

  local artisan = io.open("artisan", "r")

  if artisan ~= nil then
    io.close(artisan)

    local packages = io.open("composer.json", "r")

    if packages ~= nil then
      local content = packages:read("*all")
      packages:close()

      if string.match(content, "laravel/horizon") then
        vim.cmd("terminal valet php artisan horizon")
        vim.cmd("file Horizon")
        io.open(lock, "w"):close()
      end
    end
  end
end

function StartLaravel()
    vim.cmd("lua StartHorizon()")
    vim.cmd("lua StartBuilds()")
    vim.cmd("lua StartReverb()")
    vim.cmd("lua StartOctane()")
end

-- Start Octane
function StartOctane()
  local lock = ".octane.lock"

  if vim.fn.filereadable(lock) == 1 then
    return
  end

  local artisan = io.open("artisan", "r")

  if artisan ~= nil then
    io.close(artisan)

    local packages = io.open("composer.json", "r")

    if packages ~= nil then
      local content = packages:read("*all")
      packages:close()

      if string.match(content, "laravel/octane") then
        vim.cmd("terminal valet php artisan octane:start --watch")
        vim.cmd("file Octane")
        io.open(lock, "w"):close()
      end
    end
  end
end

-- Start Reverb
function StartReverb()
  local lock = ".reverb.lock"

  if vim.fn.filereadable(lock) == 1 then
    return
  end

  local artisan = io.open("artisan", "r")

  if artisan ~= nil then
    io.close(artisan)

    local packages = io.open("composer.json", "r")

    if packages ~= nil then
      local content = packages:read("*all")
      packages:close()

      if string.match(content, "laravel/reverb") then
        local env_file = io.open(".env", "r")

        if env_file == nil then
            return
        end

        local env = env_file:read("*all")
        local port = env:match("REVERB_PORT=(%d+)")

        env_file:close()

        if port == nil then
          port = 8080
        end

        vim.cmd("terminal valet php artisan reverb:start --debug --port=" .. port)
        vim.cmd("file Reverb")
        io.open(lock, "w"):close()
      end
    end
  end
end
