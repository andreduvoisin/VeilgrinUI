local addonName, addonTable = ...

-- Reference:
-- https://git.tukui.org/elvui/elvui/-/blob/master/ElvUI/Modules/ActionBars/ActionBars.lua#L943
-- Search for "DisableBlizzard" if line number is no longer correct.
local function RemoveMicroButtonAndBagsBar()
    MicroButtonAndBagsBar:SetScale(0.00001)
    MicroButtonAndBagsBar:EnableMouse(false)
    MicroButtonAndBagsBar:SetFrameStrata('BACKGROUND')
    MicroButtonAndBagsBar:SetFrameLevel(0)
end

local function InitializeMicroButtonAndBagsBar()
    RemoveMicroButtonAndBagsBar()
end

addonTable.InitializeMicroButtonAndBagsBar = InitializeMicroButtonAndBagsBar