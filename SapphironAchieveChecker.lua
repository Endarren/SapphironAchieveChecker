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
						},
				tar =   {
									name="Check targets resistances",
									desc = "Check the resistances of the raid group for frost",
									type = "execute",
									func ="RunCheckTar"
				},
			group =   {
									name="TEST",
									desc = "TEST",
									type = "execute",
									func ="GroupCheck"
						},
				
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
function SapphironAchieveChecker:GroupCheck()
	inBG = UnitInBattleground("player") ~= nil
	inRaid = UnitInRaid("player") ~= nil
	inPar = GetNumPartyMembers()~=0

	print("In BG = "..tostring(inBG)..". In Raid = ".. tostring(inRaid)..". In Party = ".. tostring(inPar)) 
end
function SapphironAchieveChecker:RunCheck()

	members = GetNumRaidMembers();
	
	for i = 1, members do

		
	
		frostResist=0
		raceName, raceID =UnitRace("raid"..i) 
		if raceID == "Dwarf" then
			frostResist = UnitLevel("raid"..i)
		end
		for x=1,40 do 
			local B,rank,icon,count,dis,dur,exp,caster=UnitBuff("raid"..i,x); 
			if B then 

				if B == "Mage Armor" then
					frostResist=frostResist+45
					SendChatMessage(UnitName(caster).." please switch your Armor", "RAID");
				end
				if B == "Mark of the Wild" then
					frostResist=frostResist+97
				end 
				if B == "Resistance Aura" then
					print("Resistance Aura casted by "..UnitName(caster))
					SendChatMessage(caster.." please remove your Resistance Aura", "RAID");
				frostResist=frostResist+195
				end
				if B == "Elemental Resistance Totem" then
				print("Elemental Resistance Totem casted by "..UnitName(caster))
					SendChatMessage(UnitName(caster).." please remove your  Elemental Resistance Totem", "RAID");
				frostResist=frostResist+195
				end
			end 
		end
		SendChatMessage(UnitName("raid"..tostring(i)).." has "..tostring(frostResist).." frost resistance.", "RAID");
	end
	
end
function SapphironAchieveChecker:RunCheckTar()


		frostResist=0
	raceName, raceID =UnitRace("target") 
		if raceID == "Dwarf" then
			frostResist = UnitLevel("target")
		end
		for x=1,40 do 
			local B,rank,icon,count,dis,dur,exp,caster=UnitBuff("target",x); 
			if B then 
	

				if B == "Mage Armor" then
					frostResist=frostResist+45
					--SendChatMessage(caster.." please switch your Armor", "RAID");
				end
				if B == "Mark of the Wild" then
					frostResist=frostResist+97

				end 
				if B == "Resistance Aura" then
					print("Resistance Aura casted by "..UnitName(caster))
					--SendChatMessage(caster.." please remove your Resistance Aura", "RAID");
				frostResist=frostResist+195
				end
				if B == "Elemental Resistance Totem" then
				print("Elemental Resistance Totem casted by "..UnitName(caster))
					--SendChatMessage(caster.." please remove your  Elemental Resistance Totem", "RAID");
				frostResist=frostResist+195
				end
			end 
		end
		print( UnitName("target").." has "..tostring(frostResist).." frost resistance.");
	
	
end