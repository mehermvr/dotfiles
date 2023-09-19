-- TODO: kanagawa has a require on it that sets it as the theme. need to allow it to be switchable?
local themes = require("themes")

local currentTheme = "kanagawa"

local currentThemeTable = themes[currentTheme]
return currentThemeTable
