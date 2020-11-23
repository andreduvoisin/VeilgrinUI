local addonName, addonTable = ...

local function InitializeNameplates()
    SetCVar("nameplateMinAlpha", 1)
end

addonTable.InitializeNameplates = InitializeNameplates