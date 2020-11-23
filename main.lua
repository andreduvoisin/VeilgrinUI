local addonName, addonTable = ...


local function OnPlayerLogin(self)
    ChatFrame1:AddMessage('(VeilgrinUI) Greetings, '..UnitName("Player")..'!')

    addonTable.InitializeActionBars()
    addonTable.InitializeArena()
    addonTable.InitializeCastBar()
    addonTable.InitializeExperienceBar()
    addonTable.InitializeMainMenuBar()
    addonTable.InitializeMicroButtonAndBagsBar()
    addonTable.InitializeNameplates()
    addonTable.InitializeQuestTracker()
    addonTable.InitializeStanceBar()
    addonTable.InitializeUnitFrames()

    ChatFrame1:AddMessage('(VeilgrinUI) May your blades never dull!')
end


local EVENT_PLAYER_LOGIN = "PLAYER_LOGIN"

local function OnEvent(self, event, ...)
    if event == EVENT_PLAYER_LOGIN then
        OnPlayerLogin(self)
    end
end


local TICK_INTERVAL_SECONDS = 0.5;
local TIME_SINCE_LAST_TICK_SECONDS = 0.0;

local function OnUpdate(self, deltaSeconds)
    TIME_SINCE_LAST_TICK_SECONDS = TIME_SINCE_LAST_TICK_SECONDS + deltaSeconds;

    if (TIME_SINCE_LAST_TICK_SECONDS < TICK_INTERVAL_SECONDS) then
        return
    end

    addonTable.UpdateSpecialMechanics()
    
    TIME_SINCE_LAST_TICK_SECONDS = 0.0;
end


local EVENT_FRAME = CreateFrame("Frame")

EVENT_FRAME:RegisterEvent(EVENT_PLAYER_LOGIN)

EVENT_FRAME:SetScript("OnEvent", OnEvent)
EVENT_FRAME:SetScript("OnUpdate", OnUpdate)
