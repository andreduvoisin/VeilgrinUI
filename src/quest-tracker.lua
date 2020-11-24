local addonName, addonTable = ...

local function MoveQuestTrackerToUnderMinimap()
    ObjectiveTrackerFrame:ClearAllPoints()
    -- Set the top right corner of the quest tracker to be at the bottom right corner of the minimap.
    ObjectiveTrackerFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 0, 0)
    -- Set the bottom right cornder of the quest tracker to be at the bottom right of the screen.
    -- This effectively allows it to have contents all the way to the bottom of the screen. 
    ObjectiveTrackerFrame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0);
    ObjectiveTrackerFrame.ClearAllPoints = function() end
    ObjectiveTrackerFrame.SetPoint = function() end
end

local function InitializeQuestTracker()
    MoveQuestTrackerToUnderMinimap()
end

addonTable.InitializeQuestTracker = InitializeQuestTracker