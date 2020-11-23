local addonName, addonTable = ...

local function RemoveExperienceBarAtMaxLevel()
    local maxPlayerLevel = GetMaxLevelForLatestExpansion()
    if UnitLevel("player") == maxPlayerLevel then
        StatusTrackingBarManager:Hide()
        StatusTrackingBarManager.Show = function() end
    end
end

local function CenterMainMenuBar()
    MainMenuBar:ClearAllPoints()
    MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, MainMenuBar:GetYOffset())
    MainMenuBar.ClearAllPoints = function() end
    MainMenuBar.SetPoint = function() end
end

local function RemoveMainMenuBarStyling()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()

    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarArtFrame.PageNumber:SetAlpha(0)
end

local function InitializeMainMenuBar()
    CenterMainMenuBar()

    RemoveMainMenuBarStyling()
    RemoveExperienceBarAtMaxLevel()
end

addonTable.InitializeMainMenuBar = InitializeMainMenuBar