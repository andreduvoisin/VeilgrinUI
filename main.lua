local addonName, addonTable = ...

local function RemoveMenuMicroButtonAndBagsBar()
    MainMenuBarTexture3:Hide()
    MainMenuBarBackpackButton:Hide()
    CharacterBag0Slot:Hide()
    CharacterBag1Slot:Hide()
    CharacterBag2Slot:Hide()
    CharacterBag3Slot:Hide()

    MainMenuBarPerformanceBarFrame:Hide()

    CharacterMicroButton:Hide()
    SpellbookMicroButton:Hide()
    TalentMicroButton:Hide()
    QuestLogMicroButton:Hide()
    SocialsMicroButton:Hide()
    WorldMapMicroButton:Hide()
    MainMenuMicroButton:Hide()
    HelpMicroButton:Hide()
    
    -- required because the game does an extra TalentMicroButton:Show() after login
    TalentMicroButton.Show = function() end
end

local function BottomUnitFrames()
    CRFSort_Group = function(team1, team2)
        if UnitIsUnit(team1, "player") then
            return false
        elseif UnitIsUnit(team2, "player") then
            return true
        else
            return team1 < team2
        end
    end
    CompactRaidFrameContainer.flowSortFunc=CRFSort_Group
end

ChatFrame1:AddMessage('(VeilgrinUI) Greetings, '..UnitName("Player")..'!')

local function OnPlayerLogin(self, event)
    addonTable.InitializeActionBars()
    
    RemoveMenuMicroButtonAndBagsBar()

    QuestWatchFrame:ClearAllPoints()
    QuestWatchFrame:SetPoint("TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", 0, 0)
    QuestWatchFrame.SetPoint = function() end

    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("CENTER", "WorldFrame", 0, -115)
    CastingBarFrame.SetPoint = function() end

    MainMenuBar:ClearAllPoints()
    MainMenuBar:SetPoint("CENTER", "WorldFrame", 0, -443)
    MainMenuBar.SetPoint = function() end

    PlayerFrame:ClearAllPoints()
    PlayerFrame:SetPoint("CENTER", "WorldFrame", -150, -190)
    PlayerFrame:SetScale(0.8, 0.8)
    PlayerFrame.SetPoint = function() end

    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("CENTER", "WorldFrame", 150, -190)
    TargetFrame:SetScale(0.8, 0.8)
    TargetFrame.SetPoint = function() end

    SetCVar("nameplateMinAlpha", 1)

    -- BottomUnitFrames()

    ChatFrame1:AddMessage('(VeilgrinUI) Lok\'tar ogar!')
end

local function OnPlayerEnteringWorld(self, event, isInitialLogin, isReloadingUi)
    ChatFrame1:AddMessage('(VeilgrinUI) May your blades never dull!')
end


local EVENT_PLAYER_LOGIN = "PLAYER_LOGIN"
local EVENT_PLAYER_ENTERING_WORLD = "PLAYER_ENTERING_WORLD"

local function OnEvent(self, event, ...)
    if event == EVENT_PLAYER_LOGIN then
        OnPlayerLogin(self, event)
    elseif event == EVENT_PLAYER_ENTERING_WORLD then
        OnPlayerEnteringWorld(self, event, ...)
    end
end


local EVENT_FRAME = CreateFrame("Frame")

EVENT_FRAME:RegisterEvent(EVENT_PLAYER_LOGIN)
EVENT_FRAME:RegisterEvent(EVENT_PLAYER_ENTERING_WORLD)

EVENT_FRAME:SetScript("OnEvent", OnEvent)
