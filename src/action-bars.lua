local addonName, addonTable = ...

local ACTION_BAR_1_BUTTON_NAME = "ActionButton"
local ACTION_BAR_2_BUTTON_NAME = "MultiBarBottomLeftButton"
local ACTION_BAR_3_BUTTON_NAME = "MultiBarBottomRightButton"
local ACTION_BAR_4_BUTTON_NAME = "MultiBarRightButton"
local ACTION_BAR_5_BUTTON_NAME = "MultiBarLeftButton"
local ACTION_BAR_6_BUTTON_NAME = "MultiBar5Button"
local ACTION_BAR_7_BUTTON_NAME = "MultiBar6Button"
local ACTION_BAR_8_BUTTON_NAME = "MultiBar7Button"

local ACTION_BAR_BUTTON_NAMES = {
    ACTION_BAR_1_BUTTON_NAME,
    ACTION_BAR_2_BUTTON_NAME,
    ACTION_BAR_3_BUTTON_NAME,
    ACTION_BAR_4_BUTTON_NAME,
    ACTION_BAR_5_BUTTON_NAME,
    ACTION_BAR_6_BUTTON_NAME,
    ACTION_BAR_7_BUTTON_NAME,
    ACTION_BAR_8_BUTTON_NAME
}

local function RemoveMacroNamesFromActionBar(bar)
    for i = 1, 12 do
        _G[bar..i.."Name"]:SetAlpha(0)
    end
end

local function RemoveMacroNamesFromActionBars()
    for i = 1, table.getn(ACTION_BAR_BUTTON_NAMES) do
        RemoveMacroNamesFromActionBar(ACTION_BAR_BUTTON_NAMES[i])
    end
end

-- This prevents icons from being animated onto the main action bar when you learn them.
-- For example, when you switch talents but you have available "first action bar" slots,
-- the game will automatically add the talents to your action bar. This stops that from happening.
local function DisableAutoAddSpellsToActionBars()
    IconIntroTracker.RegisterEvent = function() end
    IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR')
end

local function InitializeActionBars()
    RemoveMacroNamesFromActionBars()
    DisableAutoAddSpellsToActionBars()
end

addonTable.InitializeActionBars = InitializeActionBars