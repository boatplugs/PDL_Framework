local worker = {}
local check = require('check')

function worker.Update()
	if #WorkerList ~= nil then
		local dir = Rand:random(1,4)
		for k, v in pairs(WorkerList) do
			local pos = v[1]
			local hp = v[2]
			local state = v[3]
			print(dir)
			if state == 1 and hp > 0 then	--do stuff if we're off and above 0 hp
				local count = Rand:random(3,9)
				if dir == 1 then	-- move up
					local cPos = {pos[1]-1,(pos[2]-count)-1}
					check.Area(cPos,1,count)
					v[2] = v[2] - 1
				elseif dir == 2 then	-- move down
					local cPos = {pos[1]-1,pos[2]}
					check.Area(cPos,1,count)
					v[2] = v[2] - 1
				elseif dir == 3 then	-- move left
					local cPos = {(pos[1]-count)-1,pos[2]-1}
					check.Area(cPos,count,1)
					v[2] = v[2] - 1
				elseif dir == 4 then	-- move right
					local cPos = {pos[1],pos[2]-1}
					check.Area(cPos,count,1)
					v[2] = v[2] - 1
				end
				print("state", state)
				print("hp",hp)
				print("count",count)
				if v[2] == 0 then
					v[3] = v[3] + 1
					table.remove(WorkerList, k)
				end

			else
				
			end
		end
	end
end

return worker