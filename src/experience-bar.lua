local addonName, addonTable = ...

local function RemoveExperienceBarAtMaxLevel()
    local maxPlayerLevel = GetMaxLevelForLatestExpansion()
    if UnitLevel("player") == maxPlayerLevel then
        StatusTrackingBarManager:Hide()
    end
end

local function InitializeExperienceBar()
    RemoveExperienceBarAtMaxLevel()
end

addonTable.InitializeExperienceBar = InitializeExperienceBar