local player = {}
local check = require('check')
local move = { 		-- function array for different move directions
	kp7 = function(array)	-- NW check and set
	boundtest = check.Bounds({array[1]-1,array[2]-1})
	if boundtest == true then array[1] = array[1]-1 array[2] = array[2]-1 else return false end end,
	kp8 = function(array)	-- N check and set
	boundtest = check.Bounds({array[1],array[2]-1})
	if boundtest == true then array[1] = array[1] array[2] = array[2]-1 else return false end end,
	kp9 = function(array)	-- NE check and set
	boundtest = check.Bounds({array[1]+1,array[2]-1})
	if boundtest == true then array[1] = array[1]+1 array[2] = array[2]-1 else return false end end,
	kp4 = function(array)	-- W check and set
	boundtest = check.Bounds({array[1]-1,array[2]})
	if boundtest == true then array[1] = array[1]-1 array[2] = array[2] else return false end end,
	kp5 = function(array)	-- Center check and set
	boundtest = check.Bounds({array[1],array[2]})
	if boundtest == true then array[1] = array[1] array[2] = array[2] else return false end end,
	kp6 = function(array)	-- E check and set
	boundtest = check.Bounds({array[1]+1,array[2]})
	if boundtest == true then array[1] = array[1]+1 array[2] = array[2] else return false end end,
	kp1 = function(array)	-- SW check and set
	boundtest = check.Bounds({array[1]-1,array[2]+1})
	if boundtest == true then array[1] = array[1]-1 array[2] = array[2]+1 else return false end end,
	kp2 = function(array)	--S check and set
	boundtest = check.Bounds({array[1],array[2]+1})
	if boundtest == true then array[1] = array[1] array[2] = array[2]+1 else return false end end,
	kp3 = function(array)	-- SE check and set
	boundtest = check.Bounds({array[1]+1,array[2]+1})
	if boundtest == true then array[1] = array[1]+1 array[2] = array[2]+1 else return false end end
	}

function player.Create()
	Player = {"player", "@"}
	Player[3] = {16,16}
	Player.i = {}
	Player.wt = {0,100}
end

function player.Move(dir)
	local pos = Player[3]
	local d = move[dir]
	if d ~= nil then
		newPos = d(pos)
	else
	print("Not a valid direction!")
	end
end

local hotkeys = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
function player.Inventory()
	for k, v in ipairs(Player['i']) do
		print(hotkeys[k],v[1])
	end

end

function player.PickupItem()
	for i, v in pairs(ItemList) do
		local pPos = Player[3]
		local iPos = ItemList[i][3]
		local count = 0
		if iPos[1] == pPos[1] and iPos[2] == pPos[2] and Player.wt[1] < Player.wt[2] then
			print("matches loc")
			count = count + 1
			pickup = ItemList[i]
			table.insert(Player.i, ItemList[i])
			Player.wt[1] = Player.wt[1]+ItemList[i][4]
			table.remove(ItemList, i)
		end
	end
end

function player.DropItem(item, amount)
	for k, v in ipairs(hotkeys) do
		if item == v then
		
		end
	end
	if item ~= nil then
	else
	end
end

function UseItem(item)

end

return player