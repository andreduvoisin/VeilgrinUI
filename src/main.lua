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

local EVENT_FRAME = CreateFrame("Frame")

EVENT_FRAME:RegisterEvent(EVENT_PLAYER_LOGIN)

EVENT_FRAME:SetScript("OnEvent", function(self, event, ...)
    if event == EVENT_PLAYER_LOGIN then
        OnPlayerLogin(self)
    end
end)

local updateIntervalSeconds = 0.5;
local timeSinceLastUpdate = 0.0;

EVENT_FRAME:SetScript("OnUpdate", function(self, elapsed)
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
