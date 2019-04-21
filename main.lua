BoostHelper = LibStub("AceAddon-3.0"):NewAddon("BoostHelper", "AceConsole-3.0")
GUI = LibStub("AceGUI-3.0", true)
BoostHelper:RegisterChatCommand("bh",  "CommandProcessor")
BoostHelper:RegisterChatCommand("boosthelper",  "CommandProcessor")

function BoostHelper:OnInitialize()

end

function BoostHelper:OnEnable()

end

function BoostHelper:OnDisable()

end

function BoostHelper:CommandProcessor(input)
    if input == "names" then
        BoostHelper:ListProcessor()
    else
        BoostHelper:ListProcessor()
    end
end


function BoostHelper:ListProcessor()
    local raidNamesMessage = ""
    local raidNames = {}
    for i=1,40 do
        local raiderName = GetRaidRosterInfo(i)
        if raiderName == nil then
            break
        end
        if raiderName:match("-")== nil then
            raiderName = raiderName .. "-"
            raiderName = raiderName .. GetRealmName()
        end
        raidNames[#raidNames + 1] = string.gsub(raiderName, "%s+", "")
    end

    raidNamesMessage = table.concat(raidNames, "\n")

    RaidListCopyFrame:Show()
    RaidListCopyFrameScroll:Show()
    RaidListCopyFrameScrollText:Show()
    RaidListCopyFrameScrollText:SetText(raidNamesMessage)
    RaidListCopyFrameScrollText:HighlightText()
    RaidListCopyFrameScrollText:SetScript("OnEscapePressed", function(self)
        RaidListCopyFrame:Hide()
    end)
end