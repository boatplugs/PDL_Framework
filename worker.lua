local worker = {}
local check = require('check')
local object = require('object')

local test = { -- array for performing direction move checks
function(pos,w,h) p = {pos[1],(pos[2]-h)-1} 
t = check.Area(p,1,1-h) if t == true then return p else return pos end end, -- up [1]

function(pos,w,h) p = {pos[1],(pos[2]+h)+1} 
t = check.Area(p,1,1+h) if t == true then return p else return pos end end, -- down [2]

function(pos,w,h) p = {(pos[1]-w)-1,pos[2]}
t = check.Area(p,1-w,1) if t == true then return p else return pos end end, -- left [3]

function(pos,w,h) p = {(pos[1]+w)+1,pos[2]}
t = check.Area(p,1+w,1) if t == true then return p else return pos end end	-- right [4]
}


function worker.Update()
	if #WorkerList ~= nil then
		for k, v in pairs(WorkerList) do
			local hp = v[2]
			while hp > 0 do
				print("hp",hp)
				local state = 0
				while state == 0 do
					print("state",state) 
					local dir = Rand:random(1,4)
					local t = test[dir]
					if t ~= nil then
						v[3] = t(v[1],0,0)
						print("v[3]",v[3])
						if v[3] == v[1] then
						else
							local pos = v[3]
							state = state + 1
							hp = hp - 1
							v[1] = pos
							object.CreateObject("object","floor"," ",pos)
						end
					end
				end
			end
		end
	end
end

return worker