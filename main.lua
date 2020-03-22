
local function RemoveBottomActionBarStyling()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()

    -- Removes the experience bar.
    StatusTrackingBarManager:Hide()

    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarArtFrame.PageNumber:SetAlpha(0)
end

local function RemoveMenuMicroButtonAndBagsBar()
    MicroButtonAndBagsBar:Hide()

    CharacterMicroButton:Hide()
    SpellbookMicroButton:Hide()
    TalentMicroButton:Hide()
    AchievementMicroButton:Hide()
    QuestLogMicroButton:Hide()
    GuildMicroButton:Hide()
    LFDMicroButton:Hide()
    CollectionsMicroButton:Hide()
    EJMicroButton:Hide()
    StoreMicroButton:Hide()
    MainMenuMicroButton:Hide()

    -- required because the game does an extra StoreMicroButton:Show() after login
    StoreMicroButton.Show = function() end
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
    button:SetPoint("CENTER", x, y)
end

-- I have no idea why offsetY works the way it does.
-- Something is screwed up with what these are actually anchored to / parented from.
local function MoveAllActionBars(offsetX, offsetY, verticalSpacing)
    MoveActionBarCenterPoint(
        FIRST_ACTION_BAR_BUTTON_NAMES[1],
        -314 + offsetX,
        613 + offsetY)
    MoveActionBarCenterPoint(
        SECOND_ACTION_BAR_BUTTON_NAMES[1],
        -232 + offsetX,
        229 + (offsetY / 2) + (-verticalSpacing))
    MoveActionBarCenterPoint(
        THIRD_ACTION_BAR_BUTTON_NAMES[1],
        -650 + offsetX,
        -85 + (-verticalSpacing * 2))
    MoveActionBarCenterPoint(
        FOURTH_ACTION_BAR_BUTTON_NAMES[1],
        -1233 + offsetX,
        -20 + offsetY + (-verticalSpacing * 3))
end

local function MoveStanceActionBar(offsetX, offsetY)
    local button = _G[STANCE_BAR_BUTTON_NAMES[1]]
    button:ClearAllPoints()
    button:SetPoint("CENTER", -693 + offsetX, 1061 + offsetY)
end

local defaultRaidFrameSortFunc = CompactRaidFrameContainer.flowSortFunc
local function SetDefaultRaidFrameSort()
    CompactRaidFrameContainer.flowSortFunc = defaultRaidFrameSortFunc
    CompactRaidFrameContainer_TryUpdate(CompactRaidFrameContainer)
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


local EventFrame = CreateFrame("Frame")

EventFrame:RegisterEvent("PLAYER_LOGIN")

EventFrame:SetScript("OnEvent", function(self, event, ...)
    ChatFrame1:AddMessage('(VeilgrinUI) Greetings, '..UnitName("Player")..'!')

    RemoveBottomActionBarStyling()
    RemoveMenuMicroButtonAndBagsBar()
    RemoveMacroNamesFromAllActionBars()

    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("CENTER", "WorldFrame", 0, -115)
    CastingBarFrame.SetPoint = function() end
    
    RearrangeAllActionBarsHorizontal()
    MoveAllActionBars(0, -415, 3)

    PlayerFrame:ClearAllPoints()
    PlayerFrame:SetPoint("CENTER", "WorldFrame", -115, -180)
    PlayerFrame.SetPoint = function() end

    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("CENTER", "WorldFrame", 115, -180)
    TargetFrame.SetPoint = function() end

    FocusFrame:ClearAllPoints()
    FocusFrame:SetPoint("CENTER", "WorldFrame", 330, -180)
    FocusFrame.SetPoint = function() end

    MoveStanceActionBar(6, -5)

    RearrangeActionBarHorizontal(STANCE_BAR_BUTTON_NAMES, 4)

    SetCVar("nameplateMinAlpha", 1)

    EnableArenaNameplateNumbers()

    ChatFrame1:AddMessage('(VeilgrinUI) May your blades never dull!')
end)


local updateIntervalSeconds = 0.5;
local timeSinceLastUpdate = 0.0;

EventFrame:SetScript("OnUpdate", function(self, elapsed)
    timeSinceLastUpdate = timeSinceLastUpdate + elapsed;

    if (timeSinceLastUpdate < updateIntervalSeconds) then return end

    -- TODO: Should happen on player load into zone instead of on update. (How do you do this?)
    if IsActiveBattlefieldArena() then
        SetPlayerOnBottomRaidFrameSort()
    else
        SetDefaultRaidFrameSort()
    end

    -- The extra button that appears for special mechanics.
    -- e.g. use Heart of Azeroth, clear Sanity
    ExtraActionButton1:ClearAllPoints()
    ExtraActionButton1:SetPoint("CENTER", "WorldFrame", 0, -550)
    -- Move the strata of the menu bar. Defaults to LOW for ExtraActionButton1.
    -- The menu bar is invisible and on top of the extra action button in MEDIUM, so it eats input events.
    ExtraActionButton1:SetFrameStrata("MEDIUM")
    
    -- The extra information bar that appears for special mechanics.
    PlayerPowerBarAlt:ClearAllPoints()
    PlayerPowerBarAlt:SetPoint("CENTER", "WorldFrame", 0, -300)
    
    timeSinceLastUpdate = 0;
end)
