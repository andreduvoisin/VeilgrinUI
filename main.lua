local EventFrame = CreateFrame("Frame")

EventFrame:RegisterEvent("PLAYER_LOGIN")

EventFrame:SetScript("OnEvent", function(self,event,...)
    -- bottom styling
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()
    StatusTrackingBarManager:Hide()
    ActionBarDownButton:Hide()
    ActionBarUpButton:Hide()
    MainMenuBarArtFrame.PageNumber:SetAlpha(0)

    -- menu and bags
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

    -- remove macro names from bars
    for i=1, 12 do
        _G["ActionButton"..i.."Name"]:SetAlpha(0) -- main bar
        _G["MultiBarBottomRightButton"..i.."Name"]:SetAlpha(0) -- bottom right bar
        _G["MultiBarBottomLeftButton"..i.."Name"]:SetAlpha(0) -- bottom left bar
        _G["MultiBarRightButton"..i.."Name"]:SetAlpha(0) -- right bar
        _G["MultiBarLeftButton"..i.."Name"]:SetAlpha(0) -- left bar
    end
end)
