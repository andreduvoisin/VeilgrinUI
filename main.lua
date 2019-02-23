
local function RemoveBottomActionBarStyling()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()

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
    StoreMicroButton:SetScript("OnShow", StoreMicroButton.Hide)
end

-- bottom right and bottom left are also anchored to the main action bar
local MAIN_ACTION_BAR_FIRST_BUTTON = "ActionButton"
local BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON = "MultiBarBottomRightButton"
local BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON = "MultiBarBottomLeftButton"
local RIGHT_ACTION_BAR_FIRST_BUTTON = "MultiBarRightButton"
local LEFT_ACTION_BAR_FIRST_BUTTON = "MultiBarLeftButton"

local function RemoveMacroNamesFromActionBar(name)
    for i=1, 12 do
        _G[name..i.."Name"]:SetAlpha(0)
    end
end

local function RemoveMacroNamesFromAllActionBars()
    RemoveMacroNamesFromActionBar(MAIN_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(RIGHT_ACTION_BAR_FIRST_BUTTON)
    RemoveMacroNamesFromActionBar(LEFT_ACTION_BAR_FIRST_BUTTON)
end

local function RearrangeActionBarHorizontal(name)
    for i = 2, 12 do
        local button = _G[name..i]
        button:ClearAllPoints()
        button:SetPoint("LEFT", name..i - 1, "RIGHT", 6, 0)
    end
end

local function RearrangeAllActionBarsHorizontal()
    RearrangeActionBarHorizontal(MAIN_ACTION_BAR_FIRST_BUTTON)
    RearrangeActionBarHorizontal(BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON)
    RearrangeActionBarHorizontal(BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON)
    RearrangeActionBarHorizontal(RIGHT_ACTION_BAR_FIRST_BUTTON)
    RearrangeActionBarHorizontal(LEFT_ACTION_BAR_FIRST_BUTTON)
end

local function MoveActionBarCenterPoint(name, x, y)
    local button = _G[name..1]
    button:ClearAllPoints()
    button:SetPoint("CENTER", x, y)
end

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")
EventFrame:SetScript("OnEvent", function(self, event, ...)
    RemoveBottomActionBarStyling()
    RemoveMenuMicroButtonAndBagsBar()
    RemoveMacroNamesFromAllActionBars()
    RearrangeAllActionBarsHorizontal()

    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("CENTER", 0, -130)

    MoveActionBarCenterPoint(MAIN_ACTION_BAR_FIRST_BUTTON, -230, 300)
    MoveActionBarCenterPoint(BOTTOM_RIGHT_ACTION_BAR_FIRST_BUTTON, -650, -86)
    MoveActionBarCenterPoint(BOTTOM_LEFT_ACTION_BAR_FIRST_BUTTON, -232, 72)
    MoveActionBarCenterPoint(RIGHT_ACTION_BAR_FIRST_BUTTON, -1276, -334)
    MoveActionBarCenterPoint(LEFT_ACTION_BAR_FIRST_BUTTON, -1233, -376)
end)
