local addonName, addonTable = ...

local function EnableArenaNameplateNumbers()
    hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
        if IsActiveBattlefieldArena() and frame.unit:find("nameplate") then
            for i = 1, 5 do
                if UnitIsUnit(frame.unit ,"arena"..i) then
                    frame.name:SetText(i)
                    frame.name:SetTextColor(1, 1, 0)
                    break
                end
            end
        end
    end)
end

local function InitializeArena()
    EnableArenaNameplateNumbers()
end

addonTable.InitializeArena = InitializeArena