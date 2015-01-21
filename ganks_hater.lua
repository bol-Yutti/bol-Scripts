

local version = "0.3"

local AUTOUPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/ganks_hater/ganks_hater.lua".."?rand="..math.random(1,10000)
local UPDATE_FILE_PATH = SCRIPT_PATH..GetCurrentEnv().FILE_NAME
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>Ganks Hater:</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTOUPDATE then
local ServerData = GetWebResult(UPDATE_HOST, "/ganks_hater/ganks_hater.version")
if ServerData then
ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
if ServerVersion then
if tonumber(version) < ServerVersion then
AutoupdaterMsg("检查到新版本" ..ServerVersion)
AutoupdaterMsg("更新中，请稍后（途中请不要按F9）")
DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
else
AutoupdaterMsg("最新版本已经更新好了！ ("..ServerVersion..")")
end
end
else
AutoupdaterMsg("错误的版本信息")
end
end
local lastsoundplayed = 0
local soundplayed = false
local gameoverplayed = false
local overtime = false
local wayPointManager = WayPointManager()

local val = false
local nextTick = 0
local delay = 1500

function OnLoad()

	soundPath = SCRIPT_PATH .. "opsounds/ganks_hater\\"

	soundPath = string.gsub(soundPath, "\\", "/" )
	soundPath = string.gsub(soundPath, "/", "\\\\" )
	currentGame = GetGame()
	secTime = currentGame.tick/1000
	
	
	Ganks = scriptConfig("؀GANK׺˖", "Ganks Hater")
	
	Ganks:addSubMenu("[ʹӴ]", "Sounds")
		Ganks.Sounds:addParam("welcome","   ޸ԎϷ۶ӭԯ", SCRIPT_PARAM_ONOFF, false)
		Ganks.Sounds:addParam("voiceonoff","   ʹӴ͡ʾߪژ", SCRIPT_PARAM_ONOFF, false)
		Ganks.Sounds:addParam("danger","   ղҰ޸ɫϒ׽˓Ұ͡ʾ", SCRIPT_PARAM_ONOFF, false)
		Ganks.Sounds:addParam("shutdown","   ֹͣ", SCRIPT_PARAM_ONOFF, false)
	
	Ganks:addParam("announcer","ҥӴ", SCRIPT_PARAM_ONOFF, true)
	Ganks:addParam("voice","ʹӴ", SCRIPT_PARAM_ONOFF, false)
	Ganks:addSubMenu("[ޯ٦ҭ]", "WarningList")
	for _, enemy in ipairs(GetEnemyHeroes()) do

		Ganks.WarningList:addParam(enemy.hash, "   ޯ٦͡ʾ: "..enemy.charName.."", SCRIPT_PARAM_ONOFF, false)

	end
	Ganks:addParam("Drawrange","׶ΧДʾ", SCRIPT_PARAM_ONOFF, true)
	Ganks:addParam("DrawWaypoints","ۭԶ֐׽ղҰ·П ", SCRIPT_PARAM_ONOFF, true)
	Ganks:addParam("DangerText","ΣЕτѾ͡ʾ", SCRIPT_PARAM_ONOFF, true)
	Ganks:addParam("Range", "׶ΧŚޯ٦", SCRIPT_PARAM_SLICE, 3000, 0, 3500, 0)
	Ganks:addParam("autoturn","ʹԃؔ֯ژҕ", SCRIPT_PARAM_ONOFF, true)
	Ganks:addParam("AutoTurnoffat", "Оʱژҕ", SCRIPT_PARAM_SLICE, 20, 0, 120, 0)
	Ganks:addParam("debugmode","ַ˔", SCRIPT_PARAM_ONOFF, false)
	Ganks:addParam("info1", "؀GANK׺˖  "..version.."", SCRIPT_PARAM_INFO, "")
	Ganks:addParam("info2", "ŻĊںۯ", SCRIPT_PARAM_INFO, "")
	

	
	if Ganks.voice and Ganks.Sounds.welcome then
	OnLoadVoice = true
	PlaySoundPS(soundPath .. "hev_logon.wav", 1000)
		if Ganks.debugmode then
		print("hev_logon.wav")
		end 
	else
	OnLoadVoice = false
	end 
	local BolUser = GetUser():lower()
PrintChat("<font color = \"#FFFFFF\">[Lucian] </font><font color=\"#FF0000\">Succesfully authenticated as </font><font color=\"#FFFFFF\">" .. BolUser .. ".</font>")

end 

	
	
function OnTick()


	for _, enemy in ipairs(GetEnemyHeroes()) do

		if val == false and (enemy:GetSpellData(SUMMONER_1).name:find("summonersmite") or enemy:GetSpellData(SUMMONER_2).name:find("summonersmite")) then

			Ganks.WarningList[enemy.hash] = true
			val = true

		end
		
		if not enemy.dead and enemy.visible then
			
			if Ganks.WarningList[enemy.hash] and GetDistance(enemy) <= Ganks.Range then
			if lastsoundplayed+40000 < GetTickCount() and Ganks.announcer and Ganks.Sounds.danger and Ganks.voice and enemy.valid and overtime == false then
				PlaySoundPS(soundPath .. "danger.wav", 1000)
				lastsoundplayed = GetTickCount()
				   
				if Ganks.debugmode then
				print("danger.wav")
				end 
				
			end 	
			end 
			
		end 

	end

	if Ganks.autoturn and GetInGameTimer() > Ganks.AutoTurnoffat * 60 then 
	overtime = true
	else 
	overtime = false
	end 

	if overtime == false then
		if Ganks.voice and Ganks.Sounds.voiceonoff and not soundplayed == true and not OnLoadVoice then
		PlaySoundPS(soundPath .. "voice_on.wav", 1000)
		soundplayed = true
			if Ganks.debugmode then
			print("voice_on.wav")
			end 
		end 
		
		if not Ganks.voice and Ganks.Sounds.voiceonoff and not soundplayed == true and OnLoadVoice then
		PlaySoundPS(soundPath .. "voice_off.wav", 1000)
		soundplayed = true
			if Ganks.debugmode then
			print("voice_off.wav")
			end 
		end 
	 

	end 
	if overtime == true then
	if gameoverplayed == false and Ganks.voice and Ganks.Sounds.shutdown then 
		PlaySoundPS(soundPath .. "hev_shutdown.wav", 1000)
		gameoverplayed = true
		if Ganks.debugmode then
		print("hev_shutdown.wav")
		end 
	end 
	end 
	
end 



function OnDraw()

	if overtime == false then
		if Ganks.Drawrange and not myHero.dead then
		DrawCircleMinimap(myHero.x, myHero.y, myHero.z, Ganks.Range)
		
		end 
		
		for _, enemy in ipairs(GetEnemyHeroes()) do
		
		if not enemy.dead and enemy.visible then
			
			if Ganks.WarningList[enemy.hash] and GetDistance(enemy) <= Ganks.Range then
			if Ganks.DrawWaypoints then
			wayPointManager:DrawWayPoints(enemy)
			end 


			DrawText3D(tostring("Danger !"), myHero.x, myHero.y, myHero.z, 25, ARGB(255, 255, 255, 0), true)

			end 
			
		end 
		end 
		
	end 
	


	

	
end
