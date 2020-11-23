local addonName, addonTable = ...

local function RemoveExperienceBarAtMaxLevel()
    local maxPlayerLevel = GetMaxLevelForLatestExpansion()
    if UnitLevel("player") == maxPlayerLevel then
        StatusTrackingBarManager:Hide()
    end
end

local function RemoveMainMenuBarStyling()
    MainMenuBarArtFrame.LeftEndCap:Hide()
    MainMenuBarArtFrame.RightEndCap:Hide()
    MainMenuBarArtFrameBackground:Hide()

    ActionBarUpButton:Hide()
    ActionBarDownButton:Hide()
    MainMenuBarArtFrame.PageNumber:SetAlpha(0)
end

-- Reference:
-- https://git.tukui.org/elvui/elvui/-/blob/master/ElvUI/Modules/ActionBars/ActionBars.lua#L741
-- Search for "DisableBlizzard" if line number is no longer correct.
local function RemoveMenuMicroButtonAndBagsBar()
    MicroButtonAndBagsBar:SetScale(0.00001)
    MicroButtonAndBagsBar:EnableMouse(false)
    MicroButtonAndBagsBar:SetFrameStrata('BACKGROUND')
    MicroButtonAndBagsBar:SetFrameLevel(0)
end

local defaultRaidFrameSortFunc = CompactRaidFrameContainer.flowSortFunc
local function SetDefaultRaidFrameSort()
    CompactRaidFrameContainer.flowSortFunc = defaultRaidFrameSortFunc
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
end

local function UpdateRaidFrames()
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

local function OnPlayerLogin(self)
    ChatFrame1:AddMessage('(VeilgrinUI) Greetings, '..UnitName("Player")..'!')

    RemoveMainMenuBarStyling()
    RemoveExperienceBarAtMaxLevel()
    RemoveMenuMicroButtonAndBagsBar()

    addonTable.InitializeActionBars()
    addonTable.InitializeStanceBar()

    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("CENTER", UIParent, "CENTER", 0, -115)
    CastingBarFrame.ClearAllPoints = function() end
    CastingBarFrame.SetPoint = function() end

    PlayerFrame:ClearAllPoints()
    PlayerFrame:SetPoint("CENTER", UIParent, "CENTER", -115, -180)
    PlayerFrame.ClearAllPoints = function() end
    PlayerFrame.SetPoint = function() end

    TargetFrame:ClearAllPoints()
    TargetFrame:SetPoint("CENTER", UIParent, "CENTER", 115, -180)
    TargetFrame.ClearAllPoints = function() end
    TargetFrame.SetPoint = function() end

    FocusFrame:ClearAllPoints()
    FocusFrame:SetPoint("CENTER", UIParent, "CENTER", 330, -180)
    FocusFrame.ClearAllPoints = function() end
    FocusFrame.SetPoint = function() end

    ObjectiveTrackerFrame:ClearAllPoints()
    ObjectiveTrackerFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 0, 0)
    ObjectiveTrackerFrame.ClearAllPoints = function() end
    ObjectiveTrackerFrame.SetPoint = function() end

    SetCVar("nameplateMinAlpha", 1)

    EnableArenaNameplateNumbers()

    ChatFrame1:AddMessage('(VeilgrinUI) May your blades never dull!')
end

local function OnPlayerEnteringWorld(self, isInitialLogin, isReloadingUi)
    -- if IsActiveBattlefieldArena() then
    --     SetPlayerOnBottomRaidFrameSort()
    -- else
    --     SetDefaultRaidFrameSort()
    -- end
    -- UpdateRaidFrames()

    ChatFrame1:AddMessage('(VeilgrinUI) Lok\'tar ogar!')
end


local EVENT_PLAYER_LOGIN = "PLAYER_LOGIN"
local EVENT_PLAYER_ENTERING_WORLD = "PLAYER_ENTERING_WORLD"

local EventFrame = CreateFrame("Frame")

EventFrame:RegisterEvent(EVENT_PLAYER_LOGIN)
EventFrame:RegisterEvent(EVENT_PLAYER_ENTERING_WORLD)

EventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == EVENT_PLAYER_LOGIN then
        OnPlayerLogin(self)
    elseif event == EVENT_PLAYER_ENTERING_WORLD then
        OnPlayerEnteringWorld(self, ...)
    end
end)


local updateIntervalSeconds = 0.5;
local timeSinceLastUpdate = 0.0;

EventFrame:SetScript("OnUpdate", function(self, elapsed)
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
