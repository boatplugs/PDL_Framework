debug = true

function love.load() -- called with scan origin and dimens
	stage = require("stageUpdate")
	object = require("object")
	player = require("player")
	state = require("state")
	check = require("check")
	worker = require("worker")
	MapFill = "#"
	ItemList = {}
	CreatureList = {}
	ObjectList = {}
	WorkerList = {}
	StageX, StageY = 78,48
	Rand = love.math.newRandomGenerator()
	player.Create()
	stage.CreateStage()
	State = 1
	if State == 1 then
	state.Set(State)
--	check.Area({1,1},3,3)
	object.CreateObject("Wall","Iron Sword", "S", {16,18}, 3)
--	object.CreateObject("item","Gold Coin", "$", {16,18}, 0)
	end
	print("load")
end

function love.update(dt)
	function love.keypressed(key)
		--print("keypressed",key)
		if key == 'd' then
			local key = nil
			player.Inventory()
			print("Select and item to drop:")
			if key ~= nil then
			player.DropItem(key)
			else
			key = nil
			end
		elseif key == 'escape' then
			love.event.quit()
		elseif key == 'n' then
			stage.AddNoise()
		elseif key == 'w' then
			object.CreateObject("worker","worker","w",{25,25})
			
		end
		
		if Player ~= nill then
			if key == 'kp7' then
				player.Move(key)
			elseif key == 'kp8' then
				player.Move(key)
			elseif key == 'kp9' then
				player.Move(key)
			elseif key == 'kp4' then
				player.Move(key)
			elseif key == 'kp5' then
				player.Move(key)
				worker.Update()
			elseif key == 'kp6' then
				player.Move(key)
			elseif key == 'kp1' then
				player.Move(key)
			elseif key == 'kp2' then
				player.Move(key)
			elseif key == 'kp3' then
				player.Move(key)
			elseif key == '.' then
				player.PickupItem()
			end
		end
	end
	stage.StageUpdate()
end

function love.draw()
	local winH = love.graphics.getHeight()
	local winW = love.graphics.getWidth()
--	local items = Player["i"]
	for x=1, StageX do
		for y=1, StageY do
			local val = Stage[x][y]
			local str = {{0,255,56},val}
			love.graphics.print(str,0+(x*10), 0+(y*10))
			-- love.graphics.print(Stage[x][y],0+(x*10), 0+(y*10))
		end
	end
end