

local sVersion = '1.0';
local rVersion = GetWebResult('raw.githubusercontent.com', '/bol-Yutti/bol-Scripts/master/1A-Boom%20228326871.version?no-cache=' .. math.random(1, 25000));

if ((rVersion) and (tonumber(rVersion) ~= nil)) then
	if (tonumber(sVersion) < tonumber(rVersion)) then
		print('<font color="#FF1493"><b>[Boom]</b> </font><font color="#FFFF00">检查到有新版本，正在更新...</font>');
		DownloadFile('https://raw.githubusercontent.com/bol-Yutti/bol-Scripts/master/1A-Boom%20228326871.lua?no-cache=' .. math.random(1, 25000), (SCRIPT_PATH.. GetCurrentEnv().FILE_NAME), function()
			print('<font color="#FF1493"><b>[Boom]</b> </font><font color="#00FF00">脚本已更新，请重新加载 F9 X2</font>');
		end);
		return;
	end;
else
	print('<font color="#FF1493"><b>[Boom]</b> </font><font color="#FF0000">Update Error</font>');
end;

if (not VIP_USER) then
	print('<font color="#FF1493"><b>[p_skinChanger]</b> </font><font color="#FF0000">Non-VIP Not Supported</font>');
	return;
elseif ((string.find(GetGameVersion(), 'Releases/5.23') == nil) and ((string.find(GetGameVersion(), 'Releases/5.24') == nil))) then
		print('<font color="#FF1493"><b>[p_skinChanger]</b> </font><font color="#FF0000">Game Version Not Supported</font>');
		return;
end;

----------------------
local URL ="https://raw.githubusercontent.com/bol-Yutti/bol-Scripts/master/Auth.txt"


function auth()
	local a1 = GetWebResult('raw.github.com','/bol-Yutti/bol-Scripts/master/Auth.txt')
	print("webResult: ",a1,type(a1),#a1);
	if a1 == "true" or a1:find("true") then 
		print("沃日你,明明通过了");
		return true;
	elseif a1 == "false" or a1:find("false") then 
		return false;
	end 
	
	return false;
end



local BolUser = GetUser():lower()
if auth() then
	print("<font color=\"#FFFFFF\">您的BOL帐号为:</font> <font color=\"#FF0000\">" .. BolUser .. "</font> <font color='#FFFF00'> 验证成功</font> </font>")
else
	print("<font color=\"#FFFFFF\">您的BOL帐号为:</font> <font color=\"#FF0000\">" .. BolUser .. "</font> <font color='#FFFF00'> 您的帐号并未授权！</font></font>")
	return
end
-----------------------

if _ENV.FILE_NAME ~= "1A-Boom 22832687111111.lua" then
    PrintChat("<font color='#D859CD'>文件名不得修改，请重命名汉化文件为: '1A-Boom 228326871.lua' </font>")
    
PrintChat("<font color='#D859CD'>文件名不得修改，请重命名汉化文件为: '1A-Boom 228326871.lua' </font>")

PrintChat("<font color='#D859CD'>文件名不得修改，请重命名汉化文件为: '1A-Boom 228326871.lua' </font>")

PrintChat("<font color='#D859CD'>文件名不得修改，请重命名汉化文件为: '1A-Boom 228326871.lua' </font>")
PrintChat("<font color='#D859CD'>文件名不得修改，请重命名汉化文件为: '1A-Boom 228326871.lua' </font>")
    -- return
end
function OnDraw()
if (myHero.health < 5000)
then
DrawText("ςܰ͡ʾúτݾĻһփўل ìȫטļĻںۯޅѾĻΪú '1A-BoomBoomBoom.lua'ìɧڻûںۯìȫݬөá",15,600,40,0XFFFFFF00)
end


end
-------------------------------------


---------------------------
local Config = nil
local Master = nil
local ChangingKeyVariable = nil
local MenuIndex = nil
local LastKeyState = nil
local ChangingKeyInstance = nil
local HeaderSprite = nil
local SelectorConfig = nil
local Background = nil
local Foreground = nil
local FontColor = nil
local White = nil
local Gray = nil
local DarkGreen = nil
local DarkRed = nil
local LightGray = nil

local MenuKey = 16
local GameEnemyCount = 0

local InitConfig = true
local InitDraw = true
local InitOnDraw = true
local InitOnMsg = true

local ChangingKey = false
local ChangingKeyMenu = false
local Moving = false
local SliceInstance = false
local ListInstance = false

local Instances = { }
local GameHeroes = { }


local Draw = {
	Width = 374, -- even number or separator lines on params will be off by one
	Padding = 3,
	FontSize = 14,
	Opacity = 60,
    ColorOpacity = 100,
    FontOpacity = 255,
	Row4x = 0.8,
	Row3x = 0.7,
	CellHeight = 20,
	HeaderHeight = 30,
	DetailWidth = 35, -- ex: number beside slider
}
local Global = {
	TS_SetFocus = _G.TS_SetFocus,
	TS_SetHeroPriority = _G.TS_SetHeroPriority,
	TS_Ignore = TS_Ignore,
}
local MouseOffset = {
	x = 0,
	y = 0,
}
local Modifying = {
	Width = false,
}
local Colors = {
	Background = { 23, 32, 33 },
	Foreground = { 38, 76, 72 },
	FontColor = { 255, 255, 255 },
	White = { 255, 255, 255 },
	Gray = { 128, 128, 128 },
	DarkGreen = { 0, 128, 0 },
	DarkRed = { 128, 0, 0 },
	LightGray = { 211, 211, 211 },
}

function Class(name)
	local o = { }
	o.__index = o
	setmetatable(o, {
		__call = function(_, ...)
			local i = { }
			setmetatable(i, o)
			if (i.__init) then
				i.__init(i, table.unpack({ ... }))
			end
			return i
		end
	})
	_ENV[name] = o
end
function SensitiveMerge(base, mergeTable)
	for i, v in pairs(mergeTable) do
		if (type(base[i]) == type(v)) then
			if (type(v) == "table") then
				SensitiveMerge(base[i], v)
			else
				base[i] = v
			end
		end
	end
	return base
end
function MergeExisting(t1, t2)
	local output = t1
	if (t2) then
		for k1, v in pairs(t2) do
			for k2, _ in pairs(t1) do
				if (k2 == k1) then
					output[k1] = v
					break
				end
			end
		end
	end
	return output
end
function GetKeyAsString(key)
	if (key == 46) then
		return "n/a"
	end
	return ((key > 32) and (key < 96) and string.char(key) or tostring(key))
end

function LoadSettings(name)
	if (not GetSave("scriptConfig")[name]) then
		GetSave("scriptConfig")[name] = { }
	end
    return GetSave("scriptConfig")[name]
end
function SaveSettings(name, content)
    if (not GetSave("scriptConfig")[name]) then
		GetSave("scriptConfig")[name] = { }
	end
    table.clear(GetSave("scriptConfig")[name])
    table.merge(GetSave("scriptConfig")[name], content, true)
	GetSave("scriptConfig"):Save()
end
function RemoveSettings(name)
    if not GetSave("scriptConfig")[name] then 
        GetSave("scriptConfig")[name] = {} 
    end
    table.clear(GetSave("scriptConfig")[name])
end

function UpdateMaster()
	Master = LoadSettings("Master")
    MasterY, MasterYp = 1, 0
    MasterY = (Master.useTS and 1 or 0)
    for i = 1, MasterIndex - 1 do
        MasterY = MasterY + Master["I" .. i]
        MasterYp = MasterYp + Master["PS" .. i]
    end
    local size, sizep = (Master.useTS and 2 or 1), 0
    for i = 1, Master.iCount do
        size = size + Master["I" .. i]
        sizep = sizep + Master["PS" .. i]
    end
	Draw.x = Master.x or Draw.x
	Draw.y = Master.y or Draw.y

end
function SaveMaster()
	local settings = {
		x = Draw.x,
		y = Draw.y,
        px = Draw.px,
        py = Draw.py,
	}
    local P, PS, I = 0, 0, 0
    for _, instance in pairs(Instances) do
        I = I + 1
        P = P + #instance._param
        PS = PS + #instance._permaShow
    end
    Master["I" .. MasterIndex] = I
    Master["P" .. MasterIndex] = P
    Master["PS" .. MasterIndex] = PS
    if not Master.useTS and SelectorConfig then Master.useTS = true end
    for var, value in pairs(Master) do
        settings[var] = value
    end
	SaveSettings("Master", settings)
end
function SaveMenu()
	GetSave("scriptConfig").Menu.menuKey = MenuKey
	GetSave("scriptConfig"):Save()
	SaveMaster()
end

function GetGameHero(target)
    if (type(target) == "string") then
		for i = 1, #GameHeroes do
			local gameHero = GameHeroes[i]
            if ((gameHero.hero.charName == target) and (gameHero.hero.team ~= player.team)) then
                return gameHero.hero
            end
        end
    elseif (type(target) == "number") then
        return heroManager:getHero(target)
    elseif (target == nil) then
        return GetTarget()
    else
        return target
    end
end
function GetGameHeroIndex(target)
	if (type(target) == "string") then
		for i = 1, #GameHeroes do
			local gameHero = GameHeroes[i]
            if ((gameHero.hero.charName == target) and (gameHero.hero.team ~= player.team)) then
                return gameHero.index
            end
        end
    elseif (type(target) == "number") then
        return target
    else
        return GetGameHeroIndex(target.charName)
    end
end

function InitializeConfig(name)
	if (name == nil) then
		return (InitConfig or InitializeDraw())
	end
    local gameStart = GetGame()
	if (InitConfig) then
		InitConfig = nil
		InitializeDraw()
		MergeExisting(Draw, LoadSettings("Master"))
        Master = LoadSettings("Master")
        RemoveSettings("Master")
        MasterIndex = 1
        Master.useTS = false
        Master.x = Draw.x
        Master.y = Draw.y
        Master.px = Draw.px
        Master.py = Draw.py
        Master.osTime = gameStart.osTime
        Master.name1 = name
        Master.iCount = 1
		SaveMaster()
	end
	UpdateMaster()
end
function InitializeDraw()
	if (InitDraw) then
		InitDraw = nil
		UpdateWindow()
		Draw.x = WINDOW_W and math.floor(WINDOW_W / 50) or 20
		Draw.y = WINDOW_H and math.floor(WINDOW_H / 4) or 20
        Draw.px = WINDOW_W and math.floor(WINDOW_W * 0.66) or 675
        Draw.py = WINDOW_H and math.floor(WINDOW_H * 0.8) or 608
        Draw.PermashowFontSize = WINDOW_H and math.round(WINDOW_H / 60) -2 or 14
        Draw.midSize = Draw.PermashowFontSize / 2
        Draw.border = 1
        Draw.cellSize = Draw.border + Draw.PermashowFontSize
		Draw.Width = WINDOW_W and math.round(WINDOW_W / 4.8) or 213
        Draw.row = Draw.Width * 0.7
		Draw.Row4 = Draw.Width * Draw.Row4x
		Draw.Row3 = Draw.Width * Draw.Row3x
		--Draw.CellHeight = Draw.FontSize * 1.3
		--Draw.HeaderHeight = math.round(Draw.CellHeight * 1.4)
		--Draw.DetailWidth = Draw.FontSize * 2.2
		Background = ARGB(Draw.Opacity, Colors.Background[1], Colors.Background[2], Colors.Background[3])
		Foreground = ARGB(Draw.Opacity, Colors.Foreground[1], Colors.Foreground[2], Colors.Foreground[3])
		FontColor = ARGB(Draw.FontOpacity, Colors.FontColor[1], Colors.FontColor[2], Colors.FontColor[3])
		White = ARGB(Draw.FontOpacity, Colors.White[1], Colors.White[2], Colors.White[3])
		Gray = ARGB(Draw.FontOpacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3])
		DarkGreen = ARGB(Draw.Opacity, Colors.DarkGreen[1], Colors.DarkGreen[2], Colors.DarkGreen[3])
		DarkRed = ARGB(Draw.ColorOpacity, Colors.DarkRed[1], Colors.DarkRed[2], Colors.DarkRed[3])
		LightGray = ARGB(Draw.FontOpacity, Colors.LightGray[1], Colors.LightGray[2], Colors.LightGray[3])
		MenuKey = LoadSettings("Menu").menuKey or 16
		if ((WINDOW_H < 500) or (WINDOW_W < 500)) then
			return true
		end
	end
	return InitDraw
end
function InitializeGameHeroes()
	for i = 1, heroManager.iCount do
		local hero = heroManager:getHero(i)
		if (hero and hero.valid (hero.team ~= myHero.team)) then
			GameEnemyCount = GameEnemyCount + 1
			GameHeroes[#GameHeroes + 1] = {
				hero = hero,
				index = i,
				tIndex = GameEnemyCount,
				ignore = false,
				priority = 1,
				enemy = true,
			}
		end
	end
end

function LoadConfig()
	if (InitOnDraw) then
		InitOnDraw = nil
		AddDrawCallback(ConfigOnDraw)
	end
	if (InitOnMsg) then
		InitOnMsg = nil
		AddMsgCallback(ConfigOnWndMsg)
	end
end

function StartMoveWithMouse()
	Moving = true
	local pos = GetCursorPos()
	MouseOffset.x = pos.x - Draw.x
	MouseOffset.y = pos.y - Draw.y
end

function ConfigOnDraw()
	if (InitializeConfig() or Console__IsOpen or GetGame().isOver) then return end
        local y1 = Draw.py + (Draw.cellSize * MasterYp)
------------------------------Function------------------------------
local function DrawPermaShows(instance)
    --print("permashownum:",#instance._permaShow)
if #instance._permaShow > 0 then
    for _, varIndex in ipairs(instance._permaShow) do
        --if(type(instance[instance._param[_].var]) == "number") then
        local pVar = instance[instance._param[_].var] 
        --print(type(pVar))
        --local var = self[self._param[i].var]
        DrawLine(Draw.px - Draw.border, y1 + Draw.midSize, Draw.px + Draw.row - Draw.border, y1 + Draw.midSize, Draw.cellSize, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
        for i, v in pairs(instance._param) do
            if (v.var == varIndex) then
                DrawTextA(v.text, Draw.PermashowFontSize, Draw.px, y1, White, "left", "left")
                if v.pType == SCRIPT_PARAM_SLICE or v.pType == SCRIPT_PARAM_LIST or v.pType == SCRIPT_PARAM_INFO then
                DrawLine(Draw.px + Draw.row, y1 + Draw.midSize, Draw.px + Draw.Width + Draw.border, y1 + Draw.midSize, Draw.cellSize, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
                    if v.pType == SCRIPT_PARAM_LIST then
                        local text = tostring(v.listTable[pVar])
                        local maxWidth =(Draw.Width - Draw.row) * 0.8
                        local textWidth = GetTextArea(text, Draw.FontSize).x
                        if textWidth > maxWidth then
                            text = text:sub(1, math.floor(text:len() * maxWidth / textWidth)) .. ".."
                        end
                        DrawTextA(text, Draw.FontSize, Draw.px + Draw.row, y1, White,"left","left")
                    else
                        DrawTextA(tostring(pVar), Draw.FontSize, Draw.px + Draw.row + Draw.border, y1, White,"left","left")
                    end
                else
                DrawLine(Draw.px + Draw.row, y1 + Draw.midSize, Draw.px + Draw.Width + Draw.border, y1 + Draw.midSize, Draw.cellSize,(pVar and DarkGreen or DarkRed))
                DrawText((pVar and "      ON" or "      OFF"), Draw.FontSize, Draw.px + Draw.row + Draw.border, y1, White)
                end
            end
        end

        y1 = y1 + Draw.cellSize
    end
end
end
------------------------------DrawPermaShow-------------------------
    for _, instance in ipairs(Instances) do
        DrawPermaShows(instance)
    end
----------------------------End DrawPermaShow-----------------------

	if (IsKeyDown(MenuKey) or ChangingKey or Moving) then
		if (Moving) then
			local pos = GetCursorPos()
			Draw.x = math.min(math.max(pos.x - MouseOffset.x, 0), WINDOW_W - Draw.Width)
			Draw.y = math.min(math.max(pos.y - MouseOffset.y, 0), WINDOW_H - Draw.HeaderHeight)
		end
		DrawMainHeaderSprite()
		Draw.y1 = Draw.y + Draw.HeaderHeight - 1
		if (SelectorConfig) then
			SelectorConfig._y1 = Draw.y1
			DrawMenuSprite(Draw.x, Draw.y1, SelectorConfig.header, (MenuIndex == 0))
			if (MenuIndex == 0) then
				SelectorConfig:OnDraw()
			end
			Draw.y1 = Draw.y1 + Draw.CellHeight - 1
		end
		for i = 1, #Instances do
			local selected = (MenuIndex == i)
			Instances[i]._y1 = Draw.y1
			DrawMenuSprite(Draw.x, Draw.y1, Instances[i].header, selected)
			if (selected) then
				Instances[i]:OnDraw()
			end
			Draw.y1 = Draw.y1 + Draw.CellHeight - 1
		end
	end
end
function ConfigOnWndMsg(message, key)
	if (InitializeConfig() or Console__IsOpen) then return end
	if (ChangingKey) then
		if (message == KEY_DOWN) then
			if (ChangingKeyMenu) then return end
			ChangingKey = false
			if (ChangingKeyVariable == nil) then
				if (key == 46) then
					PrintLocal("Cannot set delete as the menu key!", true)
				else
					MenuKey = key
					SaveMenu()
				end
			else
				ChangingKeyInstance._param[ChangingKeyVariable].key = key
				ChangingKeyInstance:save()
			end
			return
		elseif (ChangingKeyMenu and (key == MenuKey)) then
			ChangingKeyMenu = false
		end
	end
	if ((message == WM_LBUTTONDOWN) and IsKeyDown(MenuKey)) then
		if (CursorIsUnder(Draw.x + Draw.Padding + Draw.Width - (Draw.Padding * 2) - 2 - Draw.DetailWidth, Draw.y + Draw.Padding + 2, Draw.DetailWidth, Draw.HeaderHeight - 4)) then
			ChangingKey = true
			ChangingKeyVariable = nil
			ChangingKeyMenu = true
			return
		elseif (CursorIsUnder(Draw.x + Draw.Padding + 1, Draw.y + Draw.Padding + 1, Draw.Width - (Draw.Padding * 2) - 2, Draw.HeaderHeight - (Draw.Padding * 2) - 2)) then
			StartMoveWithMouse()
		else
			if (MenuIndex) then
				if (MenuIndex == 0) then
					if (CursorIsUnder(SelectorConfig._x + Draw.Padding + 1, Draw.y, Draw.Width - (Draw.Padding * 2) - 2, Draw.HeaderHeight)) then
						StartMoveWithMouse()
						return
					else
						for i = 1, #SelectorConfig._subInstances do
							if (CursorIsUnder(SelectorConfig._subInstances[i]._x + Draw.Padding + 1, Draw.y, Draw.Width - (Draw.Padding * 2) - 2, Draw.HeaderHeight)) then
								StartMoveWithMouse()
								return
							end
						end
					end
					CheckOnWndMsg(SelectorConfig)
				else
					local function CheckForMove(instance)
						if (CursorIsUnder(instance._x + Draw.Padding + 1, Draw.y, Draw.Width - (Draw.Padding * 2) - 2, Draw.HeaderHeight)) then
							StartMoveWithMouse()
							return true
						elseif (#instance._subInstances > 0) then
							for i = 1, #instance._subInstances do
								if (CheckForMove(instance._subInstances[i])) then
									return true
								end
							end
						end
						return false
					end
					if (CheckForMove(Instances[MenuIndex])) then return end
					CheckOnWndMsg(Instances[MenuIndex])
				end
			end
			if (SelectorConfig and CursorIsUnder(Draw.x, SelectorConfig._y1, Draw.Width, Draw.CellHeight)) then
				if (MenuIndex == 0) then
					SelectorConfig:ResetSubIndexes()
					MenuIndex = nil
				else
					if (MenuIndex) then
						Instances[MenuIndex]:ResetSubIndexes()
					end
					MenuIndex = 0
				end
			end
			for i = 1, #Instances do
				if (CursorIsUnder(Draw.x, Instances[i]._y1, Draw.Width, Draw.CellHeight)) then
					if (MenuIndex and (i == MenuIndex)) then
						Instances[MenuIndex]:ResetSubIndexes()
						MenuIndex = nil
					else
						if (MenuIndex) then
							if (MenuIndex == 0) then
								SelectorConfig:ResetSubIndexes()
							else
								Instances[MenuIndex]:ResetSubIndexes()
							end
						end
						MenuIndex = i
					end
					break
				end
			end
		end
	elseif (message == WM_LBUTTONUP) then
		if (Moving) then
			Moving = false
			return
		elseif (SliceInstance) then
			SliceInstance:save()
			SliceInstance._slice = false
			SliceInstance = false
			return
		elseif (ListInstance) then
			ListInstance:save()
			ListInstance._list = false
			ListInstance = false
		end
	elseif (key ~= 46) then
		for i = 1, #Instances do
			CheckForWndMsg(message, key, Instances[i])
		end
	end
end

function CheckOnWndMsg(instance)
	if (CursorIsUnder(instance._x, Draw.y, Draw.Width, instance._height)) then
		instance:OnWndMsg()
	elseif (instance._subMenuIndex > 0) then
		CheckOnWndMsg(instance._subInstances[instance._subMenuIndex])
	end
end
function CheckForWndMsg(message, key, instance)
	for i = 1, #instance._param do
		local param = instance._param[i]
		if ((param.pType == SCRIPT_PARAM_ONKEYTOGGLE) and (key == param.key) and (message == KEY_DOWN)) then
			instance[param.var] = not instance[param.var]
		elseif ((param.pType == SCRIPT_PARAM_ONKEYDOWN) and (key == param.key)) then
			instance[param.var] = (message == KEY_DOWN)
		end
	end
	for i = 1, #instance._subInstances do
		CheckForWndMsg(message, key, instance._subInstances[i])
	end
end

function DrawMainHeaderSprite()
	local padding = Draw.Padding + 1
	local moveWidth = Draw.Width - (Draw.Padding * 2) - 2
	local moveHeight = Draw.HeaderHeight - (Draw.Padding * 2) - 2
	local text = ChangingKey and not ChangingKeyVariable and "Press new key for menu..." or "ޅѾʨ׃"
	local keyx = Draw.x + Draw.Padding + moveWidth - Draw.DetailWidth
	local keyy = Draw.y + Draw.Padding + 2
	local fullHeight = Draw.HeaderHeight + ((Draw.CellHeight - 1) * #Instances) + (SelectorConfig and (Draw.CellHeight - 1) or 0)
	DrawRectangle(Draw.x, Draw.y, Draw.Width, fullHeight, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
	--DrawRectangle(Draw.x + 1, Draw.y + 1, Draw.Width - 2, Draw.HeaderHeight - 2, Background)
	--DrawRectangle(Draw.x + padding, Draw.y + padding, moveWidth, moveHeight, FontColor)
	--DrawRectangle(Draw.x + padding + 1, Draw.y + padding + 1, moveWidth - 2, moveHeight - 2, Foreground)
	DrawTextA(text, Draw.FontSize, Draw.x + padding , Draw.y + padding + (moveHeight / 2), FontColor, "left", "center")
	DrawRectangle(keyx, keyy, Draw.DetailWidth, moveHeight - 2, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
	--DrawLines2({ D3DXVECTOR2(keyx - 1, keyy), D3DXVECTOR2(keyx - 1, keyy + Draw.HeaderHeight - 4 - (Draw.Padding * 2)) }, 1, FontColor)
	DrawTextA("("..GetKeyAsString(MenuKey)..")", Draw.FontSize, keyx + (Draw.DetailWidth / 2), keyy + ((moveHeight - 2) / 2), FontColor, "center", "center")
end
function DrawMenuSprite(x, y, header, selected)
	--DrawRectangle(x, y, Draw.Width, Draw.CellHeight, LightGray)
    --print("UsedDrawMenu!header =",header)
    local  newheader
    if(header ~= nil and header ~= "") then            
        --print("header text:",header)
        newheader = translationchk(header) 
        else
        newheader = header
        end
	DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.CellHeight - 2, selected and Foreground or Background)
	DrawTextA(newheader, Draw.FontSize, x + (Draw.Padding * 2), y + (Draw.CellHeight / 2), selected and White or FontColor, nil, "center")
	DrawTextA(">>", Draw.FontSize, x + Draw.Width - (Draw.Padding * 2), y + (Draw.CellHeight / 2), selected and White or FontColor, "right", "center")
end
function DrawHeaderSprite(x, y, header, items)
	local moveWidth = Draw.Width - (Draw.Padding * 2) - 2
	local moveHeight = Draw.HeaderHeight - (Draw.Padding * 2) - 2
	local movex = x + Draw.Padding + 1
	local movey = y + Draw.Padding + 1
	local fullHeight = Draw.HeaderHeight + ((Draw.CellHeight - 1) * items)
    --print("UsedDrawHeader!header =",header)
	DrawRectangle(x, y, Draw.Width, fullHeight, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
	--DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.HeaderHeight - 2, Background)
	--DrawRectangle(movex, movey, moveWidth, moveHeight, FontColor)
	--DrawRectangle(movex + 1, movey + 1, moveWidth - 2, moveHeight - 2, Foreground)
    local  newheader
    if(header ~= nil and header ~= "") then            
        --print("header text:",header)
        newheader = translationchk(header) 
        else
        newheader = header
        end
	DrawTextA(newheader, Draw.FontSize, movex + (moveWidth / 2), movey + (moveHeight / 2), FontColor, "center", "center")
end
function DrawToggleSprite(x, y, text, active)
   -- print("UsedToggleSprite!text=",text)
	local buttonx = x + Draw.Row3 - 1
	local buttony = y + 1
	--DrawRectangle(x, y, Draw.Width, Draw.CellHeight, FontColor)
	DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.CellHeight - 2, Background)
    --print("In drawtoggle text=",text)
	DrawTextA(text, Draw.FontSize, x + (Draw.Padding * 2), y + (Draw.CellHeight / 2), FontColor, nil, "center")
	--DrawLines2({ D3DXVECTOR2(x + Draw.Row3 - 2, y + 1), D3DXVECTOR2(x + Draw.Row3 - 2, y + Draw.CellHeight) }, 1, FontColor)
	DrawRectangle(buttonx, buttony, Draw.Width - Draw.Row3, Draw.CellHeight - 2, active and DarkGreen or DarkRed)
	DrawTextA(active and "ON" or "OFF", Draw.FontSize, buttonx + ((Draw.Width - Draw.Row3) / 2) + Draw.Padding, buttony + (Draw.CellHeight / 2), LightGray, "center", "center")
end
function DrawInfoSprite(x, y, text, info)
    local info = info and ((type(info) == "number") and tostring(info)) or info
	--DrawRectangle(x, y, Draw.Width, Draw.CellHeight, FontColor)
	DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.CellHeight - 2, Background)
     --print("UsedDrawInfo!text =",text)
	DrawTextA(text, Draw.FontSize, x + (Draw.Padding * 2), y + (Draw.CellHeight / 2), FontColor, nil, "center")
	if (info and (info:len() > 0)) then
		--DrawLines2({ D3DXVECTOR2(x + Draw.Row3 - 2, y + 1), D3DXVECTOR2(x + Draw.Row3 - 2, y + Draw.CellHeight) }, 1, FontColor)
		DrawRectangle(x + Draw.Row3 - 1, y + 1, Draw.Width - Draw.Row3, Draw.CellHeight - 2, Foreground)
		DrawTextA(info, Draw.FontSize, x + Draw.Row3 - 1 + ((Draw.Width - Draw.Row3) / 2), y + 1 + ((Draw.CellHeight - 2) / 2), FontColor, "center", "center")
	end
end
function DrawColorSprite(x, y, text, color)
	--DrawRectangle(x, y, Draw.Width, Draw.CellHeight, FontColor)
	DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.CellHeight - 2, Background)
	DrawTextA(text, Draw.FontSize, x + (Draw.Padding * 2), y + (Draw.CellHeight / 2), FontColor, nil, "center")
	--DrawLines2({ D3DXVECTOR2(x + Draw.Row3 - 2, y + 1), D3DXVECTOR2(x + Draw.Row3 - 2, y + Draw.CellHeight) }, 1, FontColor)
	DrawRectangle(x + Draw.Row3 - 1, y + 1, Draw.Width - Draw.Row3, Draw.CellHeight - 2, ARGB(Draw.ColorOpacity, color[2], color[3], color[4]))
end
function DrawKeyToggleSprite(x, y, text, active, key)
	local buttonWidth = Draw.Width - Draw.Row3
	local keyx = x + Draw.Width - buttonWidth - Draw.DetailWidth - 2
	local keyy = y + 1
	DrawToggleSprite(x, y, text, active)
	--DrawLines2({ D3DXVECTOR2(x + Draw.Width - buttonWidth - Draw.DetailWidth - 3, y + 1), D3DXVECTOR2(x + Draw.Width - buttonWidth - Draw.DetailWidth - 3, y + Draw.CellHeight - 1) }, 1, FontColor)
	DrawRectangle(keyx, keyy, Draw.DetailWidth, Draw.CellHeight - 2, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
	DrawTextA("("..GetKeyAsString(key)..")", Draw.FontSize, keyx + (Draw.DetailWidth / 2), keyy + ((Draw.CellHeight - 2) / 2), FontColor, "center", "center")
end
function DrawSliderSprite(x, y, text, value, cursor)
	local valuex = x + Draw.Width - (Draw.Width - Draw.Row3) - Draw.DetailWidth - 2
	local valuey = y + 1
	local sliderx = x + Draw.Row3 - 1
	local slidery = y + 1
	--DrawRectangle(x, y, Draw.Width, Draw.CellHeight, FontColor)
	DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.CellHeight - 2, Background)
	DrawTextA(text, Draw.FontSize, x + (Draw.Padding * 2), y + (Draw.CellHeight / 2), FontColor, nil, "center")
	--DrawLines2({ D3DXVECTOR2(x + Draw.Width - (Draw.Width - Draw.Row3) - Draw.DetailWidth - 3, y + 1), D3DXVECTOR2(x + Draw.Width - (Draw.Width - Draw.Row3) - Draw.DetailWidth - 3, y + Draw.CellHeight - 1) }, 1, FontColor)
	DrawRectangle(valuex, valuey, Draw.DetailWidth, Draw.CellHeight - 2, ARGB(Draw.Opacity, Colors.Gray[1], Colors.Gray[2], Colors.Gray[3]))
	DrawTextA(tostring(value), Draw.FontSize, valuex + (Draw.DetailWidth / 2), valuey + ((Draw.CellHeight - 2) / 2), FontColor, "center", "center")
	--DrawLines2({ D3DXVECTOR2(x + Draw.Row3 - 2, y + 1), D3DXVECTOR2(x + Draw.Row3 - 2, y + Draw.CellHeight) }, 1, FontColor)
	DrawRectangle(sliderx, slidery, Draw.Width - Draw.Row3, Draw.CellHeight - 2, Foreground)
	DrawLines2({ D3DXVECTOR2(sliderx + (Draw.Padding * 2), slidery + ((Draw.CellHeight - 2) / 2)), D3DXVECTOR2(x + Draw.Width - (Draw.Padding * 2) - 2, slidery + ((Draw.CellHeight - 2) / 2)) }, 4, ARGB(200, Colors.Background[1], Colors.Background[2], Colors.Background[3]))
	DrawLines2({ D3DXVECTOR2(sliderx + (Draw.Padding * 2) + cursor, slidery + ((Draw.CellHeight - 2) / 2) - (Draw.Padding * 2)), D3DXVECTOR2(sliderx + (Draw.Padding * 2) + cursor, slidery + ((Draw.CellHeight - 2) / 2) + (Draw.Padding * 2)) }, 4, FontColor)
end
function DrawListSprite(x, y, text, currentOption)
    local optionsx = x + Draw.Row3 - 1
	local optionsy = y + 1
	--DrawRectangle(x, y, Draw.Width, Draw.CellHeight, FontColor)
    --print("UsedDrawList!text =",text)
	--DrawRectangle(x + 1, y + 1, Draw.Width - 2, Draw.CellHeight - 2, Background)
	DrawTextA(text, Draw.FontSize, x + (Draw.Padding * 2), y + (Draw.CellHeight / 2), FontColor, nil, "center")
	--DrawLines2({ D3DXVECTOR2(x + Draw.Row3 - 2, y + 1), D3DXVECTOR2(x + Draw.Row3 - 2, y + Draw.CellHeight) }, 1, FontColor)
	DrawRectangle(optionsx, optionsy, Draw.Width - Draw.Row3, Draw.CellHeight - 2, Foreground)
	local text = translationchk(currentOption)
	local maxWidth = (Draw.Width - Draw.Row3) * 0.8
	local textWidth = GetTextArea(text, Draw.FontSize).x
	if (textWidth > maxWidth) then
		text = text:sub(1, math.floor(text:len() * maxWidth / textWidth))
		if (text:sub(text:len(), text:len()) == " ") then
			text = text:sub(1, text:len() - 1)
		end
		text = text.."..."
	end
	DrawTextA(text, Draw.FontSize, optionsx + ((Draw.Width - Draw.Row3) / 2), optionsy + ((Draw.CellHeight - 2) / 2), FontColor, "center", "center")
end
function DrawListDropDownSprite(x, y, index, listTable)
	local width = 0
	local height = 1
    --print("UsedDrawListDropDown!text =",text)
	for i = 1, #listTable do
		width = math.max(width, GetTextArea(listTable[i], Draw.FontSize).x)
		height = height + Draw.CellHeight - 1
	end
	width = width + (Draw.Padding * 6)
	--DrawRectangle(x, y, width, height, FontColor)
	DrawRectangle(x + 1, y + 1, width - 2, height - 2, Background)
	for i = 1, #listTable do
		local optiony = y + 1 + ((Draw.CellHeight - 1) * (i - 1))
        local trtext = translationchk(listTable[i])
		DrawRectangle(x + 1, optiony, width - 2, Draw.CellHeight - 2, (index == i) and ARGB(200, 255, 0, 0) or Background)
		DrawTextA(trtext, Draw.FontSize, x + (Draw.Padding * 2), optiony + ((Draw.CellHeight - 2) / 2), FontColor, nil, "center")
		if (i < #listTable) then
			--DrawLines2({ D3DXVECTOR2(x + 1, optiony + Draw.CellHeight - 2), D3DXVECTOR2(x + width - 1, optiony + Draw.CellHeight - 2) }, 1, FontColor)
		end
	end
end

function _G.scriptConfig:__init(header, name, parent)
	if (parent) then
		self._parent = parent
	else
		InitializeConfig(name)
		LoadConfig()
	end
	self.header = header
	self.name = name
    --print("configheader:",header)
    --WriteFile(('["'.. header ..'"]'.. ' = '.. '" ",').."\n", SCRIPT_PATH .. "results.txt","a")
    translateheaderchk(header)
	self._param = { }
	self._subInstances = { }
	self._tsInstances = { }
    self._permaShow = { }
	self._sprite1 = nil
	self._sprite2 = nil
	self._subMenuIndex = 0
	self._list = 0
	self._x = parent and (parent._x + Draw.Width) or Draw.x + Draw.Width
	self._y = 0
	self._y1 = 0
	self._height = Draw.HeaderHeight
    self._slice = false
	if (parent) then
		parent._subInstances[#parent._subInstances + 1] = self
	elseif (name ~= "MainTargetSelector") then
		Instances[#Instances + 1] = self
	end
end

function _G.scriptConfig:OnDraw()
	self._x = (self._parent and (self._parent._x + Draw.Width) or Draw.x + Draw.Width) - 1
	if (self._slice and SliceInstance) then
		local cursorX = math.min(math.max(0, GetCursorPos().x - self._x - Draw.Row3), Draw.Width - Draw.Row3)
		self[self._param[self._slice].var] = math.round(self._param[self._slice].min + cursorX / (Draw.Width - Draw.Row3) * (self._param[self._slice].max - self._param[self._slice].min), self._param[self._slice].idc)
	end
	self._y = Draw.y
	DrawHeaderSprite(self._x, self._y, ChangingKey and ChangingKeyVariable and ChangingKeyInstance and (ChangingKeyInstance.name == self.name) and "Press new key for: "..self._param[ChangingKeyVariable].text or self.header, #self._subInstances + #self._param)
	self._y = self._y + Draw.HeaderHeight - 1
	for i = 1, #self._subInstances do
		local variable = self._subInstances[i].name
		local selected = (self._subMenuIndex == i)
		self._subInstances[i]._y1 = self._y
            --print("self subinstances:",self._subInstances[i])
		DrawMenuSprite(self._x, self._y, self._subInstances[i].header, selected)
		self._y = self._y + Draw.CellHeight - 1
		if (selected) then
			self._subInstances[i]:OnDraw()
		end
	end
	for i = 1, #self._param do
		self._param[i]._y1 = self._y
		local var = self[self._param[i].var]
        local trantext
        --print("start to draw param:",self._param[i].text)
        if(self._param[i].text ~= nil and self._param[i].text ~= "") then            
        --print("self param text:",self._param[i].text)
        trantext = translationchk(self._param[i].text) 
        else
        trantext = self._param[i].text
        end
        --print(self._param)
        --[[if(type(self._param[i].listTable) ~= nil and self._param[i].listTable ~= nil) then
        print(self._param[i].listTable[var])
        end]]--
		if (self._param[i].pType == SCRIPT_PARAM_ONOFF) then
			DrawToggleSprite(self._x, self._y, trantext, var)
		elseif (self._param[i].pType == SCRIPT_PARAM_INFO) then
            DrawInfoSprite(self._x, self._y, trantext, var)
		elseif (self._param[i].pType == SCRIPT_PARAM_COLOR) then
			DrawColorSprite(self._x, self._y, trantext, var)
		elseif (self._param[i].pType == SCRIPT_PARAM_SLICE) then
			self._param[i].cursor = (var - self._param[i].min) / (self._param[i].max - self._param[i].min) * ((Draw.Width - Draw.Row3) - (Draw.Padding * 4))
            --print(self._param[i].cursor)
			DrawSliderSprite(self._x, self._y, trantext, var, self._param[i].cursor)
		elseif ((self._param[i].pType == SCRIPT_PARAM_ONKEYDOWN) or (self._param[i].pType == SCRIPT_PARAM_ONKEYTOGGLE)) then
			DrawKeyToggleSprite(self._x, self._y, trantext, var, self._param[i].key)
		elseif (self._param[i].pType == SCRIPT_PARAM_LIST) then
			DrawListSprite(self._x, self._y, trantext, self._param[i].listTable[var])
			if (i == self._list) then
				local cursorY = math.min(GetCursorPos().y - self._y, Draw.CellHeight * (self._param[i].max))
				if (cursorY >= 0) then
					self[self._param[i].var] = math.min(math.round(self._param[i].min + cursorY / ((Draw.CellHeight - 4) * (self._param[i].max)) * (self._param[i].max - self._param[i].min)), #self._param[i].listTable)
				end
				DrawListDropDownSprite(self._x + Draw.Width - 1, self._y, self[self._param[i].var], self._param[i].listTable)
			end
		else
			PrintLocal("Unable to draw param type '"..self._param[i].pType.."'!", true)
		end
		self._y = self._y + Draw.CellHeight - 1
	end
	self._height = self._y - Draw.y
end
function _G.scriptConfig:OnWndMsg()
	for i = 1, #self._subInstances do
		if (CursorIsUnder(self._x, self._subInstances[i]._y1, Draw.Width, Draw.CellHeight)) then
			if (i == self._subMenuIndex) then
				self._subMenuIndex = 0
			else
				self._subMenuIndex = i
			end
			return
		end
	end
	for i = 1, #self._param do
		local param = self._param[i]
		if ((param.pType == SCRIPT_PARAM_ONKEYDOWN) or (param.pType == SCRIPT_PARAM_ONKEYTOGGLE)) then
			if (CursorIsUnder(self._x + Draw.Width - (Draw.Width - Draw.Row3) - Draw.DetailWidth - 2, param._y1, Draw.Width, Draw.CellHeight)) then
				ChangingKey = true
				ChangingKeyVariable = i
				ChangingKeyMenu = true
				ChangingKeyInstance = self
				self:ResetSubIndexes()
				return
			end
		end
		if (not changed and ((param.pType == SCRIPT_PARAM_ONOFF) or (param.pType == SCRIPT_PARAM_ONKEYTOGGLE))) then
			if (CursorIsUnder(self._x + Draw.Row3 - 1, param._y1, Draw.Width, Draw.CellHeight)) then
				self[param.var] = not self[param.var]
				self:save()
				self:ResetSubIndexes()
				return
			end
		end
		if (not changed and (param.pType == SCRIPT_PARAM_SLICE)) then
			if (CursorIsUnder(self._x + Draw.Row3 - 1, param._y1, Draw.Width, Draw.CellHeight)) then
				self._slice = i
				SliceInstance = self
				self:ResetSubIndexes()
				return
			end
		end
		if (not changed and (param.pType == SCRIPT_PARAM_LIST)) then
			if (CursorIsUnder(self._x + Draw.Row3 - 1, param._y1, Draw.Width, Draw.CellHeight)) then
				self._list = i
				ListInstance = self
				self:ResetSubIndexes()
				return
			end
		end
		if (not changed and (param.pType == SCRIPT_PARAM_COLOR)) then
			if (CursorIsUnder(self._x + Draw.Row3 - 1, param._y1, Draw.Width, Draw.CellHeight)) then
				__CP(nil, nil, self[param.var][1], self[param.var][2], self[param.var][3], self[param.var][4], self[param.var])
				self:save()
				self:ResetSubIndexes()
			end
		end
	end
end
function _G.scriptConfig:addParam(variable, text, ptype, value, param1, param2, param3)
	local newParam = {
		var = variable,
		text = text,
		pType = ptype,
		_y1 = self._y,
	}
    --print("param text:",text)
    --[[if(text ~= "") then
    WriteFile(('["'.. text ..'"]'.. ' = '.. '" ",').."\n", SCRIPT_PATH .. "results.txt","a")
    end]]--
	if ((ptype == SCRIPT_PARAM_ONKEYDOWN) or (ptype == SCRIPT_PARAM_ONKEYTOGGLE)) then
        newParam.key = param1
    elseif (ptype == SCRIPT_PARAM_SLICE) then
        newParam.min = param1
        newParam.max = param2
        newParam.idc = param3 or 0
        newParam.cursor = 0
    elseif (ptype == SCRIPT_PARAM_LIST) then
        
        --[[for i,v in pairs(param1) do
            print("param list:",param1)
            WriteFile(('["'.. v ..'"]'.. ' = '.. '" ",').."\n", SCRIPT_PATH .. "results.txt","a")
        end]]--

        newParam.listTable = param1
        newParam.min = 1
        newParam.max = #param1
        newParam.cursor = 0
	end
	local index = #self._param + 1
    self[variable] = value
	self._param[index] = newParam
	self._height = self._height + Draw.CellHeight
    SaveMaster()
	self:load()
end
function _G.scriptConfig:load()
    local config = LoadSettings(self.name)
    for var, value in pairs(config) do
        if (type(value) == "table") then
            if (self[var]) then
				self[var] = SensitiveMerge(self[var], value)
			end
        else
			self[var] = value
        end
    end
end
function _G.scriptConfig:save()
    local content = { }
    content._param = content._param or { }
	for i = 1, #self._param do
		local param = self._param[i]
        if (param.pType ~= SCRIPT_PARAM_INFO) then
            content[param.var] = self[param.var]
            if ((param.pType == SCRIPT_PARAM_ONKEYDOWN) or (param.pType == SCRIPT_PARAM_ONKEYTOGGLE)) then
                content._param[i] = { key = param.key }
            end
        end
    end
    content._tsInstances = content._tsInstances or { }
	for i = 1, #self._tsInstances do
        content._tsInstances[i] = { mode = self._tsInstances[i].mode }
    end
    SaveSettings(self.name, content)
end
function _G.scriptConfig:addTS(tsInstance)
    if (not SelectorConfig) then
		SelectorConfig = scriptConfig("Target Selector", "MainTargetSelector")
		InitializeGameHeroes()
		if (#GameHeroes == 0) then
			SelectorConfig:addParam("Note", "No enemy heroes were found!", SCRIPT_PARAM_INFO, "")
		else
			for i = 1, #GameHeroes do
				local name = GameHeroes[i].hero.charName
				SelectorConfig:addParam(name, name, SCRIPT_PARAM_SLICE, GameHeroes[i].priority, 0, 5)
				SelectorConfig:setCallback(name, function(value)
					if (value == 0) then
						Global.TS_Ignore(name, true)
					else
						Global.TS_SetHeroPriority(math.min(value, GameEnemyCount), name, true)
					end
				end)
				if (SelectorConfig[name] == 0) then
					Global.TS_Ignore(name, true)
				else
					Global.TS_SetHeroPriority(math.min(SelectorConfig[name], GameEnemyCount), name, true)
				end
			end
		end
	end
	local index = #self._tsInstances + 1
	self._tsInstances[index] = tsInstance
	self:addParam("TSMode", "Target Selector Mode:", SCRIPT_PARAM_LIST, tsInstance.mode, { "Low HP", "Most AP", "Most AD", "Less Cast", "Near Mouse", "Priority", "Low HP Priority", "Less Cast Priority", "Dead", "Closest" })
	self:setCallback("TSMode", function(mode)
		self._tsInstances[index].mode = mode
	end)
	self._tsInstances[index]._config = self.TSMode
    SaveMaster()
    self:load()
end
function _G.scriptConfig:permaShow(variable)
	for i = 1, #self._param do
        if (self._param[i].var == variable) then
			self._permaShow[#self._permaShow + 1] = variable
            --print("index:",index)
        end
    --print("self perma:",self._permaShow)
    end
    SaveMaster()
end

function _G.TS_SetFocus(target, enemyTeam)
	local target = GetGameHero(target)
	if (target and target.team and (target.team ~= myHero.team)) then
		for i = 1, #GameHeroes do
			if (GameHeroes[i].hero.networkID == target.networkID) then
				GameHeroes[i].priority = 1
			else
				GameHeroes[i].priority = GameEnemyCount
			end
			if (SelectorConfig) then
				SelectorConfig[GameHeroes[i].hero.charName] = GameHeroes[i].priority
			end
		end
	end
	Global.TS_SetFocus(target, enemyTeam)
end
function _G.TS_SetHeroPriority(priority, target, enemyTeam)
	local index = GetGameHeroIndex(target)
	if (index) then
		index = index % GameEnemyCount + 1
		local oldPriority = GameHeroes[index].priority
		if ((oldPriority == nil) or (oldPriority == priority)) then return end
		for i = 1, #GameHeroes do
			if (i == index) then
				GameHeroes[i].priority = priority
			else
				GameHeroes[i].priority = GameEnemyCount
			end
			if (SelectorConfig) then
				SelectorConfig[GameHeroes[i].hero.charName] = GameHeroes[i].priority
			end
		end
	end
	Global.TS_SetHeroPriority(priority, target, enemyTeam)
end
function _G.TS_Ignore(target, enemyTeam)
    local target = GetGameHero(target, "TS_Ignore")
    if (target and target.valid and (target.type == "obj_AI_Hero") and (target.team ~= player.team)) then
        for i = 1, #GameHeroes do
            if (GameHeroes[i].hero.networkID == target.networkID) then
                GameHeroes[i].ignore = not GameHeroes[i].ignore
				if (SelectorConfig) then
					SelectorConfig[GameHeroes[i].hero.charName] = 0
				end
                break
            end
        end
    end
	Global.TS_Ignore(target, enemyTeam)
end

local tranTable = {
["Evadeee"] = "ףҜ",
["Enemy Spells"] = "֐ɋܼŜ",
["Evading Spells"] = "ףҜܼŜ",
["Advanced Settings"] = "ٟܶʨ׃",
["Traps"] = "Нۥ",
["Buffs"] = "նӦ",
["Humanizer"] = "Ţɋۯ",
["Combat/Chase Mode"] = "l֐/׷ܷģʽ",
["Controls"] = "࠘׆",
["Visual Settings"] = "˓ߵʨ׃",
["Performance Settings"] = "єŜʨ׃",
["Q - Decisive Strike"] = "QܼŜ",
["W - Courage"] = "WܼŜ",
["Summoner Spell: Flash"] = "֙۽ʦܼŜúʁЖ",
["Item: Youmuu's Ghostblade"] = "ԄĎ֮©",
["Item: Locket of the Iron Solari"] = "ٖͺҴ֮ϻ",
["Item: Zhonya / Wooglet"] = "א欉Ԃɢ,
["Item: Shurelya / Talisman"] = "˦ɰ҇ք࠱ЫȺ/ۤػ",
["Dodge/Cross Settings"] = "ףҜܲԩڽܼŜʨ׃",
["Evading Settings"] = "ףҜʨ׃",
["Collision Settings"] = "ƶײʨ׃",
["Script Interaction (API)"] = "ޅѾۥ֯èAPIé",
["Reset Settings"] = "ט׃ʨ׃",
["Nidalee and Teemo Traps"] = "ѪŮۍ͡ĪքНۥ",
["Caitlyn and Jinx Traps"] = "Ůޯۍްࠋ˹քНۥ",
["Banshee's Veil"] = "ŮҽĦɴ",
["Delays"] = "ғԙ",
["Movement"] = "ӆ֯",
["Anchors"] = "֨λ",
["Evading"] = "ףҜ",
["Dashes and blinks"] = "˲ӆۍͻ޸",
["Special Actions"] = "͘ˢ֯ط",
["Override - Anchor Settings"] = "زه֨λʨ׃",
["Override - Humanizer"] = "زهŢɋۯ",
["League of Legends Version"] = "ӢћjċѦѾ",
["Danger Level: "] = "ΣЕֈܶ",
["Danger level info:"] = "ΣЕֈܶхϢ",
["    0 - Off"] = "0 - ژҕ",
["    1 - Use vs Normal Skillshots"] = "1 - ԶսһѣܼŜ٥ܷʹԃ",
["2..4 - Use vs More Dangerous / CC"] = "2..4 - ԶսޏΣЕܼŜܰ΅࠘ʹԃ",
["    5 - Use vs Very Dangerous"] = "5 - Զս؇ӣΣЕܼŜʱʹԃ",
["Use after-move delay in calcs"] = "՚݆̣քғԙ۳ӆ֯",
["Extra hit box radius: "] = "׮΢քկրֱ޶",
["Evading points max distance"] = "لҤǱ՚вȫףҜ֣֘քخճߠk",
["Evade only spells closer than:"] = "ֻ՚ר˵ߠkޓ޼ֵքʱ۲ףҜ",
["Global skillshots as exception"] = "ףҜȫȲճ֐ʱ۶ÔǤ̻ʨ׃",
["Attempt to DODGE linear spells"] = "Ӣ˔՚ֱПկրר˵Śքʱ۲ףҜ",
["Attempt to CROSS linear spells"] = "Ӣ˔՚ֱПկրר˵΢ʱвȫԩڽ",
["Attempt to DODGE rectangular spells"] = "Ӣ˔՚ߘюկրר˵Śքʱ۲ףҜ",
["Attempt to CROSS rectangular spells"] = "Ӣ˔՚ߘюկրר˵΢ʱвȫԩڽ",
["Attempt to DODGE circular spells"] = "Ӣ˔՚Բюկրר˵Śքʱ۲ףҜ",
["Attempt to CROSS circular spells"] = "Ӣ˔՚Բюկրר˵΢ʱвȫԩڽ",
["Attempt to DODGE triangular spells"] = "Ӣ˔՚ɽއюկրר˵Śքʱ۲ףҜ",
["Attempt to CROSS triangular spells"] = "Ӣ˔՚ɽއюկրר˵΢ʱвȫԩڽ",
["Attempt to DODGE conic spells"] = "Ӣ˔՚׶юկրר˵Śքʱ۲ףҜ",
["Attempt to CROSS conic spells"] = "Ӣ˔՚׶юկրר˵΢ʱвȫԩڽ",
["Attempt to dodge arc spells"] = "Ӣ˔՚׶юկրר˵Śքʱ۲ףҜ",
["Collision for minions"] = "СҸքƶײ",
["Collision for heroes"] = "Ӣћքƶײ",
["Here you can allow other scripts"] = "֢oţࠉӔʹԃǤ̻ޅѾ",
["to enable/disable and control Evadeee."] = "Ǵԃ/޻ԃۍ࠘׆EVADEEE",
["Allow enabling/disabling evading"] = "ՊѭǴԃ/޻ԃףҜ",
["Allow enabling/disabling Bot Mode"] = "ՊѭǴԃ/޻ԃܺǷɋģʽ",
["WARNING:"] = "ޯ٦",
["By switching this ON/OFF - Evadeee"] = "תۻߪۍژ",
["will reset all your settings:"] = "ט׃̹Ԑʨ֨",
["Restore default settings"] = "ܖشĬɏʨ׃",
["Enabled"] = "Ǵԃ",
["Ignore with dangerLevel >="] = "۶ÔΣЕֈܶ",
["    1 - Use vs everything"] = "1 - Ɏێʱ۲ּʹԃ",
["2..4 - Use only vs More Dangerous / CC"] = "2..4 - ޶՚ޏΣЕܼŜܰ΅࠘ʹԃ",
["    5 - Use only vs Very Dangerous"] = "5 - ޶՚Զս؇ӣΣЕܼŜʱʹԃ",
["Delay before evading (ms)"] = "ףҜǰғԙèہīé",
["Ignore evading delay if you move"] = "ɧڻţ՚ӆ֯۶ÔףҜǰғԙ",
["Server Tick Buffer (ms)"] = "ؾϱǷۺզ݆ʱèہīé",
["Pathfinding:"] = "Ѱ·",
["Move extra distance after evade"] = "ףҜ۳ӆ֯׮΢քߠk",
["Randomize that extra distance"] = "̦ܺʺԉףҜ۳ӆ׮΢քߠkֵ",
["Juke when entering danger area"] = "ݙװ޸ɫΣЕȸԲ",
["Move this distance during jukes"] = "ݙ֯طߠ֐ɋר˵քߠk",
["Allow changing path while evading"] = "Պѭ՚ףҜʱلҤ·П",
["Delay between each path change"] = "لҤ·Пʱғԙքʱݤ",
["\"Smooth\" Diagonal Evading"] = "ƽ۬бПףҜ",
["Max Range Limit:"] = "خԶߠkО׆",
["Anchor Type:"] = "֨λ׽ר",
["Safe Evade (Ignore Anchor):"] = "вȫףҜè۶Ô֨λé",
["Safe evade from enemy team"] = "вȫףҜ֐ɋ",
["Do that with X enemies nearby: "] = "՚ؽ޼ԐXĻ֐ɋʱ",
["How far enemies should be: "] = "ה֐ɋքޯޤߠk",
["Safe evade during Panic Mode"] = "՚ʹԃǿ׆ʁЖģʽʱвȫףҜ",
["Explanation (Safe Evade):"] = "ޢˍèвȫףҜé",
["This setting will force evade in the"] = "֢ٶʨ׃ܡӯ؅Զk",
["direction away from enemy team."] = "֐ɋӆ֯׽вǿ׆ףҜ",
["This will ignore your main anchor"] = "֢ܡ۶Ôţք׷֨λ",
["only when there are enemies nearby."] = "ֻ՚ؽ޼Ԑ֐ɋʱ",
["Attempt to dodge spells from FoW"] = "Ӣ˔ףҜՓûԐ˓Ұք֘׽٥ܷţքר˵",
["Dodge if your HP <= X%: "] = "՚ţքѪСԚX%ʱףҜ",
["Dodge <= X normal spells..."] =	 "՚СԚֈԚXٶǕͨר˵٥ܷţʱףҜ",
["... in <= X seconds"] =	 "՚СԚֈԚXīŚ",
["Disable evading by idling X sec:"] = "՚ţڒܺXī۳ؔ֯޻ԃףҜ",
["Better dodging near walls"] = "ǽؽ޼ټۃքףҜ·П",
["Better dodging near turrets"] = "֐ɋ؀Թ̾ؽ޼ټۃքףҜ·П",
["Handling danger blinks and dashes:"] = "˲ӆۍͻ޸ʱףҜΣЕ",
["Angle of the modified cast area"] = "ףҜΣЕքއ׈",
["Blink/flash over missile"] = "˲ӆܲͻ޸սСҸʭҟףҜ٥ܷ",
["Delay between dashes/blinks (ms):"] = "˲ӆܲčԥքғԙ(ms)",
["Dash/Blink/Flash Mode:"] = "˲ӆܲͻ޸ܲʁЖքģʽ",
["Note:"] = "עӢ",
["While activated, this mode overrides some of"] = "ձţܤܮ֢ٶ٦ŜʱࠉŜܡزه",
["the settings, which you can modify here."] = "һЩţǤ̻ք՚֢oўلքʨ׃",
["Usually this is used together with SBTW."] = "һѣȩ࠶Ђۍؔ֯؟߳ߪژ",
["To change the hotkey go to \"Controls\"."] = "՚࠘׆ʨ׃אʨ׃Ɉݼ",
["Dodge \"Only Dangerous\" spells"] = "޶ףҜΣЕܼŜ",
["Evade towards anchor only"] = "ףҜʱֻвǰ֨λ",
["Ignore circular spells"] = "۶ÔԲюܼŜ",
["Use dashes more often"] = "ټנքʹԃ˲ӆ",
["To change controls just click here   \\/"] = "֣֢o4لҤ࠘׆ʨ׃",
["Evading        | Hold"] = "дסףҜ",
["Evading        | Toggle"] = "дЂףҜߪژǴԃֱս՚ՎдЂֹͣ",
["Combat/Chase Mode | Hold 1"] = "սַۍ׷ܷģʽдݼ1",
["Combat/Chase Mode | Hold 2"] = "սַۍ׷ܷģʽдݼ2",
["Combat/Chase Mode | Toggle"] = "սַۍ׷ܷģʽߪژ",
["Panic Mode     | Refresh"] = "ުࠖģʽˢт",
["Panic Mode Duration (seconds)"] = "ުࠖģʽʱݤèīé",
["Remove spells with doubleclick"] = "˫ܷӆԽܼŜܦͼ",
["Quick Menu:"] = "ࠬޝӋե",
["Open Quick Menu with LMB and:"] = "ԃ˳Ҫسݼۍ:ߪǴ̙ࠬӋե",
["Replace Panic Mode"] = "ͦۻުࠖģʽ",
["Explanation (Quick Menu):"] = "˵ķèࠬޝӋեé",
["If you choose 1 key for Quick Menu"] = "ɧڻţѡձдݼ1طΪࠬޝݼ",
["then make sure it doesn't overlap"] = "Ӌեࠬޝݼìȫȷɏһܡۍ",
["with League's Quick Ping menu!"] = "ԎϷДʾPINGքࠬޝݼט־",
["Draw Skillshots"] = "ܼŜܦͼҭʾ",
["Spell area line width"] = "ܼŜȸԲПքՖϸ",
["Spell area color"] = "ܼŜȸԲҕɫ",
["Draw Dangerous Area"] = "ΣЕȸԲܦͼҭʾ",
["Danger area line width"] = "ΣЕȸԲПքՖϸ",
["Danger area color"] = "ΣЕȸԲҕɫ",
["Display Evading Direction"] = "ДʾףҜ׽в",
["Show \"Doubleclick to remove!\""] = "Дʾ˫ܷӆԽèͼé",
["Display Evadeee status"] = "ДʾEVADEEE״̬",
["Status display Y offset"] = "״̬Дʾ؝סҢ",
["Status display text size"] = "״̬ДʾؖͥճС",
["Print Evadeee status"] = "ДʾEVADEEE״̬",
["Show Priority Menu"] = "ДʾԅЈӋե",
["Priority Menu X offset"] = "ԅЈӋեۡסҢ",
["Preset"] = "Ԥʨ",
["Change this on your own risk:"] = "ɧڻلҤՋЮاЕؔغ",
["Update Frequency [Times per sec]"] = "ˢт˽ߝƵÊՎ/ī",
-----------------SAC-----------------------
["Script Version"] = "ޅѾѦѾ",
["Generate Support Report"] = "ʺԉԮ׺Ѩ٦",
["Clear Chat When Enabled"] = "ձߪǴʱȥࠕה۰࠲",
["Show Click Marker (Broken)"] = "٦Ŝӑ۵",
["Click Marker Colour"] = "֣ܷԤӢҕɫ",
["Minimum Time Between Clicks"] = "֣ܷخСݤٴ",
["Maximum Time Between Clicks"] = "֣ܷخճݤٴ",
["translation button"] = "׭ӫݼ",
["Harass mode"] = "ɧɅģʽ",
["Cast Mode"] = "ʩרģʽ",
["Collision buffer"] = "ƶײͥܽ",
["Normal minions"] = "һѣСҸ",
["Jungle minions"] = "Ұږ",
["Others"] = "Ǥ̻",
["Check if minions are about to die"] = "ɧڻСҸࠬ̀֣ܷ",
["Check collision at the unit pos"] = "ݬөϯͥݤλ׃ƶײ",
["Check collision at the cast pos"] = "ݬөʩרλ׃ƶײ",
["Check collision at the predicted pos"] = "ݬөԤ݆ר˵λ׃ƶײ",
["Enable debug"] = "ߪǴƅԽڊ֏ģʽ",
["Show collision"] = "Дʾƶײ",
["Version"] = "ѦѾ",
["No enemy heroes were found!"] = "δעЖ֐׽Ӣћ",
["Target Selector Mode:"] = "ĿҪѡձģʽ",
["*LessCastPriority Recommended"] = "ΆݶքخһҪ٥ܷքԐО׈",
["Hold Left Click Action"] = "дס˳Ҫسݼք֯ط",
["Focus Selected Target"] = "ߛݹѡאքĿҪ",
["Attack Selected Buildings"] = "٥ܷѡאքݨ׾",
["Disable Toggle Mode On Recall"] = "՚ܘԇʱ޻ԃߪژģʽ",
["Disable Toggle Mode On Right Click"] = "˳ҪԒݼ֣ܷ޻ԃߪژģʽ",
["Mouse Over Hero To Stop Move"] = "˳ҪѼͣ՚Ӣћʏ׽ʱֹͣӆ֯",
["      Against Champions"] = "ԫţսַք֘׽Ӣћ",
["Use In Auto Carry"] = "՚ؔ֯l֐ˤԶģʽʹԃ",
["Use In Mixed Mode"] = "՚ܬۏģʽʹԃ",
["Use In Lane Clear"] = "՚ȥПģʽʹԃ",
["Killsteal"] = "Ȁɋͷ",
["Auto Carry minimum % mana"] = "ɧڻħרʙԚ%ղһߪǴؔ֯l֐ˤԶģʽ",
["Mixed Mode minimum % mana"] = "ɧڻħרʙԚ%ղһߪǴܬۏģʽ",
["Lane Clear minimum % mana"] = "ɧڻħרʙԚ%ղһߪǴȥПģʽ",
["      Skill Farm"] = "ܼŜˢҸ",
["Lane Clear Farm"] = "ȥПˢҸ",
["Jungle Clear"] = "ˢҰ",
["TowerFarm"] = "̾ЂˢҸ?",
["Skill Farm Min Mana"] = "ʹԃܼŜˢҸħרһ֍Ԛ",
["(when enabled)"] = "ձǴԃʱ",
["Stick To Target"] = "޴֢ĿҪ",
["   Stick To Target will mirror "] = "޴֢ĿҪˤԶ",
["   enemy waypoints so you stick"] = "ٺ޴֐ɋѐ޸·П",
["   to him like glue!"] = "ߍбه×͹sղ",
["Outer Turret Farm"] = "΢̾ˢҸ",
["Inner Turret Farm"] = "Ś̾ˢҸ",
["Inhib Turret Farm"] = "ˮާˢҸ",
["Nexus Turret Farm"] = "ąҀˢҸ",
["Lane Clear Method"] = "ȥП׽ʽ",
["Double-Edged Sword"] = "˫ɐݣͬس",
["Savagery"] = "Ұùͬس",
["Toggle mode (requires reload)"] = "ߪژģʽèѨҪ2XF9é",
["Movement Enabled"] = "Պѭӆ֯",
["Attacks Enabled"] = "Պѭ٥ܷ",
["Anti-farm/harass (attack back)"] = "ɧɅ֐ɋҹնè״ܷé",
["Attack Enemies"] = "٥ܷ֐ɋ",
["Prioritise Last Hit Over Harass"] = "ҹնԅЈԚɧɅ",
["Attack Wards"] = "٥ܷқ",
["           Main Hotkeys"] = "׷Ҫࠬޝݼ",
["Auto Carry"] = "ؔ֯l֐٥ܷģʽ",
["Last Hit"] = "ҹնģʽ",
["Mixed Mode"] = "ܬۏģʽ",
["Lane Clear"] = "ȥП",
["           Other Hotkeys"] = "Ǥ̻ࠬޝݼ",
["Target Lock"] = "ĿҪ̸֨",
["Enable/Disable Skill Farm"] = "ߪǴܲژҕܼŜˢҸ",
["Lane Freeze (Default F1)"] = "F1Ђ؀˘ҹն",
["Support Mode (Default F6)"] = "ب׺ģʽ",
["Toggle Streaming Mode with F7"] = "F7ߪژ۬֯ģʽ",
["Use Blade of the Ruined King"] = "ʹԃǆќ",
["Use Bilgewater Cutlass"] = "ʹԃ҈׻ܪϖ͘Τն",
["Use Hextech Gunblade"] = "ʹԃڣࠋ˹ࠆܼǹɐ",
["Use Frost Queens Claim"] = "ʹԃҹ˪Ů܊քָ®",
["Use Talisman of Ascension"] = "ʹԃ؉ʽۤػ",
["Use Ravenous Hydra"] = "ʹԃ̰7߅ͷʟ",
["Use Tiamat"] = "ʹԃ҇͡í͘",
["Use Entropy"] = "ʹԃҹ˪սԸ",
["Use Youmuu's Ghostblade"] = "ʹԃԄĎ֮©",
["Use Randuins Omen"] = "ʹԃ<י֮֗",
["Use Muramana"] = "ʹԃħȐ",
["Save BotRK for max heal"] = "ѣ´BotRKܱփخճ׎",
["Use Muramana [Champions]"] = "הӢћʹԃħȐ",
["Use Muramana [Minions]"] = "הСҸʹԃħȐ",
["Use Tiamat/Hydra to last hit"] = "ʹԃ҇͡íܲ֟͘߅ͷʟΪԉخ۳һܷ",
["Use Muramana [Jungle]"] = "הҰږʹԃħȐ",
["Champion Range Circle"] = "Ӣћ׶ΧԲюͼ",
["Colour"] = "ҕɫ",
["Circle Around Target"] = "ĿҪԲюͼ",
["Draw Target Lock Circle"] = "ДʾĿҪ̸֨Բюͼ",
["Target Lock Colour"] = "ĿҪ̸֨ҕɫ",
["Target Lock Reminder Text"] = "ĿҪ̸֨τؖ͡ʾ",
["Show Pet/Clone target scan range"] = "ДʾԨϯ/ࠋ¡ĿҪɨĨ׶Χ",
["Use Low FPS Circles"] = "ʹԃ֍FPSԲ",
["Show PermaShow box"] = "ДʾԀ߃Дʾ࠲",
["Show AA reminder on script load"] = "ׁȡޅѾʱДʾAA͡ё",
["Enable Pet Orbwalking:"] = "ߪǴԨϯ؟߳",
["Tibbers"] = "ܰŮ͡Ү˹",
["Shaco's Clone"] = "СԳࠋ¡",
["Target Style:"] = "ĿҪ׽ʽ",
["When To Orbwalk:"] = "ʲôʱ۲؟߳",
["Target Scan Range"] = "ĿҪɨĨ׶Χ",
["Push Lane In LaneClear"] = "՚ȥПʱʹԃΆПģʽ",
["Delay Between Movements"] = "ӆ֯ݤٴғԙ",
["Randomize Delay"] = "̦ܺғԙ",
["Humanize Movement"] = "Ţɋۯӆ֯",
["Last Hit Adjustment:"] = "ҹնַֻ",
["Adjustment Amount:"] = "ַֻ",
["Animation Cancel Adjustment:"] = "Ǖ٥ۭ֯ȡлַֻ",
["Mouse Over Hero AA Cancel Fix:"] = "˳ҪѼͣ՚Ӣћʏ׽ȡлǕ٥",
["Mouse Over Hero Stop Distance:"] = "˳ҪѼͣ՚Ӣћʏ׽ֹͣߠk",
["Server Delay (don't touch): 100ms"] = "ؾϱǷғԙ100ہī",
["Disable AA Cancel Detection"] = "޻ԃǕ٥ȡл֬Ӣ",
["By Role:"] = "дއɫ",
["    Draw ADC"] = "ADCܦͼ",
["    Draw AP Carry"] = "APܦͼ",
["    Draw Support"] = "ب׺ܦͼ",
["    Draw Bruiser"] = "Ռࠍܦͼ",
["    Draw Tank"] = "̹ࠋܦͼ",
["By Champion:"] = "дӢћ",
["Modify Minion Health Bars"] = "ַֻСҸѪ͵",
["Maximum Health Bars To Modify"] = "خճѪ͵ַֻ",
["Draw Last Hit Arrows"] = "خ۳һܷͼю͡ё",
["Always Draw Modified Health Bars"] = "һֱДʾѪ͵ַֻ",
["Always Draw Last Hit Arrows"] = "һֱДʾخ۳һܷͼю͡ё",
["Sida's Auto Carry"] = "Sida؟߳",
["Setup"] = "ʨ׃",
["Hotkeys"] = "ࠬޝݼ",
["Configuration"] = "Ƥ׃",
["Target Selector"] = "ĿҪѡձ",
["Skills"] = "ܼŜ",
["Items"] = "ϯƷ",
["Farming"] = "ˢҸ",
["Melee"] = "΅ս",
["Drawing"] = "ܦͼ",
["Pets/Clones"] = "Ԩϯ/ࠋ¡",
["Streaming Mode"] = "ߪژ۬֯ģʽ",
["Advanced / Fixes"] = "ٟܶ/ַֻ",
["VPrediction"] = "VԤƐ",
["Collision"] = "ƶײͥܽ",
["Developers"] = "ߪע֟",
["Circles"] = "ԲȦ",
["Enemy AA Range Circles"] = "֐ɋǕ٥׶ΧȦ",
["Minion Drawing"] = "СҸҪ݇",
["Other"] = "Ǥ̻",
["Auto Carry Mode"] = "ؔ֯l֐٥ܷ",
["Last Hit Mode"] = "خ۳һܷҹնģʽ",
["Lane Clear Mode"] = "ȥПģʽ",
["Auto Carry Items"] = "ؔ֯l֐ʹԃքϯƷ",
["Mixed Mode Items"] = "ܬۏģʽʹԃքϯƷ",
["Lane Clear Items"] = "ȥПʹԃքϯƷ",
["Q (Decisive Strike)"] = "Q",
["E (Judgment)"] = "E",
["R (Demacian Justice)"] = "R",
["Masteries"] = "ͬس",
["Damage Prediction Settings"] = "ʋڦԤڀʨ׃",
["Turret Farm"] = "̾ЂˢҸ",
["Activator"] = "ܮۯ݁ : ",
["Activator Version : "] = "ܮۯ݁ѦѾۅ",
["Debug Mode Setting"] = "ַ˔ģʽʨ׃",
["Zhonya Debug"] = "ַ˔א҇",
["Debug Mode (shields,zhonya): "] = "ַ˔ģʽ(ۤל,א҇)",
["Font Size Zhonya"] = "א҇ؖͥճС",
["X Axis Draw Zhonya Debug"] = "א҇ДʾXסλ׃",
["Y Axis Draw Zhonya Debug"] = "א҇ДʾYסλ׃",
["QSS Debug "] = "ˮӸˎոַ˔",
["Debug Mode (qss): "] = "ַ˔ģʽ(ˮӸˎո)",
["Font Size QSS"] = "ˮӸˎոؖͥճС",
["X Axis Draw QSS Debug"] = "ˮӸˎոДʾXסλ׃",
["Y Axis Draw QSS Debug"] = "ˮӸˎոДʾYסλ׃",
["Cleanse Debug"] = "޻ۯַ˔",
["Debug Mode (Cleanse): "] = "ַ˔ģʽ(޻ۯ)",
["Font Size Cleanse"] = "޻ۯؖͥճС",
["X Axis Draw Cleanse Debug"] = "޻ۯДʾXסλ׃",
["Y Axis Draw Cleanse Debug"] = "޻ۯДʾYסλ׃",
["Mikael Debug"] = "ܡַܶ˔",
["Debug Mode (Mikael): "] = "ַ˔ģʽ(ܡܶ)",
["Font Size Mikael"] = "ܡܶؖͥճС",
["X Axis Draw Mikael Debug"] = "ܡܶДʾXסλ׃",
["Y Axis Draw Mikael Debug"] = "ܡܶДʾYסλ׃",
["Tower Damage"] = "؀Թ̾ʋڦ",
["Calculate Tower Damage"] = "݆̣؀Թ̾ʋڦ",
["Auto Spells"] = "ؔ֯ʹԃܼŜ",
["Auto Shield Spells"] = "ؔ֯ۤלܼŜ",
["Use Auto Shield Spells"] = "ʹԃؔ֯ۤלܼŜ",
["Max percent of hp"] = "خճʺļֵљؖ҈",
["Shield Ally Oriana"] = "הт{вňʹԃۤל",
["Auto Pot Settings"] = "ؔ֯ҩˮʨ׃",
["Use Auto Pots"] = "ʹԃؔ֯ҩˮ",
["Use Health Pots"] = "ؔ֯ԔѪƿ",
["Use Mana Pots"] = "ؔ֯Ԕ6ƿ",
["Use Flask"] = "ؔ֯Ԕħƿ",
["Use Biscuit"] = "ؔ֯Ԕҽى",
["Min Health Percent"] = "خСʺļֵљؖ҈",
["Health Lost Percent"] = "̰ʧʺļֵљؖ҈",
["Min Mana Percent"] = "خС6љؖ҈",
["Min Flask Health Percent"] = "ħƿ-خСʺļֵљؖ҈",
["Min Flask Mana Percent"] = "ħƿ-خС6љؖ҈",
["Offensive Items Settings"] = "޸٥ϯƷʨ׃",
["Button Mode"] = "дݼģʽ",
["Use Button Mode"] = "ʹԃдݼģʽ",
["Button Mode Key"] = "дݼ",
["AP Items"] = "APϯƷ",
["Use AP Items"] = "ʹԃAPϯƷ",
["Use Bilgewater Cutlass"] = "ʹԃ҈׻ܪϖ͘Τն",
["Use Blackfire Torch"] = "ʹԃ��ܰߦ",
["Use Deathfire Grasp"] = "ʹԃڤ֮ܰӵ",
["Use Hextech Gunblade"] = "ʹԃڣࠋ˹ࠆܼǹɐ",
["Use Twin Shadows"] = "ʹԃ˫ʺеӰ",
["Use Odyn's Veil"] = "ʹԃтշ׷քĦɱ",
["AP Item Mode: "] = "APϯƷģʽ",
["Burst Mode"] = "Ѭעģʽ",
["Combo Mode"] = "l֐ģʽ",
["KS Mode"] = "Ȁɋͷģʽ",
["AD Items"] = "ADϯƷ",
["Use AD Items On Auto Attack"] = "՚ƽAքʱ۲ʹԃADϯƷ",
["Use AD Items"] = "ʹԃADϯƷ",
["Use Blade of the Ruined King"] = "ʹԃǆќε֮֟ɐ",
["Use Entropy"] = "ʹԃҹ˪սԸ",
["Use Ravenous Hydra"] = "ʹԃ߅ͷʟ",
["Use Sword of the Divine"] = "ʹԃʱʥ֮ݣ",
["Use Tiamat"] = "ʹԃ҇͡í͘",
["Use Youmuu's Ghostblade"] = "ʹԃԄĎ֮©",
["Use Muramana"] = "ʹԃħȐ",
["Min Mana for Muramana"] = "ʹԃħȐքخС6",
["Minion Buff"] = "СҸնӦ",
["Use Banner of Command"] = "ʹԃۅ®֮Ǭ",
["AD Item Mode: "] = "ADϯƷģʽ",
["Burst Mode"] = "Ѭעģʽ",
["Combo Mode"] = "l֐ģʽ",
["KS Mode"] = "Ȁɋͷģʽ",
["Defensive Items Settings"] = "؀ԹϯƷʨ׃",
["Cleanse Item Config"] = "޻ۯʨ׃",
["Stuns"] = "ѣՎ",
["Silences"] = "ԁĬ",
["Taunts"] = "Ӱح",
["Fears"] = "ࠖߥ",
["Charms"] = "��",
["Blinds"] = "ׂä",
["Roots"] = "޻",
["Disarms"] = "Ҥю",
["Suppresses"] = "ѹ׆",
["Slows"] = "ݵ̙",
["Exhausts"] = "ѩɵ",
["Ignite"] = "֣ȼ",
["Poison"] = "א־",
["Shield Self"] = "ؔ֯ۤל",
["Use Self Shield"] = "ʹԃؔ֯ۤל",
["Use Seraph's Embrace"] = "ʹԃԣͬʹ֮ӵ",
["Use Ohmwrecker"] = "ʹԃىɅˮާ",
["Min dmg percent"] = "خСʋڦљؖ҈",
["Zhonya/Wooglets Settings"] = "א҇/ϖٱU͘քϗʦñʨ׃",
["Use Zhoynas"] = "ʹԃא҇",
["Use Wooglet's Witchcap"] = "ʹԃϖٱU͘քϗʦñ",
["Only Z/W Special Spells"] = "ֻהܼ֨͘Ŝʹԃ",
["Debuff Enemy"] = "ה֐ɋʹԃݵӦЧڻ",
["Use Debuff Enemy"] = "ʹԃݵӦЧڻ",
["Use Randuin's Omen"] = "<י֮֗",
["Randuins Enemies in Range"] = "՚׶ΧŚԐXٶ֐ɋʱʹԃ<י",
["Use Frost Queen"] = "ʹԃҹ˪Ů܊քָ®",
["Cleanse Self"] = "޻ۯ`ϯƷ",
["Use Self Item Cleanse"] = "ʹԃ޻ۯ`ϯƷ",
["Use Quicksilver Sash"] = "ʹԃˮӸˎո",
["Use Mercurial Scimitar"] = "ʹԃˮӸΤն",
["Use Dervish Blade"] = "ʹԃࠠѐɮ֮ɐ",
["Cleanse Dangerous Spells"] = "޻ۯΣЕքܼŜ",
["Cleanse Extreme Spells"] = "޻ۯܫ׋ΣЕքܼŜ",
["Min Spells to use"] = "خʙӵԐXזݵӦЧڻӅʹԃ",
["Debuff Duration Seconds"] = "ݵӦЧڻԖѸʱݤ",
["Shield/Boost Ally"] = "ٸԑ߼ʹԃۤל/ݓ̙",
["Use Support Items"] = "ʹԃب׺ϯƷ",
["Use Locket of Iron Solari"] = "ٖͺҴ֮ϻ",
["Locket of Iron Solari Life Saver"] = "ʺļֵ֍ԚXʱʹԃٖͺҴ֮ϻ",
["Use Talisman of Ascension"] = "؉ʽۤػ",
["Use Face of the Mountain"] = "ɽՀ֮ɝ",
["Face of the Mountain Life Saver"] = "ʺļֵ֍ԚXʱʹԃɽՀ֮ɝ",
["Use Guardians Horn"] = "˘ۤ֟քۅއ",
["Life Saving Health %"] = " ʺļֵ֍ԚX%",
["Mikael Cleanse"] = "ė߭׻քܡܶ",
["Use Mikael's Crucible"] = "ʹԃܡܶ",
["Mikaels cleanse on Ally"] = "הԑ߼ʹԃܡܶ",
["Mikaels Life Saver"] = "ʺļ֍ԚX%ʱʹԃܡܶ",
["Ally Saving Health %"] = "ԑ߼ʺļֵ֍ԚX%",
["Self Saving Health %"] = "ؔܺʺļֵ֍ԚX%",
["Min Spells to use"] = "خʙӵԐXזݵӦЧڻӅʹԃ",
["Set Debuff Duration"] = "ʨ׃ݵӦЧڻԖѸʱݤ",
["Champ Shield Config"] = "Ӣћۤלʨ׃",
["Champ Cleanse Config"] = "Ӣћ޻ۯʨ׃",
["Shield Ally Vayne"] = "הԑ߼ޱ׷ʹԃۤל",
["Cleanse Ally Vayne"] = "הԑ߼ޱ׷ʹԃ޻ۯ",
["Show In Game"] = "՚ԎϷאДʾ",
["Show Version #"] = "ДʾѦѾۅ",
["Show Auto Pots"] = "Дʾؔ֯ҩˮ",
["Show Use Auto Pots"] = "Дʾʹԃؔ֯ҩˮ",
["Show Use Health Pots"] = "Дʾؔ֯Ѫҩ",
["Show Use Mana Pots"] = "Дʾؔ֯6ҩ",
["Show Use Flask"] = "Дʾؔ֯ħƿ",
["Show Offensive Items"] = "Дʾ٥ܷэϯƷ",
["Show Use AP Items"] = "ДʾʹԃAPϯƷ",
["Show AP Item Mode"] = "ДʾAPϯƷģʽ",
["Show Use AD Items"] = "ДʾʹԃADϯƷ",
["Show AD Item Mode"] = "ДʾADϯƷģʽ",
["Show Defensive Items"] = "Дʾ؀ԹϯƷ",
["Show Use Self Shield Items"] = "Дʾהؔܺʹԃۤל`ϯƷ",
["Show Use Debuff Enemy"] = "Дʾה֘׽ʹԃݵӦЧڻ",
["Show Self Item Cleanse "] = "Дʾהؔܺʹԃ޻ۯ",
["Show Use Support Items"] = "Дʾʹԃب׺ϯƷ",
["Show Use Ally Cleanse Items"] = "Дʾהԑ߼ʹԃ޻ۯ`ϯƷ",
["Show Use Banner"] = "Дʾʹԃۅ®֮Ǭ",
["Show Use Zhonas"] = "Дʾʹԃא҇",
["Show Use Wooglets"] = "ДʾʹԃϖٱU͘քϗʦñ",
["Show Use Z/W Lifeaver"] = "Дʾʹԃא҇քԥעʺļֵ",
["Show Z/W Dangerous"] = "Дʾʹԃא҇քΣЕԌ׈",
["DeklandAIO: Orianna"] =  "ʱϵۏܯúт{вň",
["DeklandAIO Version: "] =  "ʱϵۏܯѦѾۅú",
["Auth Settings"] =  "ޅѾҩ֤ʨ׃",
["Debug Auth"] =  "ַ˔ҩ֤",
["Fix Auth"] =  "ўشҩ֤",
["Target Selector Settings"] =  "ĿҪѡձǷʨ׃",
["Left Click Overide"] =  "سݼ֣ܷĿҪԅЈ",
["1 = Highest, 5 = Lowest, 0 = Ignore"]	= "1-خٟì5-خ֍ì0-۶Ô",
["Use Priority Mode"] =  "ʹԃԅЈܶģʽ",
["Set Priority Vladimir"] =  "ʨ׃ϼѪڭքԅЈܶ",
["Keys Settings"] =  "ݼλʨ׃",
["Harass"] =  "ɧɅ",
["Harass Toggle"] =  "ɧɅߪژ",
["TeamFight"] =  "΅ս",
["Skill Settings"] =  "ܼŜʨ׃",
["                    Q Skill          "] =  "                QܼŜ              ",
["Use Harass"] =  "ʹԃكܼŜɧɅ",
["Use Kill Steal"] =  "ʹԃكܼŜȀɋͷ",
["Use Spacebar"] =  "ʹԃࠕٱ",
["                    W Skill          "] =  "                WܼŜ              ",
["Min No. Of Enemies In W Range"] =  "՚W׶ΧŚخС֐ɋ˽",
["                    E Skill          "] =  "                EܼŜ              ",
["Use E>Q Combo"] =  "ʹԃEQl֐",
["Use E If Can Hit"] =  "ɧڻȲŜܷאĿҪʱʹԃE",
["Use E>W or E>R"] =  "ʹԃEWܲ֟ERl֐",
["                    R Skill          "] =  "                RܼŜ              ",
["R Block"] =  "޻ֹRؔ֯ˍ؅",
["Set R Range"] =  "ʨ׃Rք׶Χ",
["Use Combo Ult - (Q+W+R Dmg)"] =  "ʹԃוܫl֐èQWRքʋڦé",
["Min No. Of Enemies"] =  "ձׁʙԐXĻ֐ɋʱˍ؅",
["Min No. Of KS Enemies"] =  "ձׁʙԐXĻӐѪ֐ɋʱˍ؅",
["Ult Vladimir"] =  "הϼѪڭˍ؅R",
["                    Misc Settings          "] =  "            ՓЮʨ׃              ",
["Harass Mana Management"] =  "ɧɅ6࠘׆",
["Farm Settings"] =  "ˢҸʨ׃",
["                    Farm Keys          "] =  "            ˢҸдݼ              ",
["Farm Press"] =  "ˢҸдݼ",
["Farm Toggle"] =  "ˢҸߪژ",
["Lane Clear Press"] =  "ȥПдݼ",
["Lane Clear Toggle"] =  "ȥПߪژ",
["Jungle Farm"] =  "ȥҰ",
["                    Q Farm          "] =  "         QܼŜˢҸ           ",
["Last Hit"] =  " ",
["Lane Clear"] =  "ȥП",
["Jungle"] =  "ȥҰ",
["                    W Farm          "] =  "         WܼŜˢҸ           ",
["                    E Farm          "] =  "         EܼŜˢҸ           ",
["                    Misc          "] =  "                    ՓЮ          ",
["Farm Mana Management"] =  "ˢҸ6࠘׆",
["OrbWalk Settings"] =  "؟߳ʨ׃",
["            Team Fight Orbwalk Settings          "] =  "            ΅ս؟߳ʨ׃          ",
["Move To Mouse"] =  "в˳Ҫλ׃ӆ֯",
["Auto Attacks"] =  "ؔ֯٥ܷ",
["               Harrass Orbwalk Settings          "] =  "            ɧɅ؟߳ʨ׃          ",
["              Lane Farm Orbwalk Settings          "] =  "         ȥПˢҸ؟߳ʨ׃         ",
["              Jungle Farm Orbwalk Settings          "] =  "            ȥҰ؟߳ʨ׃          ",
["On Dash Settings"] =  "Ħהͻ޸ʱʨ׃",
["Check On Dash Vladimir"] =  "ݬөϼѪڭքͻ޸",
["Items Settings"] =  "ϯƷʨ׃",
["AP Items"] =  "APքϯƷ",
["Use AP Items"] =  "ʹԃAPϯƷ",
["Use Bilgewater Cutlass"] =  "҈׻ܪϖ͘Τն",
["Use Blackfire Torch"] =  "��ܰߦ",
["Use Deathfire Grasp"] =  "ڤ֮ܰӵ",
["Use Hextech Gunblade"] =  "ڣࠋ˹ࠆܼǹɐ",
["Use Twin Shadows"] =  "˫ʺеӰ",
["AP Item Mode: "] =  "APϯƷģʽ",
["Burst Mode"] =  "Ѭעģʽ",
["Combo Mode"] =  "l֐ģʽ",
["KS Mode"] =  "Ȁɋͷģʽ",
["AD Items"] =  "ADϯƷ",
["Use AD Items"] =  "ʹԃADϯƷ",
["Use Blade of the Ruined King"] =  "ʹԃǆќε֮֟ɐ",
["Use Entropy"] =  "ҹ˪սԸ",
["Use Sword of the Divine"] =  "ʱʥ֮ݣ",
["Use Tiamat/Ravenous Hydra"] =  "҇͡í͘/߅ͷʟ",
["Use Youmuu's Ghostblade"] =  "ԄĎ֮©",
["Use Muramana"] =  "ħȐ",
["Min Mana for Muramana"] =  "ʹԃħȐքخС6",
["AD Item Mode: "] =  "ADϯƷģʽ",
["Support Items"] =  "ب׺ϯƷ",
["Use Support Items"] =  "ʹԃب׺ϯƷ",
["Auto Wards"] =  "ؔ֯ӥқ",
["Use Sweeper"] =  "ʹԃɨĨ",
["Ward Mode: "] =  "ӥқģʽ",
["Only Bushes"] =  "ֻ՚ӝՔ",
["Always"] =  "؜ˇ",
["Summoner Spells"] =  "֙۽ʦܼŜ",
["                    Ignite          "] =  "                    ֣ȼ          ",
["Use Ignite"] =  "ʹԃ֣ȼ",
["Ignite Mode : "] =  "֣ȼģʽú",
["ComboMode"] =  "l֐ģʽ",
["KSMode"] =  "Ȁɋͷģʽ",
["                    Smite          "] =  "                    ԍޤ          ",
["             Smite Not Found         "] =  "ûԐעЖԍޤ",
["Draw Settings"] =  "ܦͼʨ׃",
["Draw Skill Ranges"] =  "ۭԶܼŜПȦ",
["Lag free draw"] =  "һӰЬғԙքПȦ",
["Draw Q Range"] =  "ۭԶQܼŜПȦ",
["Choose Q Range Colour"] =  "ѡձQܼŜПȦҕɫ",
["Draw W Range"] =  "ۭԶWܼŜПȦ",
["Choose W Range Colour"] =  "ѡձWܼŜҕɫ",
["Draw E Range"] =  "ۭԶEܼŜПȦ",
["Choose E Range Colour"] =  "ѡձEܼŜПȦҕɫ",
["Draw R Range"] =  "ۭԶRܼŜПȦ",
["Choose R Range Colour"] =  "ѡձRܼŜПȦҕɫ",
["Draw AA Range"] =  "ۭԶƽAք׶Χ",
["Draw Awareness"] =  "ДʾӢʶ",
["Draw Clicking Points"] =  "Дʾ֣ܷքλ׃",
["Draw Enemy Cooldowns"] =  "Дʾ֐ɋքCD",
["Draw Enemy Predicted Damage"] =  "Дʾ֐ɋքʋڦ",
["Draw Last Hit Marker"] =  "ДʾβնքҪ݇",
["Draw Wards + Wards Timers"] =  "ДʾқλӔܰқλʱݤ",
["Draw Turret Ranges"] =  "Дʾ؀Թ̾׶Χ",
["Draw Kill Range"] =  "Дʾܷɱ׶Χ",
["Kill Range"] =  "ܷɱ׶Χ",
["Choose Kill Range Colour"] =  "ѡձܷɱ׶Χքҕɫ",
["Draw Focused Target"] =  "Дʾ̸֨քĿҪ",
["Focused Target"] =  "̸֨ĿҪ",
["Choose Focused Target Colour"] =  "ѡձ̸֨ĿҪքҕɫ",
["Draw Doomball Ranges"] =  "Дʾħżք׶Χ",
["Draw Doomball W Range"] =  "ДʾħżWք׶Χ",
["Draw Doomball R Range"] =  "ДʾħżRք׶Χ",
----------------------------------------------------------------
["DeklandAIO: Syndra"] =  "ʱϵۏܯúсւ-",
["Set Priority Amumu"] =  "ʨ׃ľľքԅЈܶ",
["Use QE Snipe"] =  "ʹԃQE",
["Cast On Optimal Target"] =  "הخݑĿҪˍ؅",
["Ult Amumu"] =  "הľľˍ؅R",
["Use QE Snipe (Teamfight)"] =  "ʹԃQEè՚΅սʱé",
["Use QE Snipe (Harass)"] =  "ʹԃQEè՚ɧɅʱé",
["Use Kill Steal QE Snipe"] =  "ԃQEȀɋͷ",
["Use Gap Closers"] =  "הͻ޸ʹԃքܼŜ",
["Interupt Skills"] =  "ղ׏֐׽ܼŜ",
["Check On Dash Amumu"] =  "ݬөľľքͻ޸",
["Draw QE Range"] =  "ۭԶQEք׶Χ",
["Choose QE Range Colour"] =  "ѡձQEքПȦҕɫ",
["Draw Prediction"] =  "ۭԶԤƐ",
["Draw Q Prediction"] =  "ۭԶQքԤƐ",
["Draw W Prediction"] =  "ۭԶWքԤƐ",
["Draw E Prediction"] =  "ۭԶEքԤƐ",
["Draw QE Prediction"] =  "ۭԶQEքԤƐ",
-----------------ʕʋۏܯ----------------------------
["HTTF Prediction"] = "HTTFԤƐ",
["Collision Settings"] = "ƶײʨ׃",
["Buffer distance (Default value = 10)"] = "ۺԥߠk(Ĭɏ10)",
["Ignore which is about to die"] = "۶ÔݫҪ̀ζքĿҪ",
["Script version: "] = "ޅѾѦѾۅ",
["DivinePrediction"] = "ʱʥԤƐ",
["Min Time in Path Before Predict"] = "ԤƐ·޶քخСʱݤ",
["Central Accuracy"] = "אфޫ׼׈",
["Debug Mode [Dev]"] = "ַ˔ģʽ[ߪע֟]",
["Cast Mode"] = "ˍ؅ģʽ",
["Fast"] = "ࠬ",
["Slow"] = "ý",
["Collision"] = "ƶײ",
["Collision buffer"] = "ƶײۺԥ",
["Normal minions"] = "ǕͨСҸ",
["Jungle minions"] = "Ұږ",
["Others"] = "Ǥ̻",
["Check if minions are about to die"] = "ݬөܴݫ̀ζքСҸ",
["Check collision at the unit pos"] = "ݬөեλλ׃քƶײ",
["Check collision at the cast pos"] = "ݬөˍ؅λ׃քƶײ",
["Check collision at the predicted pos"] = "ݬөԤƐλ׃քƶײ",
["Developers"] = "ߪע֟",
["Enable debug"] = "Ǵԃַ˔",
["Show collision"] = "Дʾƶײ",
["Version"] = "ѦѾ",
["--- Fun House Team ---"] = "---ʕʋ΅ד---",
["made by burn & ikita"] = "ط֟ burn & ikita",
["FH Global Settings"] = "ʕʋۏܯȫߖʨ׃",
["Amumu"] = "Тľľ",
["5 = Maximum priority = You will focus first!"] = "5 - خճԅЈܶ -˗Ҫ٥ܷĿҪ",
["Target Selector - Extra Setup"] = "ĿҪѡձǷ - ׮΢ʨ׃",
["- DISTANCE TO IGNORE TARGET (FOCUS MODE) -"] = "۶Ô̸֨ĿҪքߠk",
["Default distance"] = " Ĭɏߠk",
["------ DRAWS ------"] = "------ Дʾ ------",
["This allow you draw your target on"] = "֢Юʨ׃ՊѭݫĿҪДʾ՚ǁĻʏ",
["the screen, for quicker target orientation"] = "ӔܱփټࠬքĿҪ׽в",
["Enable draw of target (circle)"] = "ǴԃДʾĿҪ(ПȦ)",
["Target circle color"] = "ĿҪПȦҕɫ",
["Enable draw of target (text)"] = "ǴԃДʾĿҪ(τؖ)",
["Select where to draw"] = "ѡձДʾքλ׃",
["Fixed On Screen"] = "ڌ֨՚ǁĻʏ",
["On Mouse"] = "՚˳Ҫʏ",
["--- Draw values ---"] = "--- Дʾʨ׃ ---",
["Draw X location"] = "ДʾXסλ׃",
["Draw Y location"] = "ДʾYסλ׃",
["Draw size"] = "ДʾճС",
["Draw color"] = "Дʾҕɫ",
["Reset draw position"] = "טʨДʾλ׃",
["Auto Potions"] = "ؔ֯ҩˮ",
["Use Health Potion"] = "ʹԃѪƿ",
["Use Refillable Potion"] = "ʹԃشԃэҩˮ",
["Use Hunters Potion"] = "ʹԃɋҩˮ",
["Use Corrupting Potion"] = "ʹԃدќҩˮ",
["Corrupting Potion DPS in Combat"] = "՚սַאʹԃدќҩˮնݓʋڦ",
["Absolute Min Health %"] = "߸הʺļֵخСљؖ҈",
["In Combat Min Health %"] = "սַאʺļֵخСљؖ҈",
["QSS & Cleanse"] = "ˮӸ & ޻ۯ",
["Enable auto cleanse enemy debuffs"] = "Ǵԃؔ֯޻ۯ",
["Settings for debuffs"] = "ݵӦЧڻʨ׃",
["- Global delay before clean debuff -"] = "ؔ֯޻ۯքȫߖғԙ",
["Global Default delay"] = "ȫߖĬɏғԙ",
["- Usual debuffs -"] = "-ӣڦݵӦЧڻ-",
["Cleanse if debuff time > than (ms):"] = "ɧڻݵӦЧڻʱݤճԚ..ʹԃ޻ۯ",
["- Slow debuff -"] = "- ݵ̙ -",
["Cleanse if slow time > than (ms):"] = "ɧڻݵ̙ʱݤճԚ..ʹԃ޻ۯ",
["- Special cases -"] = "- ͘ˢȩ࠶ -",
["Remove Zed R mark"] = "ޢޙքճ֐",
["Extra Awaraness"] = "׮΢Ӣʶ",
["Enable Extra Awaraness"] = "Ǵԃ׮΢Ӣʶ",
["Warning Range"] = "ޯ٦ք׶Χ",
["Draw even if enemy not visible"] = "ܴʹ֐ɋӾʭҲП˸",
["Security & Humanizer"] = "вȫ&Ţɋۯ",
["------------ SECURITY ------------"] = "------------ вȫ ------------",
["Enabling this, you will limit all functions"] = "ǴԃՋʨ׃ìܡО׆޶ձ֐ɋ՚ţք",
["to only trigger them if enemy/object"] = "ǁĻʏʱ̹Ԑ٦ŜӅʺЧ",

["Enable extra Security mode"] = "Ǵԃ׮΢вȫʨ׃",
["------------ HUMANIZER ------------"] = "------------ Ţɋۯ ------------",
["This will insert a delay between spells"] = "֢Юʨ׃ݫܡ՚ţքl֐אݤݓɫғԙ",
["If you set too high, it will make combo slow,"] = "ɧڻţݫ˽ֵʨ֨քڽٟìl֐ܡҤý",
["so if you use it increase it gradually!"] = "̹ӔɧڻţҪʹԃք۰ìȫýýնݓ˽ֵ",
["Humanize Delay in ms"] = "Ţɋۯғԙ(ہī)",
["Ryze Fun House 2.0"] = "ʕʋۏܯ2.0 - ɰ؈",
["General"] = "ӣڦ",
["Key binds"] = "ݼλʨ׃",
["Auto Q stack out of combat"] = "՚l֐΢ؔ֯Q՜ѻ֯",
["Combat"] = "l֐",
["Smart Combo"] = "ׇŜl֐",
["Use Items on Combo"] = "՚l֐אʹԃϯƷ",
["Use Desperate Power (R)"] = "ʹԃ߸λ֮f(R)",
["R Cast Mode"] = "Rʹԃģʽ",
["Required stacks on 'Smart' for cast R"] = "ׇŜʹԃRʱѨҪѻ֯ӣ˽",
["Harass"] = "ɧɅ",
["Use Overload (Q)"] = "ʹԃӬغۉ(Q)",
["Use Rune Prison (W)"] = "ʹԃػτ޻(W)",
["Use Spell Flux (E)"] = "ʹԃר˵ӿ֯(E)",
["Use Overload (Q) for last hit"] = "ʹԃQ4ҹβն",
["Min Mana % to use Harass"] = "ɧɅքخС6 %",
["Auto kill"] = "ܷؔ֯ɱ",
["Enable Auto Kill"] = "Ǵԃܷؔ֯ɱ",
["Auto KS under enemy towers"] = "՚֐ɋ̾Ђؔ֯Ȁɋͷ",
["Farming"] = "ˢҸ",
["Lane Clear"] = "ȥП",
["Min Mana % for lane clear"] = "ȥПքخС6 %",
["Last Hit"] = "βն",
["Use Q for last hit"] = "ʹԃQ4ҹβն",
["Last Hit with AA"] = "ʹԃƽA4ҹβն",
["Min Mana % for Q last hit"] = "QҹβնքخС6",
["Drawings"] = "Дʾʨ׃",
["Spell Range"] = "ܼŜПȦ",
["Enable Draws"] = "ǴԃДʾ",
["Draw Q range"] = "ДʾQ׶Χ",
["Q color"] = "QПȦҕɫ",
["Draw W-E range"] = "ДʾW-E׶Χ",
["W-E color"] = "W-EПȦҕɫ",
["Draw Stacks"] = "Дʾѻ֯ӣ˽",
["Use Lag Free Circle"] = "ʹԃһӰЬғԙքПȦ",
["Kill Texts"] = "ܷɱ͡ʾ",
["Use KillText"] = "Ǵԃܷɱ͡ʾ",
["Draw KillTime"] = "Дʾܷɱʱݤ",
["Text color"] = "τؖҕɫ",
["Draw Damage Lines"] = "ДʾʋڦָʾП",
["Damage color display"] = "Дʾʋڦքҕɫ",
["Miscellaneous"] = "ՓЮʨ׃",
["Auto Heal"] = "ؔ֯׎",
["Automatically use Heal"] = "ʹԃؔ֯׎",
["Min percentage to cast Heal"] = "ʹԃ׎քخСѪ %",
["Use Heal to Help teammates"] = "הԑ߼ʹԃ׎",
["Teammates to Heal"] = "ʹԃ׎քԑ߼",
["Auto Zhonyas"] = "ؔ֯א҇",
["Automatically Use Zhonyas"] = "ؔ֯ʹԃא҇",
["Min Health % to use Zhonyas"] = "ʹԃא҇քخСѪ",
["Use W on enemy gap closers"] = "ה֐׽քͻ޸ʹԃW",
["Auto Q for get shield vs gap closers"] = "ؔ֯Q4ܱփۤלӔ֖Թͻ޸",
["Auto use Seraph's Embrace on low Health"] = "֍Ѫʱؔ֯ʹԃճͬʹ",
["Min % to cast Seraph's Embrace"] = "ʹԃճͬʹքخСѪ %",
["Prediction"] = "ԤƐ",
["-- Prediciton Settings --"] = "------ ԤƐʨ׃ ------",
["VPrediction"] = "VԤƐ",
["DPrediction"] = "ʱʥԤƐ",
["-- VPrediction Settings --"] = "------ VԤƐʨ׃ ------",
["Q Hit Chance"] = "Qքļאܺܡ",
["Medium"] = "אֈ",
["High"] = "ٟ",
["-- HPrediction Settings --"] = "------ HԤƐʨ׃ ------",
["-- DPrediction Settings --"] = "----- ʱʥԤƐʨ׃ -----",
["Instant force W"] = "bܴǿ׆ʹԃW",
["Flee Key"] = "͓Ɯдݼ",
["Toggle Parry Auto Attack"] = "Ȑۻٱղؔ֯٥ܷ",
["Orbwalk on Combo"] = "՚l֐אք؟߳",
["To Vital"] = "ӆׁ֯ɵ֣",
["To Target"] = "ӆׁ֯ĿҪ",
["Disabled"] = "ژҕ",
["Orbwalk Magnet Range"] = "؟߳Յf׶Χ",
["Vital Strafe Outwards Distance %"] = "ܷאɵ֣в΢ғʬߠk%",
["Fiora Fun House 2.0"] = "ʕʋۏܯ2.0",
["Orbwalk Settings"] = "؟߳ʨ׃",
["W Hit Chance"] = "WܼŜļאքܺܡ",
["Draw R range"] = "ДʾRք׶Χ",
["Draw AA range"] = "ДʾƽAք׶Χ",
["Use IGNITE"] = "ʹԃ֣ȼ",
["Q Color"] = "QܼŜПȦҕɫ",
["Combo"] = "l֐",
["--- Combo Logic ---"] = "--- l֐ßܭ ---",
["Save Q for dodge enemy hard spells"] = "ѣ´Q4ףҜ֐ɋքטҪܼŜ",
["Q Gapclose regardless of vital"] = "ʹԃQͻ޸ʱ۶Ôɵ֣",
["Gapclose min catchup time"] = "ͻ޸خС׷ُʱݤ",
["Q minimal landing position"] = "Qքخ׌ˍ؅λ׃",
["Q Angle in degrees"] = "Qքއ׈",
["Q on minion to reach enemy"] = "QСҸ4ޓ޼֐ɋ",
["--- Ultimate R Logic ---"] = "--- ճ֐ʹԃßܭ ---",
["Focus R Casted Target"] = "̸֨ʹԃRքĿҪ",
["Cast when target killable"] = "ձĿҪࠉӔѻܷɱʱʹԃR",
["Cast only when healing required (overrides above)"] = "ԐܘѪѨҪʱԃR",
["Cast when our HP less than %"] = "ձʺļֵСԚ%ʱʹԃR",
["Cast before KS with Q when lower than"] = "՚ԃQȀɋͷ֮ǰʹԃR",
["Riposte Options"] = "M×͘фқն(W)ʨ׃",
["Riposte Enabled"] = "ʹԃW",
["Save Q Evadeee when Riposte cd"] = "ձWcdʱѣ´Q4ףҜ",
["Auto Parry next attack when %HP <"] = "ձʺļֵСԚ%ʱؔ֯ٱղЂһՎǕͨ٥ܷ",
["Humanizer: Extra delay"] = "Ţɋۯú׮΢ғԙ",
["Parry Summoner Spells (low latency)"] = "ٱղ֙۽ʦܼŜ(֍ғԙ)",
["Parry Dragon Wind"] = "ٱղСºք٥ܷ",
["Parry Auto Attacks"] = "ٱղǕͨ٥ܷ",
["Parry AA Damage Threshold"] = "ٱղƽAքʋڦާֵ",
["Parry is still a Work In Progress"] = "ٱղ٦Ŝˇɔ՚ߪעք٦Ŝ",
["If is not parrying a spell from the list,"] = "ɧڻûԐٱղҭאքܼŜ",
["before report on forum, make a list like:"] = "՚Ѩ٦֮ǰìдһٶбЂĦһҹքҭ",
["Champion-Spell that fails to parry"] = "ٱղʧќքܼŜúɧڻţԐճԚ20ٶ",
["When you have 20+ added, post it on forum. Thanks"] = "ϞרٱղքܼŜìȫעҭ՚ʏ",
["Riposte Main List"] = "ٱղ׷ҪܼŜҭ",
["--- Riposte Spells At Arrival ---"] = "--- ձܼŜļאքʱ۲ٱղ ---",
["Riposte Extra List"] = "ٱղ׮΢ܼŜҭ",
["Use Q on Harass"] = "՚ɧɅאʹԃQ",
["Use Lunge (Q)"] = "ʹԃǆࠕնQ",
["Use Riposte (W) [only on Jungle]"] = "ʹԃM×͘фқնW[ֻהҰږ]",
["Use Bladework (E)"] = "ʹԃסļlՌE",
["Use items"] = "ʹԃϯƷ",
["R Color"] = "RܼŜҕɫ",
["AA Color"] = "ƽAПȦҕɫ",
["Draw Magnet Orbwalk range"] = "Дʾ؟߳Յf׶Χ",
["Draw Flee direction"] = "Дʾ͓Ɯ׽в",
["Draw KillText"] = "Дʾܷɱ͡ʾ",
["HPrediction"] = "HԤƐ",
["SxOrbWalk"] = "Sx؟߳",
["General-Settings"] = "ӣڦʨ׃",
["Orbwalker Enabled"] = "؟߳ʺЧ",
["Stop Move when Mouse above Hero"] = "ձӢћ՚˳ҪЂʱֹͣӆ֯",
["Range to Stop Move"] = "ֹͣӆ֯քȸԲ",
["ExtraDelay against Cancel AA"] = "ȡлƽA۳ҡք׮΢ғԙ",
["Spam Attack on Target"] = "ޡࠉŜנքƽAĿҪ",
["Orbwalker Modus: "] = "؟߳ģʽ",
["To Mouse"] = "в˳Ҫ",
["Humanizer-Settings"] = "Ţɋۯʨ׃",
["Limit Move-Commands per Second"] = "О׆ÿīע̍քӆָ֯®",
["Max Move-Commands per Second"] = "ÿīע̍ӆָ֯®քخճՎ˽",
["Key-Settings"] = "ݼλʨ׃",
["FightMode"] = "սַģʽ",
["HarassMode"] = "ɧɅģʽ",
["LaneClear"] = "ȥП",
["LastHit"] = "βն",
["Toggle-Settings"] = "Ȑۻʨ׃",
["Make FightMode as Toggle"] = "ДʾսַģʽȐۻ",
["Make HarassMode as Toggle"] = "ДʾɧɅģʽȐۻ",
["Make LaneClear as Toggle"] = "ДʾȥПģʽȐۻ",
["Make LastHit as Toggle"] = "ДʾβնģʽȐۻ",
["Farm-Settings"] = "ˢҸʨ׃",
["Focus Farm over Harass"] = "՚ɧɅʱרфҹն",
["Extra-Delay to LastHit"] = "βնʱք׮΢ғԙ",
["Mastery-Settings"] = "ͬسʨ׃",
["Mastery: Butcher"] = "΀ز",
["Mastery: Arcane Blade"] = "˫ɐݣ",
["Mastery: Havoc"] = "ܙİ",
["Mastery: Devastating Strikes"] = "ܙİղܷ",
["Draw-Settings"] = "Дʾʨ׃",
["Draw Own AA Range"] = "ДʾؔܺքƽAПȦ",
["Draw Enemy AA Range"] = "Дʾ֐ɋքƽAПȦ",
["Draw LastHit-Cirlce around Minions"] = "՚СҸʏДʾβնПȦ",
["Draw LastHit-Line on Minions"] = "՚СҸʏДʾβնָʾП",
["Draw Box around MinionHpBar"] = "՚СҸѪ͵ʏۭ؅ߪ",
["Color-Settings"] = "ҕɫʨ׃",
["Color Own AA Range: "] = "ؔܺքƽAПȦքҕɫ",
["white"] = "їɫ",
["blue"] = "6ɫ",
["red"] = "۬ɫ",
["black"] = "ۚɫ",
["green"] = "Ìɫ",
["orange"] = "Ԉɫ",
["Color Enemy AA Range (out of Range): "] = "֐ɋƽAПȦքҕɫ(׶Χ΢)",
["Color Enemy AA Range (in Range): "] = "֐ɋƽAПȦքҕɫ(׶ΧŚ)",
["Color LastHit MinionCirlce: "] = "СҸβնПȦҕɫ",
["Color LastHit MinionLine: "] = "СҸβնָʾПҕɫ",
["ColorBox: Minion is LasthitAble: "] = "СҸࠉѻβնքҕɫ",
["none"] = "Ϟ",
["ColorBox: Wait with LastHit: "] = "СҸֈսѻβնքҕɫ",
["ColorBox: Can Attack Minion: "] = "ࠉӔ٥ܷքСҸҕɫ",
["TargetSelector"] = "ĿҪѡձǷ",
["Priority Settings"] = "ԅЈܶҕɫ",
["Focus Selected Target: "] = "̸֨ѡ֨քĿҪ",
["never"] = "Փһ",
["when in AA-Range"] = "ձ՚ƽA׶Χʱ",
["TargetSelector Mode: "] = "ĿҪѡձǷģʽ",
["LowHP"] = "֍Ѫ",
["LowHPPriority"] = "֍Ѫ+ԅЈܶ",
["LessCast"] = "ټʙˍ؅ܼŜ",
["LessCastPriority"] = "ټʙˍ؅ܼŜ+ԅЈܶ",
["nearest myHero"] = "kؔܺքӢћخ޼",
["nearest Mouse"] = "k˳Ҫخ޼",
["RawPriority"] = "טʨԅЈܶ",
["Highest Priority (ADC) is Number 1!"] = "خٟԅЈܶ(ADC)Ϊ1",
["Debug-Settings"] = "ַ˔ģʽ",
["Draw Circle around own Minions"] = "՚ܺ׽СҸʏۭȦ",
["Draw Circle around enemy Minions"] = "՚֐׽СҸʏۭȦ",
["Draw Circle around jungle Minions"] = "՚ҰږʏۭȦ",
["Draw Line for MinionAttacks"] = "ДʾСҸ٥ָܷʾП",
["Log Funcs"] = "ɕ־٦Ŝ",
["Irelia Fun House 2.0"] = "ʕʋۏܯ2.0 - Ьɰr櫢,
["R Lane Clear toggle"] = "RȥПȐۻ",
["Force E"] = "ǿ׆E",
["Q on killable minion to reach enemy"] = "הࠉܷɱքСҸʹԃQӔͻ޸֐ɋ",
["Use Q only as gap closer"] = "޶ͻ޸ʱʹԃQ",
["Minimum distance for use Q"] = "ʹԃQքخСߠk",
["Save E for stun"] = "ѣ´Eԃ4ѣՎ",
["Use E for slow if enemy run away"] = "ɧڻ֐ɋ͓ƜʹԃE4ݵ̙",
["Use E for interrupt enemy dangerous spells"] = "ʹԃEղ׏֐ɋքΣЕܼŜ",
["Anti-gapclosers with E stun"] = "ʹԃEѣՎ4״ͻ޸",
["Use R on sbtw combo"] = "ֻ՚l֐אʹԃR",
["Cast R when our HP less than"] = "ձţքʺļֵ֍Ԛ%ʱʹԃR",
["Cast R when enemy HP less than"] = "ձ֐ɋʺļֵ֍Ԛ%ʱʹԃR",
["Block R in sbtw until Sheen/Tri Ready"] = "ǁҎRֱսҫڢЧڻߍѷ",
["In Team Fight, use R as AOE"] = "՚΅սאʹԃRղAOE",
["Use Bladesurge (Q) on minions"] = "הСҸʹԃQ",
["Use Bladesurge (Q) on target"] = "הĿҪʹԃQ",
["Use Equilibrium Strike (W)"] = "ʹԃW",
["Use Equilibrium Strike (E)"] = "ʹԃE",
["Use Bladesurge (Q)"] = "ʹԃQ",
["Use Transcendent Blades (R)"] = "ʹԃR",
["Only Q minions that can't be AA"] = "ֻהһŜƽAքСҸʹԃQ",
["Block Q on Jungle unless can reset"] = "ǁҎQֱսҰږࠉӔѻQܷɱ",
["Block Q on minions under enemy tower"] = "՚֐׽̾ЂʱǁҎQ",
["Humanizer delay between Q (ms)"] = "Q֮ݤքŢɋۯғԙ(ہī)",
["Use Hiten Style (W)"] = "ʹԃW",
["No. of minions to use R"] = "ʹԃRքخʙСҸ˽",
["Maximum distance for Q in Last Hit"] = "ʹԃQβնքخճߠk",
["E Color"] = "EПȦքҕɫ",
["Auto Ignite"] = "֣ؔ֯ȼ",
["Automatically Use Ignite"] = "ؔ֯ʹԃ֣ȼ",
----------------ʕʋϹؓ---------------------
["Lee Sin Fun House 2.0"] = "ʕʋۏܯ2.0 - äɮ",
["Lee Sin Fun House"] = "ʕʋäɮ",
["Ward Jump Key"] = "ľқдݼ",
["Insec Key"] = "ܘѽ͟дݼ",
["Jungle Steal Key"] = "Ȁºдݼ",
["Insta R on target"] = "bܴהĿҪʹԃR",
["Disable R KS in combo 4 sec"] = "՚4īŚژҕԃRȀɋͷ",
["Combo W->R KS (override autokill)"] = "W->RȀɋͷl֐",
["Passive AA Spell Weave"] = "ܼŜ֮ݤЎޓѻ֯ƽA",
["Smart"] = "ֻŜ",
["Quick"] = "̙ࠬ",
["Use Stars Combo: RQQ"] = "ʹԃķчl֐úRQQ",
["Use Q-Smite for minion block"] = "ԐСҸղסʱʹԃQԍޤ",
["Use W on Combo"] = "՚l֐אʹԃW",
["Use wards if necessary (gap closer)"] = "ʹԃWͻ޸֐ɋ(ɧڻҘҪ)",
["Cast R when it knockups at least"] = "ɧڻŜܷ؉xٶ֐ɋʹԃR",
["Cast W to Mega Kick position"] = "ʹԃW4֒Ŝ͟נٶ֐ɋքλ׃",
["Use R to stop enemy dangerous spells"] = "ʹԃR4ղ׏֐ɋքΣЕܼŜ",
["-- ADVANCED --"] = "-- ٟܶʨ׃ --",
["Combo-Insec value Target"] = "ܘѽ͟ĿҪ",
["Combo-Insec with flash"] = "ʹԃRʁܘѽ͟",
["Insec"] = "ܘѽ͟",
["Use R-flash if no W or wards"] = "ɧڻûԐWܲ֟ûԐқʹԃRʁ",
["Use W-R-flash if Q cd (BETA)"] = "ɧڻQcdʹԃW-Rʁ(Ӣ˔)",
["Insec Mode"] = "ܘѽ͟ģʽ",
["R Angle Variance"] = "Rքއ׈ַֻ",
["KS Enabled"] = "ǴԃȀɋͷ",
["Autokill Under Tower"] = "՚̾Ђܷؔ֯ɱ",
["Autokill Q2"] = "ʹԃ׾׎Qܷؔ֯ɱ",
["Autokill R"] = "ʹԃRܷؔ֯ɱ",
["Autokill Ignite"] = "ʹԃ֣ȼܷؔ֯ɱ",
["--- LANE CLEAR ---"] = "--- ȥП ---",
["LaneClear Sonic Wave (Q)"] = "ʹԃQȥП",
["LaneClear Safeguard (W)"] = "ʹԃWȥП",
["LaneClear Tempest (E)"] = "ʹԃEȥП",
["LaneClear Tiamat Item"] = "ʹԃ҇͡í͘ȥП",
["LaneClear Energy %"] = "ȥПŜ࠘׆%",
["--- JUNGLE CLEAR ---"] = "--- ȥҰ ---",
["Jungle Sonic Wave (Q)"] = "ʹԃQȥҰ",
["Jungle Safeguard (W)"] = "ʹԃWȥҰ",
["Jungle Tempest (E)"] = "ʹԃEȥҰ",
["Jungle Tiamat Item"] = "ʹԃ҇͡í͘ȥҰ",
["Use E if AA on cooldown"] = "ʹԃEט׃Ǖ٥",
["Use Q for harass"] = "ʹԃһ׎QɧɅ",
["Use Q2 for harass"] = "ʹԃ׾׎QɧɅ",
["Use W for retreat after Q2+E"] = "׾׎Q+E۳ʹԃWӷ΋",
["Use E for harass"] = "ʹԃEܼŜɧɅ",
["-- Spells Range --"] = "-- ܼŜ׶ΧПȦ --",
["Draw W range"] = "ДʾW׶Χ",
["W color"] = "WܼŜПȦҕɫ",
["Draw E range"] = "ДʾEܼŜ׶Χ",
["Combat Draws"] = "Дʾսַ",
["Insec direction & selected points"] = "ܘѽ͟ք֣֘&ѡ֨ք֣֘",
["Collision & direction for direct R"] = "ƶײ&ֱПRք׽в",
["Draw non-Collision R direction"] = "ДʾϞƶײքRք׽в",
["Collision & direction Prediction"] = "ƶײ&׽вԤƐ",
["Draw Damage"] = "Дʾʋڦ",
["Draw Kill Text"] = "Дʾܷɱ͡ʾ",
["Debug"] = "ַ˔",
["Focus Selected Target"] = "̸֨ѡձքĿҪ",
["Always"] = "؜ˇ",
["Auto Kill"] = "ܷؔ֯ɱ",
["Insec Wardjump Range Reduction"] = "ܘѽ͟ľқ׶Χݵʙ",
["Magnetic Wards"] = "Յєӥқ",
["Enable Magnetic Wards Draw"] = "ǴԃՅєӥқДʾ",
["Use lfc"] = "ʹԃlfc",
["--- Spots to be Displayed ---"] = "--- Дʾքӥқ֣ ---",
["Normal Spots"] = "Ǖ֣ͨ֘",
["Situational Spots"] = "ȡ߶Ԛȩ࠶ք֣֘",
["Safe Spots"] = "вȫ֣֘",
["--- Spots to be Auto Casted ---"] = "--- ؔ֯ӥқք֣֘ ---",
["Disable quickcast/smartcast on items"] = "޻ԃ̙ࠬ/ׇŜʹԃϯƷ",
["--- Possible Keys for Trigger ---"] = "--- ࠉŜԥעքдݼ ---",

-----------------------------------------------ʢʢںۯҭ----------------------------------------
["FH: http://funhouse.me"] = "",
-------------------------------------------------Ӂճɰ׻------------------------------------------
["Forbidden Ezreal by Da Vinci"] = "Ӂճɰ׻",
["Ezreal - Target Selector Settings"] = "ĿҪѡձǷʨ׃",
["Ezreal - General Settings"] = "һѣʨ׃",
["Ezreal - Combo Settings"] = "ةۏʨ׃",
["Ezreal - Harass Settings"] = "ɧɅʨ׃",
["Ezreal - LaneClear Settings"] = "ȥПʨ׃",
["Ezreal - LastHit Settings"] = "خ۳һܷʨ׃",
["Ezreal - JungleClear Settings"] = "ȥҰʨ׃",
["Ezreal - KillSteal Settings"] = "ɱɋʨ׃",
["Ezreal - Auto Settings"] = "ؔ֯ʨ׃",
["Ezreal - Keys Settings"] = "дݼʨ׃",
["Draw circle on target"] = "ţӂ",
["Draw circle for range"] = "݌Ѹӂ",
["Overkill % for Dmg Predict"] = "ރֽԤӢљؖ҈",
["Use Q"] = "ʹԃQ",
["Use W"] = "ʹԃW",
["Use R If Enemise >="] = "ճԚֈԚנʙɋʹԃR",
["Min. Mana Percent"] = "љؖ҈֮۳һʹԃܼŜ",
["Use Ignite"] = "ʹԃ֣ȼ",
["Use R"] = "ʹԃR",
["Always"] = "؜ˇ",
["Smart"] = "ׇŜ",
["Never"] = "߸һ",
["Key Down"] = "Կԗ",
["Key Toggle"] = "ԿԗȐۻ",
["Use E to Evade"] = "ؔ֯ʹԃE޸ѐףҜ",
["Use main keys from your Orbwalker"] = "ʹԃޅѾࠬޝݼ",
["Harass(Toggle)"] = "ɧɅèȐۻé",
["Assisted Ultimate(Near Mouse)"] = "ޡޓ޼ţք˳Ҫ",
["Parameter mode"] = "ӎ˽ģʽ",
["Quality"] = "׊",
["Width "] = "࠭׈",
["Color "] = "ҕɫ",
["Enable"] = "ʹԃ",
------------------------------------------------------------VN-----------------------------------------
["AmberCarries - Vayne"] = "AmberCarries-VNʢʢںۯ",
["[Vayne] - Combo Settings (SBTW)"] = "l֐ʨ׃",
["[Vayne] - Wall Tumble Settings"] = "׭ڶʨ׃",
["[Vayne] - Harass Settings"] = "ɧɅʨ׃",
["[Vayne] - Lane Clear Settings"] = "ȥПʨ׃",
["[Vayne] - Spell Settings"] = "ܼŜʨ׃",
["[Vayne] - Towe Dive Settings"] = "ĘĜʨ׃",
["[Vayne] - KillSteal Settings"] = "ɱ֐ʨ׃",
["[Vayne] - Gap Closer Settings"] = "ߠkʨ׃",
["[Vayne] - Interupte Spell Settings"] = "лۄʨ׃",
["[Vayne] - Item Settings"] = "ЮĿʨ׃",
["[Vayne] - Auto Buy Settings"] = "ؔ֯ʨ׃",
["[Vayne] - Draw Settings"] = "ȦȦʨ׃",
["[Vayne] - OrbWalk Settings (SBTW)"] = "؟߳ʨ׃",
["Combo Key"] = "ةۏݼ",
["Use (Q) in combo"] = "ʹԃQ",
["Use (E) in combo"] = "ʹԃE",
["Use (R) in combo"] = "ʹԃR",
["Wall Tumble Key"] = "׭ڶݼ",
["Use (Q) in Harass"] = "ʹԃQɧɅ",
["Lane Clear Key"] = "ȥП",
["Use (Q) in Lane Clear"] = "ʹԃQȥП",
["If my mana > X%"] = "ħרճԚנʙʹԃ",
["(E) Settings"] = "Eʨ׃",
["(Q) Settings"] = "Qʨ׃",
["(R) Settings"] = "Rʨ׃",
["Use (Q) for:"] = "ʹԃQ",
["Use (Q) for Kite "] = "ʹԃQا󝢬
["Max Range to Enemy for Kite"] = "خճ׶Χքا󝢬
["Force (Q) if unit not in AA Range"] = "èQéԶ֐ɋƽA׶Χ",
["Use (E) for:"] = "ʹԃE",
["Stun Chance"] = "Վѣܺܡ",
["Auto Stun"] = "ܷؔ֯Վ",
["Max Wall Range For Stunt "] = "خճ׶ΧքǽҚ",
["Use (R) for:"] = "ʹԃR",
["Target life < %"] = "ĿҪСԚנʙѪʹԃ",
["My life > %"] = "ϒСԚנʙѪʹԃ",
["Minimum Enemi in Range:"] = "՚ߠkخ޼ք֐ɋ",
["Range:"] = "׶Χ",
["Keep Invisibily"] = "ѣԖ",
["ֻԐخޓ޼ք֐ɋ"] = "خޓ޼ք֐ɋ",
["Range"] = "׶Χ",
["Only if Ally is under tower"] = "̾Ђքדԑ",
["Force use if enemy HP < %"] = "ɧڻ֐ɋʙԚHP%",
["Use (Q) for Tower Dive"] = "ʹԃQ͸",
["Use KillSteal"] = "ʹԃܼŜɱ֐",
["Use (E) in KillSteal"] = "ʹԃEɱ֐",
["Use Bilgewater Cutlass"] = "ʹԃΤն",
["Use BORTK"] = "ʹԃ ʢʢ",
["Use Youmus"] = "ʹԃ",
["Use Quicksilver Sash"] = "ʹԃˮӸ",
["Use Mercurial Scimitar"] = "ʹԃˮӸΤն",
["Humanizer Delay (ms)"] = "ɋϯғԙèہīé",
["Bush Revealer - Trinket ( blue/green)"] = "ˎƷè6ɫ/Ìɫé",
["Auto Buy Startup Item"] = "Ǵ֯ؔ֯ٺòЮĿ",
["Doran's Potion"] = "һ֪րʲôűˎƷ",
["Blue Trinket"] = "6ɫˎƷ",
["Green Trinket"] = "ÌɫˎƷ",
["Draw (Q) type:"] = "ۭQ`э",
["Draw (E) Range"] = "ۭE`э",
["Draw Sprite on Target"] = "՚ĿҪʏܦ׆",
["Draw (E) Predict on unit"] = "ԤӢèEéեλ",
["Draw Damage"] = "ӽǰ̰۵",
["Drwa WallTumble Citcle"] = "ڶԲȦ",
["SAC Detected & Loaded"] = "ʹԃۍݓ՘SACքࠢ",
---------------------------ւ3τ--------------
["AmberCarries - Draven"] = "AC-ւ3τ",
["[Draven] - Combo Settings"] = "ةۏʨ׃",
["[Draven] - Harass Settings"] = "ɧɅʨ׃",
["[Draven] - Lane Clear Settings"] = "ȥПʨ׃",
["[Draven] - Spells Settings"] = "ħרʨ׃",
["[Draven] - Gap Closer Settings"] = "ϸޚʨ׃",
["[Draven] -  Item Settings"] = "ЮĿʨ׃",
["[Draven] -  Auto Buy Settings"] = "ؔ֯ٺòʨ׃",
["[Draven] - Draw Settings"] = "ДʾȦȦʨ׃",
["[Draven] - OrbWalk Settings"] = "؟߳ࠢʨ׃",
["Use (W) in combo"] = "ʹԃWةۏ",
["Use (Q) in harass"] = "ʹԃQɧɅ",
["Use (W) in harass"] = "ʹԃWɧɅ",
["Lane Clear Key"] = "ȥП",
["Use (Q) in lane clear"] = "ʹԃQȥП",
["How Many Axe:"] = "נʙثͷ",
["[Draven] - (Q) Spells Settings"] = "Qħרʨ׃",
["[Draven] - (W) Spells Settings"] = "Wħרʨ׃",
["[Draven] - (E) Spells Settings"] = "Eħרʨ׃",
["[Draven] - (R) Spells Settings"] = "Rħרʨ׃",
["Auto Catch Axe:"] = "ؔ֯ݱث",
["Range Area:"] = "ߠkȸԲ",
["If ToHero Choose"] = "ɧڻהӢћѡձ",
["Auto Catch Axes (ToHero)"] = "ؔ֯Ҷ׽סèהӢћé",
["Block if unit Killable"] = "ܷɱեԪࠩ",
["With x AutoAttack:"] = "X٥ܷ",
["Use (W) for reach Axe:"] = "ʹԃWȥݱثͷ",
["Use (W) If closest Unit"] = "ʹԃWɧڻClosest",
["Use (W) if Unit not in range"] = "ثͷԔһսքʱ۲ʹԃW",
["Min Range:"] = "ϒք׶Χ",
["Max Range:"] = "خճ׶Χ",
["Mana >X%"] = "רfճԚֈԚ",
["Auto Buy Startup Item"] = "ؔ֯ٺòǴ֯ЮĿ",
["Doran's Blade"] = "נ<֮ݣ",
["Health Potion"] = "ѣݡҩˮ",
["Blue Trinket"] = "6ɫˎƷ",
["Green Trinket"] = "ÌɫˎƷ",
["Draw (Q) Area"] = "ۭQքȸԲ",
["Draw Axe"] = "ۭثͷ",
["Draw Sprite on Target"] = "՚ĿҪʏܦ׆ڬܣ",
---------ۻش------
["Sida's Auto Carry: Vayne"] = "טʺVNب׺",
["p_skinChanger"] = "ۻشޅѾ",
["Save Skin"] = "ѣզʨ׃",
["Change Skin "] = "Ǵ֯ۻش",
["Selected Skin"] = "Ƥشѡձ",
-------------FBճ-˹(WizDomںۯ)------------------
["Viktor Madness by Da Vinci"] = "FBճ-˹-WizDomںۯ-Ⱥ204587984",
["Viktor - Target Selector Settings"] = "ĿҪѡձǷʨ׃",
["Draw circle on Target"] = "ДʾĿҪȦ",
["Draw circle for Range"] = "ДʾĿҪ׶Χ",
["Viktor - General Settings"] = "һѣʨ׃èҰ֯é",
["Developer Mode"]="Ұߪ",
["Viktor - Combo Settings"] = "l֐ʨ׃",
["Viktor - Harass Settings"] = "ɧɅʨ׃",
["Viktor - LaneClear Settings"] = "ȥПʨ׃",
["Viktor - LastHit Settings"] = "خ۳һܷʨ׃",
["Viktor - JungleClear Settings"] = "ȥҰʨ׃",
["Viktor - KillSteal Settings"] = "ܷɱʨ׃",
["Viktor - Auto Settings"] = "һԃڜ",
["Viktor - Keys Settings"] = "дݼʨ׃", 
["Min. Mana Percent:"] = "خʙһʹԃܼŜ6",
["Less E Range"]= "ݵʙE׶Χ",
["AutoFlow with R"] = "ؔ֯ٺ̦ճ֐",
["Viktor - Drawing Settings"]="άࠋΐПȦʨ׃",
["Damage Calculation Bar"]="ʋڦ݆̣Дʾ",
["Text if Killable with R"]="Дʾࠉճ֐ܷɱ͡ʾ",
["Harass (Toggle)"]="ɧɅģʽȐۻ",
--------ʕʋݣܧ------
["MasterYi"] = "ʩר",
["Use  Hunters Potion"] = "ʹԃҩ݁",
["is on your Screen"] = "՚ţքǁĻʏ",
["Orbwalk Settings"] = "؟߳ʨ׃",
["Written by: burn & ikita - Fun House Team"] = "ط֟úϒһ٦̟ţ",
["FH. burn & ikita"] = "ʕʋط֟úţӂ",
["Use Lunge  (Q)"] = "ԃՌèQé",
["Use Riposte  (W)  [only on Jungle]"] = "ʹԃ۹ܷèWé[ֻ՚ղҰ]",
["Use Bladework  (E)"] = "ʹԃE",
["FH: burn & ikita"] = "ʕʋط֟úţӂ",
----------------ٲ󡭭----------------------
["Ralphlol's Tahm Kench"] = "Ralphlolٲ󡢬
["Combo Settings"] = "l֐ʨ׃",
["Use Q combo if mana is above"] = "ʹԃQl֐ɧڻħרֵٟԚ",
["Use Q in Combo"] = "ʹԃQԚl֐",
["Eat enemy champions"] = "Ԕִ֐ɋ",
["Harass Settings"] = "ɧɅʨ׃",
["Use Q harass if mana is above"] = "ɧڻ6ٟԚʨ֨ԃQɧɅ",
["Use Q in Combo"] = "՚l֐ʱԃQ",
["Eat enemy champions"] = "Ԕִ֐ɋ",
["W Save"] = "Wѣզ",
["Enabled"] = "Ǵԃ",
["Use low life rescue"] = "ʹԃԅۯПȦ",
["General Settings"] = "ͨԃʨ׃",
["Focus Selected Target"] = "ǿѡѡאĿҪ",
["Target Mode:"] = "ĿҪģʽ",
["Prediction Method:"] = "ԤƐ׽ʽ",
["Draw Settings"] = "ۭĦʨ֨",
["Disable All Range Draws"] = "ȡл̹ԐȦ",
["Draw Circle on Target"] = "՚ĿҪʏۭȦ",
["Draw AA Range"] = "ۭ٥ܷ׶Χ",
["Draw My Hitbox"] = "ۭԶϒքλ׃",
["Draw (Q) Range"] = "ۭQ׶Χ",
["Draw (W) Range"] = "ۭW׶Χ",
["Draw (R) Range"] = "ۭR׶Χ",
["Orbwalking Settings"] = "؟߳ʨ֨",
["Keybindings"] = "дݼѳ֨",
["Full Combo Key (SBTW)"] = "l֐",
["Harass Key"] = "ɧɅдݼ",
["Use on Annie Ult"] = "ʹԃвŝճ֐",
[" Enable"] = "Ǵԃ",
[" Health % < "] = "Ѫ % <",
["General-Settings"] = "һѣʨ׃",
["Orbwalker Enabled"] = "؟߳Ǵԃ",
["Stop Move when Mouse above Hero"] = "ձ˳ҪӬڽӢћʱֹͣӆ֯",
["Range to Stop Move"] = "׶Χֹͣӆ֯",
["Focus Selected Target"] = "ܯܰѡ֨քĿҪ",
["Orbwalker Modus: "] = "؟߳ģʽ",
["Humanizer-Settings"] = "ɋєۯʨ׃",
["Limit Move-Commands per Second"] = "ÿīО׆ӆ֯ļ®",
["Max Move-Commands per Second"] = "ÿīخճӆ֯ļ®",
["Key-Settings"] = "дݼʨ׃",
["FightMode"] = "սַģʽ",
["HarassMode"] = "лۄģʽ",
["LaneClear"] = "ȥП",
["LastHit"] = "ҹն",
["Toggle-Settings"] = "ߪژʨ׃",
["Make FightMode as Toggle"] = "սַģʽߪژ",
["Make HarassMode as Toggle"] = "лۄģʽߪژ",
["Make LaneClear as Toggle"] = "ȥПģʽߪژ",
["Make LastHit as Toggle"] = "սַģʽߪژ",
["Farm-Settings"] = "ղǮʨ׃",
["Focus Farm over Harass"] = "ԅЈղǮ՚лۄ",
["Extra-Delay to LastHit"] = "׮΢քҹնғԙ", 
["Mastery-Settings"] = "ͬسʨ׃",
["Mastery: Butcher"] = "΀ز",
["Mastery: Arcane Blade"] = "т˵֮ɐ",
["Mastery: Havoc"] = "ۆޙ",
["Mastery: Devastating Strikes"] = "ܙİղܷ",
["Draw-Settings"] = "Дʾʨ׃",
["Draw Own AA Range"] = "ۭؔܺք٥ܷ׶Χ",
["Draw Enemy AA Range"] = "ۭ֐ɋք٥ܷ׶Χ",
["Draw LastHit-Cirlce around Minions"] = "ҹնȦ",
["Draw LastHit-Line on Minions"] = "ҹնП",
["Color-Settings"] = "ҕɫʨ֨",
["Color Own AA Range: "] = "ؔܺƽAҕɫ",
["TargetSelector"] = "ĿҪѡձ",
["Priority Settings"] = "ԅЈܶʨ֨",
["Focus Selected Target: "] = "ǿ׆ĿҪѡձ",
["TargetSelector Mode: "] = "ѡձģʽ",
["Annie"] = "вŝ",
["Highest Priority (ADC) is Number 1!"] = "ADC",
["Debug-Settings"] = "ַ˔ʨ֨",
------------------------BIOZEDޙ------------------------
["Zed - Target Selector Settings"] = "ĿҪѡձ",
["SimpleLib - Orbwalk Manager"] = "؟߳ѡձ",
["BioZed Reborn by Da Vinci"] = "BioZed",
["BioZed Reborn by Da Vinci Loaded,Have Fun:)!"] = "Bioޙ",
["SimpleLib - Spell Manager"] = "ܼŜڜm",
["SxoOrbWalk"] = "؟߳ѡձ",
["Zed - Auto Settings"] = "ؔ֯ʨ׃",
["Zed - Drawing Settings"] = "Дʾʨ׃",
["Zed - Key Settings"] = "дݼʨ׃",
["Zed - KillSteal Settings"] = "ܷɱʨ׃",
["Zed - LastHit Settings"] = "ҹҸʨ׃",
["Zed - JungleClear Settings"] = "ȥҰʨ׃",
["Zed - LaneClear Settings"] = "ȥҸʨ׃",
["Zed - Harass Settings"] = "ɧɅʨ׃",
["Zed - Combo Settings"] = "l֐ʨ׃",
["Zed - LaneClear Settings"] = "ȥҸʨ׃",
["Zed - General Settings"] = "ӣڦʨ׃",
["Zed - Terget Selector Settings"] = "ĿҪʨ׃",
["Don't use R On"] = "һʹԃճ֐הг",
["Use W on Combo without R"] = "ûԐRߍԃW",
["Use W on Combo with R"] = "ʹԃW՚l֐(W Rһǰ؅)",
["Use E"] = "ʹԃ E",
["Use Q"] = "ʹԃ Q",
["Use R"] = "ʹԃ R",
["Swap to W/R to gap close"] = "ݻۻӰؓλ׃ޓ޼֐ɋ",
["Combo with R (RWEQ)"] = "l֐ (RWEQ)",
[" -> Parameter mode:"] = "ӎ˽ģʽ:",
["Combo without R (WEQ)"] = "l֐ (WEQ)",
["Harass (QWE or QE)"] = "ɧɅ(QWE ۍ QE)",
["Harass (QWE)"] = "ɧɅ(QWE)",
["WQE (ON) or QE (OFF) Harass"] = "ߪ(WQE)  ژ(QE)",
["LaneClear or JungleClear"] = "ȥҸۍȥҰ",
["LastHit"] = "ҹҸβն",
["Run"] = "һݼW",
["Switcher for Combo"] = "Ȑۻl֐",
["Switcher for Combo Mode"] = "Ȑۻl֐ģʽ",
["Don't cast spells before "] = "R֮ǰһҪ؅ܼŜ",
["Use Ignite"] = "ʹԃ ֣ȼ",
["Use W"] = "ʹԃ W",
["Use Q If Hit >= "] = "ʹԃQҹҸ",
["Use W If Hit >= "] = "ʹԃWҹҸ",
["Use E If Hit >= "] = "ʹԃEҹҸ",
["Min.Energy Percent:"] = "ԃܼŜҹҸŜ࠘׆:",
["Circle For W Shadow"] = "ДʾWքӰؓПȦ",
["Circle For R Shadow"] = "ДʾRքӰؓПȦ",
["Text when Passive Ready"] = "τѾДʾѻ֯dȴ",
["Text on Shadows (W or R)"] = "τѾДʾ(W ܲ R)",
["Swap to W/R if my HP % <=15"] = "ݻۻӰؓλ׃ ɧڻϒքHP֍Ԛљ֮ؖ15",
["Swap W/R if target dead"] = "Ŝɱ̀ĿҪؔ֯R/W׵ܘ",
["Use Items"] = "ʹԃϯƷ",
["R Mode"] = "ճ֐ģʽ",
["Swap to W/R to gap close"] = "ԐĿҪ՚ӰؓלΧؔ֯Ȑۻͻ޸",
["Use R To Evade"] = "ʹԃR4ףҜ",
["Use W To Evade"] = "ʹԃW4ףҜ",
["Use Auto Q"] = "ʹԃؔ֯Q",
["Use Auto E"] = "ʹԃؔ֯E",
["Use R1 to Evade"] = "ʹԃߪճףҜ",
["Use R2 to Evade"] = "ʹԃRӰؓȐۻףҜ",
["Use W1 to Evade"] = "ʹԃߪWףҜ",
["Use W2 to Evade"] = "ʹԃWӰؓȐۻףҜ",
["Check collision before casting q "] = "ݬөƶײՙQ",
["Min. Energy Percent:"] = "خСŜ%",
-----------------------------------BIGӢʶ -----------------------------
["[Voice Settings]"] = "ԯӴʨ׃",
["[Incoming Enemys to Track]"] = "GANK͡ʾ",
["[CD Tracker]"] = "CDДʾ",
["[Wards to Track]"] = "қλ݆ʱ",
["[Recall Tracker]"] = "ܘԇ׷ؙ",
["[BaseUlt]"] = "ؔ֯ճ֐",
["[Tower Range]"] = "؀Թ̾׶Χ",
["[Jungle Timers]"] = "Ұږ݆ʱ",
["[Enemies Hud]"] = "֐ɋͼҪ",
["[Thresh Lantern]"] = "Ըʯֆ½",
["[Anti CC]"] = "ؔ֯ޢ࠘",
["[Misc]"] = "ՓЮʨ׃",
["[Champion Scripts]"] = "ӢћޅѾ",
["Patch"] = "ӢћjċѦѾ",
["BIG FAT HEV - MARK IV"] = "BIGӢʶ",
["by Big Fat Team"] = "",
["Volume"] = "ӴճС",
["Welcome"] = "۶ӭхϢ",
["Danger!"] = "ΣЕ",
["Shutdown"] = "ژҕ",
["SummonerSpells"] = "֙۽ʦܼŜ",
["WinLose sounds"] = "ˤӮʹӴ",
["Kill Announcer"] = "ܷɱҥӴ",
["Shrooms Announcement"] = "͡ĪĢٽעЖ͡ё",
["Smite Announcement"] = "ʋڦ͡ё",
["JungleTimers Announcement"] = "Ұږ݆ʱ͡ё",
["ON/OFF"] = "ߪ/ژ",
["Allow this option"] = "ՊѭՋѡЮ",
["Scan Range"] = "ɨĨ׶Χ",
["Draw minimap"] = "Дʾ֘ͼ",
["Use Danger Sprite"] = "ʹԃΣЕ͡ё",
["Show waypoints"] = "Дʾ·޶",
["Enable Voice System"] = "ǴԃԯӴϵͳ",
["Use Wards Tracker"] = "ʹԃқλ݆ʱ",
["Use Circles"] = "ʹԃПȦ",
["Use Text"] = "ʹԃτѾ",
["Use Sprites"] = "ʹԃͼƬࠢ",
["Use Recall Tracker"] = "ʹԃܘԇٺؙǷ",
["Print Finished and Cancelled Recalls"] = "سЂއДʾ֐ɋȡлܘԌ",
["[Team BaseUlt Friends]"] = "΅דܹ֘ճ֐דԑ",
["Use BaseUlt"] = "ʹԃܹ֘ճ֐",
["Print BaseUlt alert in chat"] = "՚ͬӋեˤԶܹ֘ճ֐͡ё",
["Draw BaseUlt Hud"] = "Дʾܹ֘ճ֐̬֯",
["Use Tower Ranges"] = "ʹԃ̾׶Χ",
["Show only close"] = "޶Дʾ̸֨",
["Show ally turrets"] = "Дʾċԑƚ̾",
["Show turret view"] = "Дʾƚ̾˓ͼ",
["Circle Quality"] = "ПȦ׊",
["Circle Width"] = "ПȦ࠭ո",
["Jungle Disrespect Tracker(FOW)"] = "ҰȸݬӢ èսֹĔϭé",
["(DEV) try to detect more"] = "Ӣ˔ݬӢټנ",
["Enable Jungle Timers!!! Finally ^^"] = "ʹՔ݆ʱǷ!!!خ۳",
["Sounds for Drake and Baron"] = "СºۍճºքʹӴϵͳ",
["Enable enemies hud"] = "ߪǴ֐ɋӋեͼҪ",
["Hud Style"] = "Ӌեاٱ",
["Hud Mode"] = "Ӌեģʽ",
["Hud X"] = "X ظҪ",
["Hud Y"] = "Y ظҪ",
["HudX and HudY dont work for Old one"] = "X YظҪһ٤طá",
["Use Nearest Lantern"] = "ʹԃخ޼քֆ½",
["Auto Use if HP < %"] = "֣ؔ֯քHPخСљؖ҈",
["[BuffTypes]"] = "Buff`э",
["[TeamMates for Mikael]"] = "ѣۤדԑ",
["Enable AntiCC"] = "ߪǴؔ֯ޢ࠘",
["Enable Mikael for teammates"] = "ΪדԑǴԃىڸ",
["It will use Cleanse, Dervish Blade, Quicksilver Sash, "] = "̼ܡʹԃˮӸϸոb޻ۯbˮӸն",
["Mercurial Scimitar or Mikael's Crucible."] = "ˮӡΤնۍܡܶ.",
["could be only removed by QSS"] = "ޭ࠘á",
["Draw Exp Circle"] = "ۭԶ Exp քԲȦ",
["Extra Awareness"] = "׮΢ք",
["Use CD Tracker"] = "ДʾCD",
["Key settings"] = "дݼ",
["Big Fat Gosu"] = "BIGݓ՘Ƿ",
["Load Big Fat Mark IV"] = "ݓ՘BigӢʶ",
["Load Big Fat Evade"] = "ݓ՘BIGףҜ",
["Sorry, this champion isnt supported yet =("] = "הһǰûԐ֧ԖţʹԃքӢћքӢћޅѾ",
["Big Fat Gosu v. 3.58"] = "BIGݓ՘Ƿ v. 3.58",
["by Big Fat Team"] = "ط֟ Big Fat Team",
["Big Fat Hev - Mark IV"] = "BIGӢʶ",
---------------------HTTFɱ��--------------
["HTTF Riven"] = "HTTF ɱ��
["Combo"] = "l֐",
["Burst Combo Toggle"] = "Ѭעl֐ߪژ",
[""] = "",
["Use Q"] = "ʹԃ Q",
["Use W"] = "ʹԃ W",
["Use E"] = "ʹԃ E",
["Use Flash in Burst Combo"] = "ʹԃʁЖѬעl֐",
["Ulti"] = "ճ֐",
["Activate R Mode"] = "ܤܮRģʽ",
["Combo - The number of QAA"] = "l֐ - QA˽",
["Cast R Mode"] = "ˍ؅Rģʽ",
["Combo - The number of QAA"] = "l֐ - QA˽",
["Save First Q before AA (T)"] = "ѣզQ՚Ǖ٥֮ǰ",
["Use EQ (T)"] = "ʹԃEQ (T)",
["Save E before W (F)"] = "ѣզE՚W֮ǰ",
["Use Item"] = "ʹԃրߟ",
["Harass"] = "лۄ",
["Kill Steal"] = "Ȁɋͷ",
["Activate R"] = "ܤܮR",
["Cast R"] = "ˍ؅R",
["Clear"] = "ȥП",
["Lane Clear"] = "ȥП",
["Save First Q even if Last Hit (T)"] = "ѣզQҹն",
["Use EQ (F)"] = "ʹԃEQ",
["Save E before W (F)"] = "ѣզE՚W֮ǰ",
["Jungle Clear"] = "ȥҰ",
["LastHit"] = "ҹն",
["Auto"] = "ؔ֯",
["Use W Min Count"] = "ʹԃWخС˽",
["Flee"] = "͓Ɯ",
["Wall Jump"] = "͸ǽ",
["Use Wall Jump"] = "ʹԃ͸ǽ",
["Misc"] = "׮΢",
["Use Animation Cancel"] = "ʹԃ۳ҡȡл",
["Cancel Type"] = "ȡл`э",
["Auto Cancel Q for manual QAA (F)"] = "ؔ֯ȡлQ۳ҡ",
["Cast E even if enemy is so closed (F)"] = "ܴʹ͹؅֐ɋҲˍ؅E",
["Combo - Attack selected target (T)"] = "l֐ - ٥ܷѡձĿҪ (T)",
["Combo - Select range (900)"] = "l֐ - ѡձ׶Χ (900)",
["Burst - Attack selected Target (T)"] = "Ѭע - ٥ܷѡձĿҪ (T)",
["Burst - Select range (1200)"] = "Ѭע - ѡձ׶Χ (1200)",
["Humanizer"] = "ɋєۯ",
["Q Cancel time offset"] = "Qȡлʱݤ֖л",
["Buffer between AA dmg and Spell"] = "ۺԥǕ٥ʋڦۍר˵ʋڦ",
["Buffer between AA dmg and move"] = "Ǖ٥ԫӆ֮֯ݤۺԥ",
["Moving interval"] = "ӆ֯ݤٴ",
["Stop moving over mouse"] = "ֹͣӆ֯˳Ҫ",
["Draw Settings"] = "ДʾѡЮ",
["Draw"] = "Дʾ",
["Draw Lag free circles"] = "ʹԃԅۯПȦ",
["Draw Hitchance"] = "ДʾѪֵ",
["Draw Target"] = "ДʾĿҪ",
["Draw Attack range"] = "Дʾ٥ܷ׶Χ",
["Draw Q range"] = "ДʾQ׶Χ",
["Draw W range"] = "ДʾW׶Χ",
["Draw E range"] = "ДʾE׶Χ",
["Draw R range"] = "ДʾR׶Χ",
["Draw Combo Damage"] = "Дʾl֐ʋڦ",
["Wall Jump Position"] = "Дʾ͸ǽ֣λ׃",
["Script version: "] = "ޅѾѦѾ: ",
["Target Selector"] = "ĿҪѡձ",
["Target Selector Mode:"] = "ĿҪѡձģʽ:",
-----------------------------ǦĮւ3τ----------------------
["Fantastik Draven"] = "Fantastik-ւ3τ",
["Key Bindings"] = "дݼѳ֨",
["Combo key(Space)"] = "l֐дݼ(ࠕٱ)",
["Farm key(X)"] = "ղǮдݼ(X)",
["Harass key(C)"] = "лۄдݼ(C)",
["Combo Settings"] = "l֐ʨ׃",
["Use Q"] = "ʹԃ Q",
["Use W"] = "ʹԃ W",
["Use E"] = "ʹԃ E",
["Min. % mana for W and E "] = "خСħרֵWۍE ",
["Harass Settings"] = "лۄʨ׃",
["Use Q"] = "ʹԃ Q",
["Use W"] = "ʹԃ W",
["Use E"] = "ʹԃ E",
["Laneclear Settings"] = "ȥПʨ׃",
["Use Q in 'Laneclear'"] = "ʹԃQ",
["Use W in 'Laneclear'"] = "ʹԃW",
["Jungleclear Settings"] = "ȥҰʨ׃",
["Use Q in 'Jungleclear'"] = "ʹԃQ",
["Use W in 'Jungleclear'"] = "ʹԃW ",
["Draw Settings"] = "Дʾʨ׃",
["Draw E range"] = "ДʾE׶Χ",
["Draw Killable targets with R"] = "ДʾܷɱĿҪR",
["Misc"] = "׮΢",
["KillSteal Settings"] = "Ȁɋͷʨ׃",
["Use Ult KS"] = "ʹԃճ֐ Ȁɋͷ",
["Avoid R Overkill"] = "ҜĢRճӄСԃ",
["Ult KS range"] = "ճ֐Ȁɋͷ׶Χ",
["Use Ignite KS"] = "ʹԃ֣ȼȀɋͷ",
["Q Settings"] = "Q ʨ׃",
["Catch axe if only in mouse range"] = "ֻ՚˳Ҫ׶ΧŚޓثͷ",
["Use maximum 2 Axes"] = "ʹԃخճ2ёثͷ",
["Draw mouse range"] = "Дʾ˳Ҫ׶Χ",
["Lag Free circle"] = "ԅۯПȦ",
["Mouse Range"] = "˳Ҫ׶Χ",
["Evadeee Integration(If loaded)"] = "EVףҜɚۏ(ɧڻݓ՘)",
["Don't catch if axe in turret"] = "һҪ՚̾oĦޓثͷ",
["Auto-Interrupt"] = "ؔ֯א׏",
["Enabled"] = "Ǵԃ",
["Anti-Gapclosers"] = "״-ͻ޸",
["Enabled"] = "Ǵԃ",
["Info"] = "хϢ",
["Baseult settings"] = "ܹ֘ճ֐ʨ׃",
["Health Generation prediction"] = "HPԤӢ",
["Disable R"] = "޻ԃR",
["Sensetive Delay(.3 def)"] = "Ĵِғԙ (.3 def)",
["Catch Axes(Z)"] = "ޓثͷ(Z)",
["Use W to reach far Axes"] = "ʹԃWޓߠk҈ޏԶքثͷ",
["Draw Debug"] = "ДʾBUGݬӢģʽ",
["Enable Permabox(reload)"] = "ǴԃԀ߃ېؓ(טт՘ɫ)",
["Left Click target lock"] = "سݼե̸ܷ֨",
["Target Selector"] = "ĿҪѡձ",
["Target Selector Mode:"] = "ĿҪѡձģʽ:",
------------------------------QQQ̷҇-------------------------
["Yasuo - The Windwalker"] = "̷҇ - اѐ֟",
["----- General settings --------------------------"] = "-----һѣʨ׃--------------------------",
["> Keys"] = "> дݼ",
["> Orbwalker"] = "> ؟߳",
["> Targetselector"] = "> ĿҪѡձ",
["> Prediction"] = "> ԤƐ",
["> Draw"] = "> Дʾ",
["> Cooldowntracker"] = "> ܼŜCD",
["> Scripthumanizer"] = "> ޅѾɋєۯ",
["----- Utility settings -----------------------------"] = "-----ʵԃʨ׃-----------------------------",
["> Windwall"] = "> اǽ",
["> Ultimate"] = "> ճ֐",
["> Interrupt"] = "> ղ׏",
["> Turretdive"] = "> Խ̾ǿɱ",
["> Gapclose"] = "> ͻ޸",
["> Walljump"] = "> ͸ǽ",
["> Spells"] = "> ܼŜ",
["> Summonerspells"] = "> ֙۽ʦܼŜ",
["> Items"] = "> րߟ",
["----- Combat settings ----------------------------"] = "-----l֐ʨ׃----------------------------",
["> Combo"] = "> l֐",
["> Harass"] = "> лۄ",
["> Killsteal"] = "> Ȁɋͷ",
["> Lasthit"] = "> ҹն",
["> Laneclear"] = "> ȥП",
["> Jungleclear"] = "> ȥҰ",
["----- About the script ---------------------------"] = "----- ژԚޅѾ ---------------------------",
["Gameregion"] = "ԎϷȸԲ",
["Scriptversion"] = "ޅѾѦѾ",
["Author"] = "ط֟",
["Updated"] = "ʽܶ",
["Choose targetselector mode"] = "ѡձĿҪģʽ",
["Set your priority here:"] = "ʨ׃ţքԅЈܶ:",
["Draw your current target with circle:"] = "ԃԲۭԶţĿǰքĿҪ:",
["Draw your current target with line:"] = "ԃПۭԶţĿǰքĿҪ:",
["Use Gapclose"] = "ʹԃͻ޸",
["Check health before gapclosing under towers"] = "ͻ޸ս̾ЂǰݬөHP",
["Only gapclose if my health > % "] = "ֻͻ޸ɧڻϒքHP > % ",
["> Settings "] = "> ʨ׃ ",
["Set Gapclose range"] = "ʨ֨ͻ޸׶Χ",
["Draw gapclose target"] = "Дʾͻ޸ĿҪ",
["> General settings"] = "> һѣʨ׃",
["Use Autowall: "] = "ʹԃؔ֯ǽ: ",
["Draw skillshots: "] = "ДʾܼŜ8: ",
["> Humanizer settings"] = "> ɋєۯʨ׃",
["Use Humanizer: "] = "ʹԃɋєۯ: ",
["Humanizer level"] = "ɋєۯˮƽ",
["> Autoattack settings"] = "> ؔ֯٥ܷѡձ",
["Block autoattacks: "] = "޻ԃؔ֯٥ܷ: ",
["if your health is below %"] = "ɧڻţքHP֍Ԛ %",
["> Skillshots"] = "> ܼŜ8",
["No supported skillshots found!"] = "ûԐ֧ԖքܼŜעЖ!",
["> Targeted spells"] = "> ֫הܼŜ",
[">> Towerdive settings"] = ">> Խ̾ǿɱʨ׃",
["Towerdive Mode"] = "Խ̾ǿɱģʽ",
["Draw turret range: "] = "Дʾ̾׶Χ: ",
[">> Normal Mode Settings"] = ">> ֽӣģʽʨ׃",
["Min number of ally minions"] = "דԑخСҹն˽",
[">> Easy Mode Settings"] = ">> ݲեģʽʨ׃",
["Min number of ally minions"] = "דԑخСҹն˽",
["Min number of ally champions"] = "خС˽דԑ˽",
["> Info about normal mode"] = "> ֽӣģʽхϢ",
[">| The normal mode checks for x number of ally minions"] = ">| הԚדԑСҸXֽӣģʽݬө",
[">| under enemy turrets. If ally minions >= X then it allows diving!"] = ">| ՚֐ɋ̾Ђɧڻדԑć>= Xղǿɱ!",
["> Info about advanced mode"] = ">Ј޸ģʽхϢ",
[">| The advanced mode checks for x number of ally minions"] = ">| הԚדԑСҸXЈ޸ģʽݬӢ",
[">| as well as for x number of ally champions under enemy turrets."] = ">| ԐנʙדԑքӢћ՚֐ɋƚ̾",
[">| If both >= X then it allows diving!"] = ">| ɧڻ׾ּ֟ˇ!",
["> General settings"] = "> һѣʨ׃",
["Always draw the indicators"] = "؜ˇДʾָʾǷ",
["Only draw while holding"] = "ֻԐ draw while holding",
["Not draw inidicator if pressed"] = "һۭԶָʾɧڻдЂ",
["> Draw cooldowns for:"] = ">ܦ׆dȴʱݤ:",
["your enemies"] = "ţք֐ɋ",
["your allies"] = "ţքדԑ",
["your hero"] = "ţؔܺ",
["> Draw"] = "> Дʾ",
["> General settings"] = "> һѣʨ׃",
["Show horizontal indicators"] = "ДʾˮƽָʾǷ",
["Show vertical indicators"] = "ДʾԹֱָʾǷ",
["Vertical position"] = "Թֱλ׃",
["> Choose your Color"] = "> ѡձţքҕɫ",
["Cooldown color"] = "dȴʱݤҕɫ",
["Ready color"] = "׼Ѹҕɫ",
["Text color"] = "τѾҕɫ",
["Background color"] = "ѳްҕɫ",
["> Summoner Spells"] = "> ֙۽ʦܼŜ",
["Flash"] = "ʁЖ",
["Ghost"] = "ܲƜ",
["Ignite"] = "֣ȼ",
["Barrier"] = "ǁ֏",
["Smite"] = "ԍޤ",
["Exhaust"] = "ѩɵ",
["Heal"] = "׎",
["Teleport"] = "TP",
["Cleanse"] = "޻ۯ",
["Clarity"] = "ȥϺ",
["Clairvoyance"] = "͸˓",
["The Rest"] = "ǤԠք",
[">> Combat keys"] = ">> l֐дݼ",
["Combo key"] = "l֐дݼ",
["Harass key"] = "лۄдݼ",
["Harass (toggle) key"] = "лۄ (ߪژ) дݼ",
["Ultimate (toggle) key"] = "ճ֐ (ߪژ) дݼ",
[">> Farm keys"] = ">> ղǮдݼ",
["Lasthit key"] = "ҹնдݼ",
["Jungle- and laneclear key: "] = "ȥҰۍȥПдݼ: ",
[">> Other keys"] = ">> Ǥ̻дݼ",
["Escape-/Walljump key"] = "͓Ɯ-/͸ǽдݼ",
["Autowall (toggle) key"] = "ؔ֯اǽ (ߪژ) дݼ",
["> General settings"] = "> һѣʨ׃",
["Use walljump"] = "ʹԃ͸ǽ",
["Priority to gain vision"] = "ԅЈܱփ˓Ұ",
["> Draw jumpspot settings"] = "> Дʾ͸ǽʨ׃",
["Draw points"] = "Дʾ֣",
["Draw jumpspot while key pressed"] = "Дʾ͸Ծ֣ձдЂдݼ",
["Radius of the jumpspots"] = "͸ǽѫ޶",
["Max draw distance"] = "ܫОДʾ޻ԃ",
["Draw line to next jumpspots"] = "ۭПսЂһٶ͸ǽ֣",
["> Draw jumpspot colors"] = "> ͸ǽ֣ҕɫ",
["Jumpspot color"] = "͸ǽҕɫ",
["(E) - Sweeping Blade settings: "] = "(E) - ̤ǰն: ",
["Increase dashtimer by"] = "նݓƜ݆ʱǷ",
[">| This option will increase the time how long the script"] = ">| ֢ٶѡЮݫնݓޅѾքʱݤ",
[">| thinks you are dashing by a fixed value"] = ">| ɏΪţˇƮӝքһٶڌֵ֨",
["Check distance of target and (E)endpos"] = "ݬөĿҪքߠkۍEޡ˸֣",
["Maximum distance"] = "خճߠk",
[">| This option will check if the distance"] = ">| ՋѡЮݫݬөߠk",
[">| between your target and the endposition of your (E) cast"] = ">| ţքĿҪۍţ֮ݤEˍ؅",
[">| is greater then the distance set in the slider."] = ">| ճԚʨ׃քߠk.",
[">| If yes the cast will get blocked!"] = ">| ɧڻˇղܡѻبֹ!",
[">| This prevents dashing too far away from your target!"] = ">| ֢ҹࠉӔ؀ֹͻ޸̫ԶkţքĿҪ!",
["Auto Level Enable/Disable"] = "ؔ֯ݓ֣ Ǵԃ/޻ԃ",
["Auto Level Skills"] = "ؔ֯ݓ֣ר˵",
["> Autoultimate"] = "> ؔ֯ճ֐",
["Number of Targets for Auto(R)"] = "ؔ֯RĿҪ˽",
[">| Auto(R) ignores settings below and only checks for X targets"] = ">| ؔ֯R۶ÔЂĦքʨ׃ֻݬӢɋ˽",
["> General settings:"] = "> һѣʨ׃:",
["Delay the ultimate for more CC"] = "ғԙټנ࠘׆",
["DelayTime "] = "ғԙʱݤ ",
["Use (Q) while ulting"] = "ʹԃ(Q)ͬʱճ֐",
["Use Ultimate under towers"] = "ʹԃճ֐̾Ђ",
["> Target settings:"] = "> ĿҪѡձ:",
["> Advanced settings:"] = ">Ј޸ʨ׃:",
["Check for target health"] = "ݬөĿҪѪ",
["Only ult if target health below < %"] = "ɧڻĿҪѪ֍ԚЂĦ < %",
["Check for our health"] = "ݬөؔʭѪ",
["Only ult if our health bigger > %"] = "ֻԐϒćքݡߵճԚ > %",
["General-Settings"] = "һѣʨ׃",
["Allow casts only for targets in camera"] = "ՊѭֻXĿҪ",
["Windwall only if your hero is on camera"] = "ɧڻţքӢћˇ՚اǽ",
["> Packet settings:"] = "> آѼʨ׃:",
["Limit packets to human level"] = "О׆˽ߝѼսɋքˮƽ",
["(Q3) - Use Empowered Tempest"] = "(Q3) - ʹԃԵا",
["Choose combo mode"] = "ѡձl֐ģʽ ",
["Use items in Combo"] = "l֐ʹԃրߟ",
[">> Choose your abilities"] = ">> ѡձţքŜf",
["(Q) - Use Steel Tempest"] = "(Q) - ʹԃնٖʁ",
["(Q3) - Use Empowered Tempest"] = "(Q3) - ʹԃԵا",
["(E) - Use Sweeping Blade"] = "(E) - ʹԃ̤ǰն",
["(R) - Use Last Breath"] = "(R) -ʹԃ࠱ا߸Ϣն",
["Choose mode"] = "ѡձģʽ",
["Enable smart lasthit if no target"] = "ǴԃׇŜҹնɧڻûԐĿҪ",
["Enable smart lasthit if target"] = "ǴԃׇŜҹնɧڻĿҪ",
["|> Smart lasthit will use spellsettings from the lasthitmenu"] = "|> ׇŜҹնݫʹԃܼŜ",
["|> Mode 1 will simply harass your enemy with spells"] = "|> ģʽ1ֻܡɧɅţք֐ɋ",
["|> Mode 2 will harass your enemy and e back if possible"] = "|> ģʽ2ɧڻࠉŜք۰ܡɧɅţք֐ɋ",
["|> Mode 3 will engage with e - harass and e back if possible"] = "|>ģʽ3ɧڻࠉŜք۰ܡɧɅٺԫܘ",
["Use Smart Killsteal"] = "ʹԃׇŜܷɱ",
["Use items for Laneclear"] = "ȥПʹԃրߟ",
["Choose laneclear mode for (E)"] = "ѡձȥПʹԃEģʽ",
["Choose laneclear mode for (Q3)"] = "ѡձȥПģʽ(Q3",
["Min units to hit with (Q3)"] = "خСࠉļאեλ (Q3)",
["Check health for using (E)"] = "ݬөѪʹԃ (E)",
["Only use (E) if health > %"] = "ֻԐʹԃ (E) ɧڻHP > %",
["Prioritize spinning (Q)"] = "ԅЈ߼ÇEQ (Q)",
["Prioritize spinning (Q3)"] = "ԅЈ߼ÇEQ Q3)",
["Min units to hit with spinning"] = "خСեλEQ",
["Use items to for Jungleclear"] = "ȥҰʹԃրߟ",
["Choose Prediction mode"] = "ѡձԤƐ׽ר",
[">> VPrediction"] = ">> VPԤƐ",
["Hitchance of (Q): "] = "ļאÊ of (Q): ",
["Hitchance of (Q3): "] = "ļאÊ of (Q3): ",
[">> HPrediction"] = ">> HPԤƐ",
["Hitchance of (Q): "] = "ļאÊ of (Q): ",
["Hitchance of (Q3): "] = "ļאÊ of (Q3): ",
[">> Found Summonerspells"] = ">> עЖ֙۽ʦܼŜ",
["Use Autoignite"] = "ʹԃ֣ؔ֯ȼ",
["Use Overkillprotector"] = "ʹԃҜĢճӄСԃ",
["Disable ALL drawings of the script"] = "޻ԃޅѾ̹ԐДʾ",
["Draw spells only if not on cooldown"] = "ֻԐһ՚CDքʱۮӅДʾ",
["Draw fps friendly circles"] = "ПȦԅۯ",
["Choose strength of the circle"] = "ѡԲքǿ׈",
["> Other settings:"] = "> Ǥ̻ʨ׃:",
["Draw airborne targets"] = "ДʾࠕאĿҪ",
["Draw remaining (Q3) time"] = "ДʾQ3ʱݤ",
["Draw damage on Healthbar: "] = "Дʾʋڦ: ",
["> Draw range of spell"] = "> ДʾܼŜ׶Χ",
["Draw (Q): "] = "Дʾ (Q): ",
["Draw (Q3): "] = "Дʾ (Q3): ",
["Draw (E): "] = "Дʾ (E): ",
["Draw (W): "] = "Дʾ (W): ",
["Draw (R): "] = "Дʾ (R): ",
["> Draw color of spell"] = "> ДʾܼŜҕɫ",
["(Q) Color:"] = "(Q) ҕɫ:",
["(Q3) Color:"] = "(Q3) ҕɫ:",
["(W) Color:"] = "(W) ҕɫ:",
["(E) Color:"] = "(E) ҕɫ:",
["(R) Color:"] = "(R) ҕɫ:",
["Healthbar Damage Drawings: "] = "Ѫʋڦͼ: ",
["Startingheight of the lines: "] = "Startingheight of the lines: ",
["Draw smart (Q)+(E)-Damage: "] = "ДʾׇŜ (Q)+(E)-ʋڦ: ",
["Draw (Q)-Damage: "] = "Дʾ (Q)-ʋڦ: ",
["Draw (Q3)-Damage: "] = "Дʾ (Q3)-ʋڦ: ",
["Draw (E)-Damage: "] = "Дʾ (E)-ʋڦ: ",
["Draw (R)-Damage: "] = "Дʾ (R)-ʋڦ: ",
["Draw Ignite-Damage: "] = "Дʾ ֣ȼ-ʋڦ: ",
["Permashow: "] = "Ԁ߃Дʾ: ",
["Permashow HarassToggleKey "] = "Ԁ߃Дʾлۄߪژдݼ ",
["Permashow UltimateToggleKey"] = "Ԁ߃Дʾճ֐ߪژдݼ",
["Permashow Autowall Key"] = "Ԁ߃Дʾؔ֯اǽдݼ",
["Permashow Prediction"] = "Ԁ߃ДʾԤƐ",
["Permashow Walljump"] = "Ԁ߃Дʾ͸ǽ֣",
["Permashow HarassMode"] = "Ԁ߃Дʾлۄģʽ",
[">| You need to reload the script (2xF9) after changes here!"] = ">| ţѨҪ2ՎF9֢oӅܡҤۯ",
["> Healthpotions:"] = "> Ѫ֣:",
["Use Healthpotions"] = "ʹԃѪ",
["if my health % is below"] = "ɧڻϒքѪ % ֍Ԛ",
["Only use pots if enemys around you"] = "Only use pots if enemys around you",

}
local SupportedScriptList = {
"Evadeee","Sida's Auto Carry","Activator","DeklandAIO: Syndra","DeklandAIO: Orianna"
}
function translationchk(text)
    assert(type(text) == "string","<string> expected for text")
    local text2
    --if(text == "text1") then text2 = "change the text" end
    --print("find the text:",text,"tranTable:",tranTable[text])
    for i ,v in pairs(tranTable) do
    if(tranTable[text] ~= nil) then 
    text2 = tranTable[text] 
    --text2 = text
    else
    text2 = text
    end
    end
    return text2
end
function translateheaderchk(header)
    for i ,v in pairs(SupportedScriptList) do
    if(v == header) then 
    --PrintLocal(header.." loaded!")
    end
    end
end
function OnLoad()
	PrintLocal("加载成功！")
    PrintLocal("Boom群为：228326871，提供破解汉化全套脚本，欢迎使用")
end
function OnUnload()
	SaveMaster()
end

function PrintLocal(text, isError)
	PrintChat("<font color=\"#ff0000\">Bomm:</font> <font color=\"#"..(isError and "F78183" or "FFFFFF").."\">"..text.."</font>")
end

-- End of A1-Config.
