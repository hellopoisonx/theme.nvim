---@class Picker
local M = {}
---@param opts table
M.showPicker = function(opts)
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local opt = {}
    if opts.ui.dropdown then
        opt = require("telescope.themes").get_dropdown {}
    end
    pickers.new(opt, {
        prompt_title = "Theme",
        finder = finders.new_table {
            results = opts.themes
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({ selection[1] }, "", false, true)
            end)
            return true
        end
    }):find()
end

return M
