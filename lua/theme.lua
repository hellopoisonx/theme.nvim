-- main module file
local module = require("theme.module")

---@class Config
---@field opt string Your config option
local config = {
    ui = {
        dropdown = true,
    },
    themes = { "Default" }
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
    M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.hello = function()
    return module.showPicker(M.config)
end

return M
