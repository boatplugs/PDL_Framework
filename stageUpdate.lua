local stage = {}
local check = require('check')

function stage.CreateStage()
	Stage = {}
	for x=1, StageX do
		Stage[x] = {}
		for y=1, StageY do
			Stage[x][y] = MapFill
		end
	end
end

function stage.StageUpdate()	-- Called to update the stage array
	stage.CreateStage()
	local creatures = #CreatureList
	local items = #ItemList
	local objects = #ObjectList
	local workers = #WorkerList
	if NoiseLayer ~= nil then
		for x=1, StageX do
			for y=1, StageY do
					local val = NoiseLayer[x][y]
					Stage[x][y] = val
			end
		end
	end
	for i, v in ipairs(CreatureList) do	-- iterate creature list and add symbols to the stage
		local pos = CreatureList[i][3]
		local val = CreatureList[i][2]
		if pos ~= nil then
		Stage[pos[1]][pos[2]] = val
		end
	end
	for i, v in ipairs(ItemList) do	-- iterate item list and add symbols to the stage
		local pos = ItemList[i][3]
		local val = ItemList[i][2]
		if pos ~= nil and check.Tile(pos) then -- check tile pos for matches
		Stage[pos[1]][pos[2]] = val
		else -- if there are more than one item place an *
		Stage[pos[1]][pos[2]] = "*"
		end
	end
	for i, v in ipairs(ObjectList) do	-- iterate object list and add symbol to the stage
		local pos = ObjectList[i][3]
		local val = ObjectList[i][2]
		if pos ~= nil then
		Stage[pos[1]][pos[2]] = val
		end
	end
	for i=1, 1 do	-- iterate player list and add symbol to the stage
		if Player ~= nil then
			local pos = Player[3]
			local val = Player[2]
			if pos ~= nil then
			Stage[pos[1]][pos[2]] = val
			end
		end
	end
	for k, v in ipairs(WorkerList) do	-- iterate worker list and add symbol to the stage
		local pos = v[1]
		local val = "w"
		if pos ~= nil then
		-- Stage[pos[1]][pos[2]] = val
		end
	end
	if checkTable ~= nil then
		for x=1, #checkTable do
			for y=1, #checkTable[x] do
				local t = checkTable[x][y]
				local pos = t[1]
				local val = t[2]
				Stage[pos[1]][pos[2]] = val
			end
		end
		checkTable = nil
	end
end

function stage.AddObject(object)

end

function stage.AddNoise()
	NoiseLayer = {}
	for x=1, StageX do
		NoiseLayer[x] = {}
		for y=1, StageY do
			local r = Rand:random(0,100)
			local noise = love.math.noise(r,r)
			if noise ~= nil then
				if noise > .9 then
					NoiseLayer[x][y] = 9
				elseif noise > .8 then
					NoiseLayer[x][y] = 8
				elseif noise > .7 then
					NoiseLayer[x][y] = 7
				elseif noise > .6 then
					NoiseLayer[x][y] = 6
				elseif noise > .5 then
					NoiseLayer[x][y] = 5
				elseif noise > .4 then 
					NoiseLayer[x][y] = 4
				elseif noise > .3 then
					NoiseLayer[x][y] = 3
				elseif noise > .2 then
					NoiseLayer[x][y] = 2
				else
					NoiseLayer[x][y] = 1
				end
				noise = nil
			end
		end
	end
end




					
					
					
return stage
