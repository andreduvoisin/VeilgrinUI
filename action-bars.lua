local addonName, addonTable = ...

local MAIN_ACTION_BAR_BUTTON_NAME = "ActionButton"
local BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME = "MultiBarBottomLeftButton"
local BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME = "MultiBarBottomRightButton"
local RIGHT_ACTION_BAR_BUTTON_NAME = "MultiBarRightButton"
local LEFT_ACTION_BAR_BUTTON_NAME = "MultiBarLeftButton"

local FIRST_ACTION_BAR = {
    MAIN_ACTION_BAR_BUTTON_NAME..1,
    MAIN_ACTION_BAR_BUTTON_NAME..2,
    MAIN_ACTION_BAR_BUTTON_NAME..3,
    MAIN_ACTION_BAR_BUTTON_NAME..4,
    MAIN_ACTION_BAR_BUTTON_NAME..5,
    MAIN_ACTION_BAR_BUTTON_NAME..6,
    MAIN_ACTION_BAR_BUTTON_NAME..7,
    MAIN_ACTION_BAR_BUTTON_NAME..8,
    MAIN_ACTION_BAR_BUTTON_NAME..9,
    MAIN_ACTION_BAR_BUTTON_NAME..10,
    MAIN_ACTION_BAR_BUTTON_NAME..11,
    MAIN_ACTION_BAR_BUTTON_NAME..12,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..1,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..2,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..3,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..4
}

local SECOND_ACTION_BAR = {
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..5,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..6,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..7,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..8,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..9,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..10,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..11,
    BOTTOM_LEFT_ACTION_BAR_BUTTON_NAME..12,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..1,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..2,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..3,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..4,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..5,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..6,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..7,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..8
}

local THIRD_ACTION_BAR = {
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..9,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..10,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..11,
    BOTTOM_RIGHT_ACTION_BAR_BUTTON_NAME..12,
    RIGHT_ACTION_BAR_BUTTON_NAME..1,
    RIGHT_ACTION_BAR_BUTTON_NAME..2,
    RIGHT_ACTION_BAR_BUTTON_NAME..3,
    RIGHT_ACTION_BAR_BUTTON_NAME..4,
    RIGHT_ACTION_BAR_BUTTON_NAME..5,
    RIGHT_ACTION_BAR_BUTTON_NAME..6,
    RIGHT_ACTION_BAR_BUTTON_NAME..7,
    RIGHT_ACTION_BAR_BUTTON_NAME..8,
    RIGHT_ACTION_BAR_BUTTON_NAME..9,
    RIGHT_ACTION_BAR_BUTTON_NAME..10,
    RIGHT_ACTION_BAR_BUTTON_NAME..11,
    RIGHT_ACTION_BAR_BUTTON_NAME..12
}

local FOURTH_ACTION_BAR = {
    LEFT_ACTION_BAR_BUTTON_NAME..1,
    LEFT_ACTION_BAR_BUTTON_NAME..2,
    LEFT_ACTION_BAR_BUTTON_NAME..3,
    LEFT_ACTION_BAR_BUTTON_NAME..4,
    LEFT_ACTION_BAR_BUTTON_NAME..5,
    LEFT_ACTION_BAR_BUTTON_NAME..6,
    LEFT_ACTION_BAR_BUTTON_NAME..7,
    LEFT_ACTION_BAR_BUTTON_NAME..8,
    LEFT_ACTION_BAR_BUTTON_NAME..9,
    LEFT_ACTION_BAR_BUTTON_NAME..10,
    LEFT_ACTION_BAR_BUTTON_NAME..11,
    LEFT_ACTION_BAR_BUTTON_NAME..12
}

local ACTION_BARS = {
    FIRST_ACTION_BAR,
    SECOND_ACTION_BAR,
    THIRD_ACTION_BAR,
    FOURTH_ACTION_BAR
}

local ACTION_BARS_FRAME = CreateFrame("Frame", "(VeilgrinUI) ACTION_BARS_FRAME", UIParent)
ACTION_BARS_FRAME:SetFrameStrata("MEDIUM")
ACTION_BARS_FRAME:Show()

local ACTION_BAR_BUTTON_HORIZONTAL_SPACING = 6
local ACTION_BAR_VERTICAL_SPACING = 6

local function RemoveMacroNamesFromActionBar(bar)
    for i = 1, table.getn(bar) do
        _G[bar[i].."Name"]:SetAlpha(0)
    end
end

local function RemoveMacroNamesFromActionBars()
    for i = 1, table.getn(ACTION_BARS) do
        RemoveMacroNamesFromActionBar(ACTION_BARS[i])
    end
end

local function RearrangeActionBarHorizontal(bar)
    for i = 2, table.getn(bar) do
        local button = _G[bar[i]]
        button:ClearAllPoints()
        button:SetPoint("LEFT", bar[i - 1], "RIGHT", ACTION_BAR_BUTTON_HORIZONTAL_SPACING, 0)
    end
end

local function RearrangeActionBarsHorizontal()
    for i = 1, table.getn(ACTION_BARS) do
        RearrangeActionBarHorizontal(ACTION_BARS[i])
    end
end

local function CalculateActionBarHeight(bar)
    -- Assume that the height of the first button is the height of the action bar.
    local button = _G[bar[1]]
    return button:GetHeight()
end

local function CalculateActionBarWidth(bar)
    local width = 0

    -- Add up the width of every button.
    for i = 1, table.getn(bar) do
        local button = _G[bar[i]]
        width = width + button:GetWidth()
    end

    -- Add up the width of the spaces between each button.
    width = width + ((table.getn(bar) - 1) * ACTION_BAR_BUTTON_HORIZONTAL_SPACING)

    return width
end

local function CalculateActionBarsFrameHeight()
    local height = 0

    -- Add up the height of every action bar.
    for i = 1, table.getn(ACTION_BARS) do
        height = height + CalculateActionBarHeight(ACTION_BARS[i])
    end

    -- Add up the height of the spaces between each action bar.
    height = height + ((table.getn(ACTION_BARS) - 1) * ACTION_BAR_VERTICAL_SPACING)

    return height
end

local function CalculateActionBarsFrameWidth()
    local widths = {}

    for i = 1, table.getn(ACTION_BARS) do
        local width = CalculateActionBarWidth(ACTION_BARS[i])
        table.insert(widths, width)
    end

    return math.max(unpack(widths))
end

local function PlaceActionBarInFrame(bar, offsetX, offsetY)
    local button = _G[bar[1]]
    button:ClearAllPoints()
    button:SetPoint("TOPLEFT", ACTION_BARS_FRAME, "TOPLEFT", offsetX, offsetY)
end

local function PlaceActionBarsInFrame()
    for i = 1, table.getn(ACTION_BARS) do
        local offsetX = (ACTION_BARS_FRAME:GetWidth() - CalculateActionBarWidth(ACTION_BARS[i])) / 2

        local offsetY = 0
        for j = 2, i do
            offsetY = offsetY + CalculateActionBarHeight(ACTION_BARS[j - 1])
        end
        offsetY = offsetY + ACTION_BAR_VERTICAL_SPACING * (i - 1)

        PlaceActionBarInFrame(ACTION_BARS[i], offsetX, -offsetY)
    end
end

local function PositionActionBars(offsetY)
    ACTION_BARS_FRAME:SetWidth(CalculateActionBarsFrameWidth())
    ACTION_BARS_FRAME:SetHeight(CalculateActionBarsFrameHeight())
    ACTION_BARS_FRAME:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, offsetY)

    PlaceActionBarsInFrame()
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

    RearrangeActionBarsHorizontal()
    PositionActionBars(102)

    DisableAutoAddSpellsToActionBars()
end

addonTable.InitializeActionBars = InitializeActionBars