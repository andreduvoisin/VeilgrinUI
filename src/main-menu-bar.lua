local addonName, addonTable = ...

local function RemoveMainMenuBarStyling()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()

    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarArtFrame.PageNumber:SetAlpha(0)
end

local function InitializeMainMenuBar()
    RemoveMainMenuBarStyling()
end

addonTable.InitializeMainMenuBar = InitializeMainMenuBar