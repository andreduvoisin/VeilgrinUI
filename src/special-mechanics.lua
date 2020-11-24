local addonName, addonTable = ...

local function MoveSpecialMechanicsPowerBar()
    PlayerPowerBarAlt:ClearAllPoints()
    PlayerPowerBarAlt:SetPoint("TOP", UIParent, "TOP", 0, 0)
    PlayerPowerBarAlt.ClearAllPoints = function() end
    PlayerPowerBarAlt.SetPoint = function() end
end

local function MoveExtraAbilityContainer()
    ExtraAbilityContainer:ClearAllPoints()
    ExtraAbilityContainer:SetPoint("TOP", UIParent, "TOP", 0, 0)
    ExtraAbilityContainer.ClearAllPoints = function() end
    ExtraAbilityContainer.SetPoint = function() end
end

local function InitializeSpecialMechanics()
    MoveExtraAbilityContainer()
    MoveSpecialMechanicsPowerBar()
end

addonTable.InitializeSpecialMechanics = InitializeSpecialMechanics