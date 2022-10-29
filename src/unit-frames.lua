local addonName, addonTable = ...

local function RemovePrestige()
    PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigeBadge:SetAlpha(0)
    PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:SetAlpha(0)

    TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigeBadge:SetAlpha(0)
    TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigePortrait:SetAlpha(0)
end

local function InitializeUnitFrames()
    RemovePrestige()
end

addonTable.InitializeUnitFrames = InitializeUnitFrames