local addonName, addonTable = ...

local function RemoveBottomActionBarStyling()
    MainMenuBarLeftEndCap:Hide()
    MainMenuBarRightEndCap:Hide()

    MainMenuBarTexture0:Hide()
    MainMenuBarTexture1:Hide()
    MainMenuBarTexture2:Hide()

    -- StatusTrackingBarManager:Hide()

    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarPageNumber:SetAlpha(0)
end

-- bottom right and bottom left are also anchored to the main action bar
local MAIN_ACTION_BAR_FIRST_BUTTON = "ActionButton"
local BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON = "MultiBarBottomLeftButton"
local BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON = "MultiBarBottomRightButton"
local RIGHT_ACTION_BAR_FIRST_BUTTON = "MultiBarRightButton"
local LEFT_ACTION_BAR_FIRST_BUTTON = "MultiBarLeftButton"
local STANCE_BAR_FIRST_BUTTON = "StanceButton"
local PET_ACTION_BAR_FIRST_BUTTON = "PetActionButton"

local function RemoveMacroNamesFromActionBar(name)
    for i=1, 12 do
        _G[name..i.."Name"]:SetAlpha(0)
        _G[name..i]:SetScale(0.8, 0.8)
    end
end

local function RemoveMacroNamesFromAllActionBars()
    RemoveMacroNamesFromActionBar(MAIN_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(RIGHT_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(LEFT_ACTION_BAR_FIRST_BUTTON)
end

local FIRST_ACTION_BAR_BUTTON_NAMES = {
    MAIN_ACTION_BAR_FIRST_BUTTON..1,
    MAIN_ACTION_BAR_FIRST_BUTTON..2,
    MAIN_ACTION_BAR_FIRST_BUTTON..3,
    MAIN_ACTION_BAR_FIRST_BUTTON..4,
    MAIN_ACTION_BAR_FIRST_BUTTON..5,
    MAIN_ACTION_BAR_FIRST_BUTTON..6,
    MAIN_ACTION_BAR_FIRST_BUTTON..7,
    MAIN_ACTION_BAR_FIRST_BUTTON..8,
    MAIN_ACTION_BAR_FIRST_BUTTON..9,
    MAIN_ACTION_BAR_FIRST_BUTTON..10,
    MAIN_ACTION_BAR_FIRST_BUTTON..11,
    MAIN_ACTION_BAR_FIRST_BUTTON..12,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..1,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..2,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..3,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..4
}

local SECOND_ACTION_BAR_BUTTON_NAMES = {
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..5,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..6,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..7,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..8,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..9,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..10,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..11,
    BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON..12,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..1,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..2,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..3,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..4,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..5,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..6,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..7,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..8
}

local THIRD_ACTION_BAR_BUTTON_NAMES = {
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..9,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..10,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..11,
    BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON..12,
    RIGHT_ACTION_BAR_FIRST_BUTTON..1,
    RIGHT_ACTION_BAR_FIRST_BUTTON..2,
    RIGHT_ACTION_BAR_FIRST_BUTTON..3,
    RIGHT_ACTION_BAR_FIRST_BUTTON..4,
    RIGHT_ACTION_BAR_FIRST_BUTTON..5,
    RIGHT_ACTION_BAR_FIRST_BUTTON..6,
    RIGHT_ACTION_BAR_FIRST_BUTTON..7,
    RIGHT_ACTION_BAR_FIRST_BUTTON..8,
    RIGHT_ACTION_BAR_FIRST_BUTTON..9,
    RIGHT_ACTION_BAR_FIRST_BUTTON..10,
    RIGHT_ACTION_BAR_FIRST_BUTTON..11,
    RIGHT_ACTION_BAR_FIRST_BUTTON..12
}

local FOURTH_ACTION_BAR_BUTTON_NAMES = {
    LEFT_ACTION_BAR_FIRST_BUTTON..1,
    LEFT_ACTION_BAR_FIRST_BUTTON..2,
    LEFT_ACTION_BAR_FIRST_BUTTON..3,
    LEFT_ACTION_BAR_FIRST_BUTTON..4,
    LEFT_ACTION_BAR_FIRST_BUTTON..5,
    LEFT_ACTION_BAR_FIRST_BUTTON..6,
    LEFT_ACTION_BAR_FIRST_BUTTON..7,
    LEFT_ACTION_BAR_FIRST_BUTTON..8,
    LEFT_ACTION_BAR_FIRST_BUTTON..9,
    LEFT_ACTION_BAR_FIRST_BUTTON..10,
    LEFT_ACTION_BAR_FIRST_BUTTON..11,
    LEFT_ACTION_BAR_FIRST_BUTTON..12
}

local STANCE_BAR_BUTTON_NAMES = {
    STANCE_BAR_FIRST_BUTTON..1,
    STANCE_BAR_FIRST_BUTTON..2,
    STANCE_BAR_FIRST_BUTTON..3,
    STANCE_BAR_FIRST_BUTTON..4,
    STANCE_BAR_FIRST_BUTTON..5,
    STANCE_BAR_FIRST_BUTTON..6
}

local PET_ACTION_BAR_BUTTON_NAMES = {
    PET_ACTION_BAR_FIRST_BUTTON..1,
    PET_ACTION_BAR_FIRST_BUTTON..2,
    PET_ACTION_BAR_FIRST_BUTTON..3,
    PET_ACTION_BAR_FIRST_BUTTON..4,
    PET_ACTION_BAR_FIRST_BUTTON..5,
    PET_ACTION_BAR_FIRST_BUTTON..6,
    PET_ACTION_BAR_FIRST_BUTTON..7,
    PET_ACTION_BAR_FIRST_BUTTON..8,
    PET_ACTION_BAR_FIRST_BUTTON..9,
    PET_ACTION_BAR_FIRST_BUTTON..10
}

local function SetActionBarScale(names, scale)
    for i=1, table.getn(names) do
        local button = _G[names[i]]
        button:SetScale(scale, scale)
    end
end

local function SetScaleForAllActionBars(scale)
    SetActionBarScale(FIRST_ACTION_BAR_BUTTON_NAMES, scale)
    SetActionBarScale(SECOND_ACTION_BAR_BUTTON_NAMES, scale)
    SetActionBarScale(THIRD_ACTION_BAR_BUTTON_NAMES, scale)
    SetActionBarScale(FOURTH_ACTION_BAR_BUTTON_NAMES, scale)
end

local function RearrangeActionBarHorizontal(names, horizontalSpacing)
    for i = 2, table.getn(names) do
        local button = _G[names[i]]
        button:ClearAllPoints()
        button:SetPoint("LEFT", names[i - 1], "RIGHT", horizontalSpacing, 0)
    end
end

local function RearrangeAllActionBarsHorizontal()
    local horizontalSpacing = 6
    RearrangeActionBarHorizontal(FIRST_ACTION_BAR_BUTTON_NAMES, horizontalSpacing)
    RearrangeActionBarHorizontal(SECOND_ACTION_BAR_BUTTON_NAMES, horizontalSpacing)
    RearrangeActionBarHorizontal(THIRD_ACTION_BAR_BUTTON_NAMES, horizontalSpacing)
    RearrangeActionBarHorizontal(FOURTH_ACTION_BAR_BUTTON_NAMES, horizontalSpacing)
end

local function MoveActionBarCenterPoint(name, x, y)
    local button = _G[name]
    button:ClearAllPoints()
    button:SetPoint("CENTER", "WorldFrame", x, y)
end

local function MoveAllActionBars(offsetX, offsetY, verticalSpacing)
    MoveActionBarCenterPoint(
        FIRST_ACTION_BAR_BUTTON_NAMES[1],
        -314 + offsetX,
        63 + offsetY)
    MoveActionBarCenterPoint(
        SECOND_ACTION_BAR_BUTTON_NAMES[1],
        -314 + offsetX,
        24 + offsetY + (-verticalSpacing))
    MoveActionBarCenterPoint(
        THIRD_ACTION_BAR_BUTTON_NAMES[1],
        -314 + offsetX,
        -15 + offsetY + (-verticalSpacing * 2))
    MoveActionBarCenterPoint(
        FOURTH_ACTION_BAR_BUTTON_NAMES[1],
        -230 + offsetX,
        -54 + offsetY + (-verticalSpacing * 3))
end

local function MoveStanceActionBar(offsetX, offsetY)
    local button = _G[STANCE_BAR_BUTTON_NAMES[1]]
    button:ClearAllPoints()
    button:SetPoint("CENTER", -693 + offsetX, 1061 + offsetY)
end

local function MovePetActionBar(offsetX, offsetY)
    local button = _G[PET_ACTION_BAR_BUTTON_NAMES[1]]
    button:ClearAllPoints()
    button:SetPoint("CENTER", "WorldFrame", offsetX, offsetY)
end

local function InitializeActionBars()
    RemoveBottomActionBarStyling()

    RemoveMacroNamesFromAllActionBars()

    SetScaleForAllActionBars(0.8)
    RearrangeAllActionBarsHorizontal()
    MoveAllActionBars(0, -385, 3)
    
    MoveStanceActionBar(6, -5)
    RearrangeActionBarHorizontal(STANCE_BAR_BUTTON_NAMES, 4)

    MovePetActionBar(-317, -283)
    SetActionBarScale(PET_ACTION_BAR_BUTTON_NAMES, 0.8)
    RearrangeActionBarHorizontal(PET_ACTION_BAR_BUTTON_NAMES, 5)
end

addonTable.InitializeActionBars = InitializeActionBars