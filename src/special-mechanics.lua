local addonName, addonTable = ...

local SPECIAL_MECHANICS_BUTTON_OFFSET_X = 0
local SPECIAL_MECHANICS_BUTTON_OFFSET_Y = -550
local SPECIAL_MECHANICS_BAR_OFFSET_X = 0
local SPECIAL_MECHANICS_BAR_OFFSET_Y = -300

local function MoveSpecialMechanicsButton()
    -- The extra button that appears for special mechanics.
    -- e.g. use Heart of Azeroth, clear Sanity
    ExtraActionButton1:ClearAllPoints()
    ExtraActionButton1:SetPoint(
        "CENTER",
        UIParent, "CENTER",
        SPECIAL_MECHANICS_BUTTON_OFFSET_X, SPECIAL_MECHANICS_BUTTON_OFFSET_Y)
    -- Move the strata of the menu bar. Defaults to LOW for ExtraActionButton1.
    -- The menu bar is invisible and on top of the extra action button in MEDIUM, so it eats input events.
    ExtraActionButton1:SetFrameStrata("MEDIUM")
end

local function MoveSpecialMechanicsBar()
    -- The extra information bar that appears for special mechanics.
    -- e.g. Sanity meter
    PlayerPowerBarAlt:ClearAllPoints()
    PlayerPowerBarAlt:SetPoint(
        "CENTER",
        UIParent, "CENTER",
        SPECIAL_MECHANICS_BAR_OFFSET_X, SPECIAL_MECHANICS_BAR_OFFSET_Y)
end

local function UpdateSpecialMechanics()
    MoveSpecialMechanicsButton()
    MoveSpecialMechanicsBar()
end

addonTable.UpdateSpecialMechanics = UpdateSpecialMechanics