local addonName, addonTable = ...

local CAST_BAR_OFFSET_X = 0
local CAST_BAR_OFFSET_Y = -115

local function MoveCastBar()
    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint(
        "CENTER",
        UIParent, "CENTER",
        CAST_BAR_OFFSET_X, CAST_BAR_OFFSET_Y)
    CastingBarFrame.ClearAllPoints = function() end
    CastingBarFrame.SetPoint = function() end
end

local function InitializeCastBar()
    MoveCastBar()
end

addonTable.InitializeCastBar = InitializeCastBar