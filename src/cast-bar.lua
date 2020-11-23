local addonName, addonTable = ...

local function MoveCastBar(offsetX, offsetY)
    CastingBarFrame:ClearAllPoints()
    CastingBarFrame:SetPoint("CENTER", UIParent, "CENTER", offsetX, offsetY)
    CastingBarFrame.ClearAllPoints = function() end
    CastingBarFrame.SetPoint = function() end
end

local function InitializeCastBar()
    MoveCastBar(0, -115)
end

addonTable.InitializeCastBar = InitializeCastBar