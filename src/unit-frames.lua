local addonName, addonTable = ...

local function MoveUnitFrame(frame, offsetX, offsetY)
    frame:ClearAllPoints()
    frame:SetPoint("CENTER", UIParent, "CENTER", offsetX, offsetY)
    frame.ClearAllPoints = function() end
    frame.SetPoint = function() end
end

local function InitializeUnitFrames()
    MoveUnitFrame(PlayerFrame, -115, -180)
    MoveUnitFrame(TargetFrame, 115, -180)
    MoveUnitFrame(FocusFrame, 330, -180)
end

addonTable.InitializeUnitFrames = InitializeUnitFrames