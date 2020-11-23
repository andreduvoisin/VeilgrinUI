local addonName, addonTable = ...

local STANCE_BAR_BUTTON_NAME = "StanceButton"

local STANCE_BAR = {
    STANCE_BAR_BUTTON_NAME..1,
    STANCE_BAR_BUTTON_NAME..2,
    STANCE_BAR_BUTTON_NAME..3,
    STANCE_BAR_BUTTON_NAME..4,
    STANCE_BAR_BUTTON_NAME..5,
    STANCE_BAR_BUTTON_NAME..6
}

local STANCE_BAR_BUTTON_HORIZONTAL_SPACING = 4

local function RearrangeStanceBarHorizontal()
    for i = 2, table.getn(STANCE_BAR) do
        local button = _G[STANCE_BAR[i]]
        button:ClearAllPoints()
        button:SetPoint("LEFT", STANCE_BAR[i - 1], "RIGHT", STANCE_BAR_BUTTON_HORIZONTAL_SPACING, 0)
    end
end

local function MoveStanceBar(offsetX, offsetY)
    local button = _G[STANCE_BAR[1]]
    button:ClearAllPoints()
    button:SetPoint("TOPLEFT", UIParent, "TOPLEFT", offsetX, offsetY)
end

local function InitializeStanceBar()
    RearrangeStanceBarHorizontal()
    MoveStanceBar(6, -5)
end

addonTable.InitializeStanceBar = InitializeStanceBar