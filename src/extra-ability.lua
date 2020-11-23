local addonName, addonTable = ...

local function MoveExtraAbilityContainer()
    ExtraAbilityContainer:ClearAllPoints()
    ExtraAbilityContainer:SetPoint("TOP", UIParent, "TOP", 0, 0)
    ExtraAbilityContainer.ClearAllPoints = function() end
    ExtraAbilityContainer.SetPoint = function() end
end

local function InitializeExtraAbility()
    MoveExtraAbilityContainer()
end

addonTable.InitializeExtraAbility = InitializeExtraAbility