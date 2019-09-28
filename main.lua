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
	for i=1,40 do
		local unit = "raid"..i
		local name, realm = UnitName(unit)
		if not realm or realm == "" then 
			realm = GetRealmName() 
			realm = string.gsub(realm, "%s+", "")
		end                    
		if name then
			sep = ","
			raidNamesMessage = raidNamesMessage..sep..name.."-"..realm
		end 
	end
	
    RaidListCopyFrame:Show()
    RaidListCopyFrameScroll:Show()
    RaidListCopyFrameScrollText:Show()
    RaidListCopyFrameScrollText:SetText(raidNamesMessage)
    RaidListCopyFrameScrollText:HighlightText()
    RaidListCopyFrameScrollText:SetScript("OnEscapePressed", function(self)
        RaidListCopyFrame:Hide()
    end)
end