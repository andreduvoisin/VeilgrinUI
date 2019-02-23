
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

local function RemoveMacroNamesFromActionBars()
    for i=1, 12 do
        -- main action bar
        _G["ActionButton"..i.."Name"]:SetAlpha(0)
        -- bottom right action bar
        _G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0)
        -- bottom left action bar
        _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0)
        -- right action bar
        _G["MultiBarRightButton"..i.."Name"]:SetAlpha(0)
        -- left action bar
        _G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0)
    end
end

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")
EventFrame:SetScript("OnEvent", function(self, event, ...)
    RemoveBottomActionBarStyling()
    RemoveMenuMicroButtonAndBagsBar()
    RemoveMacroNamesFromActionBars()
end)
