SapphironAchieveChecker = LibStub("AceAddon-3.0"):NewAddon("SapphironAchieveChecker", "AceConsole-3.0", "AceEvent-3.0" );


NeooptionTable = {
		name = "SapphironAchieveChecker",
		handler = SapphironAchieveChecker,
		type = 'group',
		args = {

				check =   {
									name="Check raid resistances",
									desc = "Check the resistances of the raid group for frost",
									type = "execute",
									func ="RunCheck"
						}
				
				
				}
			}

LibStub("AceConfig-3.0"):RegisterOptionsTable("SapphironAchieveChecker", NeooptionTable, {"sac"})
function SapphironAchieveChecker:OnInitialize()
    -- Called when the addon is loaded

    -- Print a message to the chat frame
 
end

function SapphironAchieveChecker:OnEnable()
    -- Called when the addon is enabled

    -- Print a message to the chat frame

end

function SapphironAchieveChecker:OnDisable()
    -- Called when the addon is disabled
end

function SapphironAchieveChecker:RunCheck()

	members = GetNumRaidMembers();

	for i = 1, members do

		base, total, bonus, minus =UnitResistance("raid"..tostring( i) ,4)
		SendChatMessage(UnitName("raid"..tostring( i)).." has "..tostring(total).." frost resistance.", "RAID");
	end
end
