local addonName, addonTable = ...

local function MoveQuestTrackerToUnderMinimap()
    ObjectiveTrackerFrame:ClearAllPoints()
    -- Move the top right corner of the quest tracker to be at the bottom right corner of the minimap.
    ObjectiveTrackerFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 0, 0)
    ObjectiveTrackerFrame.ClearAllPoints = function() end
    ObjectiveTrackerFrame.SetPoint = function() end
end

local function InitializeQuestTracker()
    MoveQuestTrackerToUnderMinimap()
end

addonTable.InitializeQuestTracker = InitializeQuestTracker