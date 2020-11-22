
local function RemoveExperienceBarAtMaxLevel()
    local maxPlayerLevel = GetMaxLevelForLatestExpansion()
    if UnitLevel("player") == maxPlayerLevel then
        StatusTrackingBarManager:Hide()
    end
end

local function RemoveBottomActionBarStyling()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()

    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarArtFrame.PageNumber:SetAlpha(0)
end

-- Reference:
-- https://git.tukui.org/elvui/elvui/-/blob/master/ElvUI/Modules/ActionBars/ActionBars.lua#L741
-- Search for "DisableBlizzard" if line number is no longer correct.
local function RemoveMenuMicroButtonAndBagsBar()
    MicroButtonAndBagsBar:SetScale(0.00001)
    MicroButtonAndBagsBar:EnableMouse(false)
    MicroButtonAndBagsBar:SetFrameStrata('BACKGROUND')
    MicroButtonAndBagsBar:SetFrameLevel(0)
end

-- bottom right and bottom left are also anchored to the main action bar
local MAIN_ACTION_BAR_FIRST_BUTTON = "ActionButton"
local BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON = "MultiBarBottomLeftButton"
local BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON = "MultiBarBottomRightButton"
local RIGHT_ACTION_BAR_FIRST_BUTTON = "MultiBarRightButton"
local LEFT_ACTION_BAR_FIRST_BUTTON = "MultiBarLeftButton"
local STANCE_BAR_FIRST_BUTTON = "StanceButton"

local function RemoveMacroNamesFromActionBar(name)
    for i=1, 12 do
        _G[name..i.."Name"]:SetAlpha(0)
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

local ACTION_BAR_FRAME = CreateFrame("Frame", "VeilgrinUIActionBarFrame", UIParent)
ACTION_BAR_FRAME:SetFrameStrata("MEDIUM")
ACTION_BAR_FRAME:Show()

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

local function GetActionBarWidth(names, horizontalSpacing)
    local width = 0
    for i = 1, table.getn(names) do
        local button = _G[names[i]]
        width = width + button:GetWidth()
    end
    width = width + ((table.getn(names) - 1) * horizontalSpacing)
    return width
end

local function GetActionBarHeight(names)
    local button = _G[names[1]]
    return button:GetHeight()
end

local function MoveActionBarCenterPoint(name, x, y)
    local button = _G[name]
    button:ClearAllPoints()
    button:SetPoint("TOPLEFT", ACTION_BAR_FRAME, "TOPLEFT", x, y)
end

local function MoveAllActionBars(offsetX, offsetY, verticalSpacing)
    local horizontalSpacing = 6

    local actionBarFrameWidth = GetActionBarWidth(FIRST_ACTION_BAR_BUTTON_NAMES, horizontalSpacing)
    ACTION_BAR_FRAME:SetWidth(actionBarFrameWidth)
    local actionBarFrameHeight = (GetActionBarHeight(FIRST_ACTION_BAR_BUTTON_NAMES) * 4) + (verticalSpacing * 3)
    ACTION_BAR_FRAME:SetHeight(actionBarFrameHeight)

    MoveActionBarCenterPoint(
        FIRST_ACTION_BAR_BUTTON_NAMES[1],
        0,
        0)
    MoveActionBarCenterPoint(
        SECOND_ACTION_BAR_BUTTON_NAMES[1],
        0,
        -GetActionBarHeight(FIRST_ACTION_BAR_BUTTON_NAMES) + -verticalSpacing)
    MoveActionBarCenterPoint(
        THIRD_ACTION_BAR_BUTTON_NAMES[1],
        0,
        (-GetActionBarHeight(SECOND_ACTION_BAR_BUTTON_NAMES) + -verticalSpacing) * 2)
    MoveActionBarCenterPoint(
        FOURTH_ACTION_BAR_BUTTON_NAMES[1],
        (actionBarFrameWidth - GetActionBarWidth(FOURTH_ACTION_BAR_BUTTON_NAMES, horizontalSpacing)) / 2,
        (-GetActionBarHeight(THIRD_ACTION_BAR_BUTTON_NAMES) + -verticalSpacing) * 3)
    
    ACTION_BAR_FRAME:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, GetScreenHeight() * (5/64))
end

local function MoveStanceActionBar(offsetX, offsetY)
    local button = _G[STANCE_BAR_BUTTON_NAMES[1]]
    button:ClearAllPoints()
    button:SetPoint("TOPLEFT", UIParent, "TOPLEFT", offsetX, offsetY)
end

local defaultRaidFrameSortFunc = CompactRaidFrameContainer.flowSortFunc
local function SetDefaultRaidFrameSort()
    CompactRaidFrameContainer.flowSortFunc = defaultRaidFrameSortFunc
end

local function SetPlayerOnBottomRaidFrameSort()
    CompactRaidFrameContainer.flowSortFunc = function(unit1, unit2)
        if UnitIsUnit(unit1, "player") then
            return false
        elseif UnitIsUnit(unit2, "player") then
            return true
        else
            return unit1 < unit2
        end
    end
end

local function UpdateRaidFrames()
    CompactRaidFrameContainer_TryUpdate(CompactRaidFrameContainer)
end

local function EnableArenaNameplateNumbers()
    hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
        if IsActiveBattlefieldArena() and frame.unit:find("nameplate") then
            for i=1,5 do
                if UnitIsUnit(frame.unit ,"arena"..i) then
                    frame.name:SetText(i)
                    frame.name:SetTextColor(1, 1, 0)
                    break
                end
            end
        end
    end)
end

-- This prevents icons from being animated onto the main action bar when you learn them.
-- For example, when you switch talents but you have available "first action bar" slots,
-- the game will automatically add the talents to your action bar. This stops that from happening.
local function DisableAutoAddSpellsToActionBar()
    IconIntroTracker.RegisterEvent = function() end
    IconIntroTracker:UnregisterEvent('SPELL_PUSHED_TO_ACTIONBAR')
end

local function OnPlayerLogin(self)
    ChatFrame1:AddMessage('(VeilgrinUI) Greetings, '..UnitName("Player")..'!')

    RemoveBottomActionBarStyling()
    RemoveExperienceBarAtMaxLevel()
    RemoveMenuMicroButtonAndBagsBar()
    RemoveMacroNamesFromAllActionBars()

    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -115)
    CastingBarFrame.ClearAllPoints = function() end
    CastingBarFrame.SetPoint = function() end
    
    RearrangeAllActionBarsHorizontal()
    MoveAllActionBars(0, 0, 6)

    PlayerFrame:ClearAllPoints()
    PlayerFrame:SetPoint("CENTER", UIParent, "CENTER", -115, -180)
    PlayerFrame.ClearAllPoints = function() end
    PlayerFrame.SetPoint = function() end

    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("CENTER", UIParent, "CENTER", 115, -180)
    TargetFrame.ClearAllPoints = function() end
    TargetFrame.SetPoint = function() end

    FocusFrame:ClearAllPoints()
    FocusFrame:SetPoint("CENTER", UIParent, "CENTER", 330, -180)
    FocusFrame.ClearAllPoints = function() end
    FocusFrame.SetPoint = function() end

    ObjectiveTrackerFrame:ClearAllPoints()
    ObjectiveTrackerFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 0, 0)
    ObjectiveTrackerFrame.ClearAllPoints = function() end
    ObjectiveTrackerFrame.SetPoint = function() end

    MoveStanceActionBar(6, -5)

    RearrangeActionBarHorizontal(STANCE_BAR_BUTTON_NAMES, 4)

    SetCVar("nameplateMinAlpha", 1)

    EnableArenaNameplateNumbers()

    DisableAutoAddSpellsToActionBar()

    ChatFrame1:AddMessage('(VeilgrinUI) May your blades never dull!')
end

local function OnPlayerEnteringWorld(self, isInitialLogin, isReloadingUi)
    -- if IsActiveBattlefieldArena() then
    --     SetPlayerOnBottomRaidFrameSort()
    -- else
    --     SetDefaultRaidFrameSort()
    -- end
    -- UpdateRaidFrames()

    ChatFrame1:AddMessage('(VeilgrinUI) Lok\'tar ogar!')
end


local EVENT_PLAYER_LOGIN = "PLAYER_LOGIN"
local EVENT_PLAYER_ENTERING_WORLD = "PLAYER_ENTERING_WORLD"

local EventFrame = CreateFrame("Frame")

EventFrame:RegisterEvent(EVENT_PLAYER_LOGIN)
EventFrame:RegisterEvent(EVENT_PLAYER_ENTERING_WORLD)

EventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == EVENT_PLAYER_LOGIN then
        OnPlayerLogin(self)
    elseif event == EVENT_PLAYER_ENTERING_WORLD then
        OnPlayerEnteringWorld(self, ...)
    end
end)


local updateIntervalSeconds = 0.5;
local timeSinceLastUpdate = 0.0;

EventFrame:SetScript("OnUpdate", function(self, elapsed)
    timeSinceLastUpdate = timeSinceLastUpdate + elapsed;

    if (timeSinceLastUpdate < updateIntervalSeconds) then return end

    -- The extra button that appears for special mechanics.
    -- e.g. use Heart of Azeroth, clear Sanity
    ExtraActionButton1:ClearAllPoints()
    ExtraActionButton1:SetPoint("CENTER", UIParent, "CENTER", 0, -550)
    -- Move the strata of the menu bar. Defaults to LOW for ExtraActionButton1.
    -- The menu bar is invisible and on top of the extra action button in MEDIUM, so it eats input events.
    ExtraActionButton1:SetFrameStrata("MEDIUM")
    
    -- The extra information bar that appears for special mechanics.
    PlayerPowerBarAlt:ClearAllPoints()
    PlayerPowerBarAlt:SetPoint("CENTER", UIParent, "CENTER", 0, -300)
    
    timeSinceLastUpdate = 0;
end)
