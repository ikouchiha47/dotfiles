-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/darksied/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/darksied/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/darksied/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/darksied/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/darksied/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  delimitMate = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/delimitMate",
    url = "https://github.com/Raimondi/delimitMate"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0�\1�\14direction\1\0\1\22current_line_only\2\17AFTER_CURSOR\15hint_char1d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0�\1�\14direction\1\0\1\22current_line_only\2\18BEFORE_CURSOR\15hint_char1�\1\1\0\b\0\15\0\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\0\0'\3\3\0B\1\2\0029\1\4\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\t\0003\6\n\0005\a\v\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\f\0003\6\r\0005\a\14\0B\2\5\0012\0\0�K\0\1\0\1\0\1\nremap\2\0\6F\1\0\1\nremap\2\0\6f\5\bset\vkeymap\bvim\18HintDirection\rhop.hint\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\t\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\0016\1\0\0'\3\5\0B\1\2\0026\2\0\0'\4\6\0B\2\2\0029\3\a\2\18\5\3\0009\3\b\3'\6\t\0009\a\n\1B\a\1\0A\3\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\14fast_wrap\1\0\2\30enable_check_bracket_line\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["spelunker.vim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/spelunker.vim",
    url = "https://github.com/kamykn/spelunker.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/vim-rainbow",
    url = "https://github.com/frazrepo/vim-rainbow"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/darksied/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0�\1�\14direction\1\0\1\22current_line_only\2\17AFTER_CURSOR\15hint_char1d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0�\1�\14direction\1\0\1\22current_line_only\2\18BEFORE_CURSOR\15hint_char1�\1\1\0\b\0\15\0\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\0\0'\3\3\0B\1\2\0029\1\4\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\t\0003\6\n\0005\a\v\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\f\0003\6\r\0005\a\14\0B\2\5\0012\0\0�K\0\1\0\1\0\1\nremap\2\0\6F\1\0\1\nremap\2\0\6f\5\bset\vkeymap\bvim\18HintDirection\rhop.hint\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\1\0\0\t\0\v\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\0016\1\0\0'\3\5\0B\1\2\0026\2\0\0'\4\6\0B\2\2\0029\3\a\2\18\5\3\0009\3\b\3'\6\t\0009\a\n\1B\a\1\0A\3\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\14fast_wrap\1\0\2\30enable_check_bracket_line\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
