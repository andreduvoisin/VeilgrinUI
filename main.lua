local addonName, addonTable = ...


ChatFrame1:AddMessage('(VeilgrinUI) Greetings, '..UnitName("Player")..'!')


local function OnPlayerLogin(self, event)
    addonTable.InitializeActionBars()
    addonTable.InitializeArena()
    addonTable.InitializeCastBar()
    addonTable.InitializeMicroButtonAndBagsBar()
    addonTable.InitializeNameplates()
    addonTable.InitializeQuestTracker()
    addonTable.InitializeSpecialMechanics()
    addonTable.InitializeStanceBar()
    addonTable.InitializeUnitFrames()

    ChatFrame1:AddMessage('(VeilgrinUI) Lok\'tar ogar!')
end

local function OnPlayerEnteringWorld(self, event, isInitialLogin, isReloadingUi)
    addonTable.InitializeMainMenuBar()
    
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
