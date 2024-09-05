-- require("themes.monet")
require("monet").setup {
	transparent_background = true,
	semantic_tokens = true,
	dark_mode = true,
	highlight_overrides= {},
	color_overrides = {},
	styles = {}
}


-- init.lua

-- Define available themes
local themes = {
    { name = "default", value = "default" },
    { name = "desert", value = "desert" },
	{ name = "monet", value = "monet" },
    { name = "evening", value = "evening" },
}

-- Path to store the current theme
local theme_file_path = vim.fn.stdpath("config") .. "/theme.lua"

-- Function to save the current theme to a file
local function save_theme(theme_name)
    local file = io.open(theme_file_path, "w")
    if file then
        file:write("return '" .. theme_name .. "'\n")
        file:close()
    else
        print("Error: Unable to save theme")
    end
end

-- Function to load the saved theme
local function load_theme()
    local ok, saved_theme = pcall(dofile, theme_file_path)
    if ok and saved_theme then
        return saved_theme
    else
        return themes[1].value -- Default theme if no saved theme
    end
end

-- Function to apply a theme
local function apply_theme(theme_name)
    vim.cmd("colorscheme " .. theme_name)
    save_theme(theme_name)
end

-- Function to prompt the user to select a theme
local function select_theme()
    local theme_names = {}
    for _, theme in ipairs(themes) do
        table.insert(theme_names, theme.name)
    end

    vim.ui.select(theme_names, {
        prompt = "Select a theme",
        format_item = function(item)
            return item
        end,
    }, function(choice)
        if choice then
            for _, theme in ipairs(themes) do
                if theme.name == choice then
                    apply_theme(theme.value)
                    print("Theme switched to: " .. theme.value)
                end
            end
        else
            print("No theme selected")
        end
    end)
end

-- Create a command to switch themes via a menu
vim.api.nvim_create_user_command("Themes", select_theme, {})

-- Load the saved theme on startup
local current_theme = load_theme()
apply_theme(current_theme)

-- Usage: To switch themes, run :Themes

