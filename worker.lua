local worker = {}
local check = require('check')
local object = require('object')

local move = { -- array for performing direction move checks
-- direction 1, north
function(pos,w,h) local t,p = nil,nil if w ~= nil and h ~= nil then -- init vars, check to see if we have a width and height
p = {pos[1],(pos[2]-h)-1} t = check.Area(p,1,1-h)	-- set p, the new position, set t, the check (returns bool)
if t == true then return p else return false end else -- if our check is true then we return the new pos, otherwise false 
p = {pos[1],pos[2]-1} t = check.Area(p)	-- if we have no width and height, setting p and running our check
if t == true then return p else return false end end -- if our check is true then we return the new pos, otherwise false
end,
-- direction 2, south
function(pos,w,h) local t,p = nil,nil if w ~= nil and h ~= nil then 
p = {pos[1],(pos[2]+h)+1} t = check.Area(p,1,1+h)
if t == true then return p else return false end else
p = {pos[1],pos[2]+1}  t = check.Area(p)
if t == true then return p else return false end end
end,
-- direction 3, east
function(pos,w,h) local t,p = nil,nil if w ~= nil and h ~= nil then 
p = {(pos[1]-w)-1,pos[2]} t = check.Area(p,1-w,1)
if t == true then return p else return false end else
p = {pos[1]-1,pos[2]} t = check.Area(p)
if t == true then return p else return false end end 
end, 
-- direction 4, west
function(pos,w,h) local t,p = nil,nil if w ~= nil and h ~= nil then 
p = {(pos[1]+w)+1,pos[2]} t = check.Area(p,1+w,1)
if t == true then return p else return false end else
p = {pos[1]+1,pos[2]} t = check.Area(p)
if t == true then return p else return false end end
end

}

local state = {	-- This is our state table
function(pos)	-- state 1
	print("state 1", pos)
	local newPos = false
	local checkPos = pos
	local dir = Rand:random(1,4)
	while newPos == false do	-- loop if our check is false
		local t = move[dir]	-- set t with our move table pointed to the direction
		newPos = t(pos)	-- set newPos to our move table function
		print("mv check", newPos, dir)
		dir = Rand:random(1,4)	-- set a new random direction in case the check fails
	end
	return newPos	-- return our new position
end,

function(pos)	-- state 2
	print("state 2", pos)
	local stageVal = Stage[pos[1]][pos[2]]	-- convenience variable for referencing the stage at pos
	if stageVal == MapFill or stageVal == " " or stageVal == "w" then	-- check for occupied tiles
		object.CreateObject("object","floor"," ",pos)
	end
	return pos	-- for the update loop's sake, return pos
end

}

function worker.Update()	-- used for updating all of the workers
	if #WorkerList ~= nil then	-- continue if the workerlist is populated
		for k, v in pairs(WorkerList) do	-- iterate through the following for each worker
			print("worker update start", #WorkerList)
			local st = nil
			local hpmax = 100
			local hpcur = hpmax
			local s = #state
			local prevPos = {v}
			local pPos = prevPos[#prevPos]
			while hpcur > 0 do	--	loop while our worker isn't dead
				for i=1, s do	-- state loop, iterate the number of states we have in our state table
					print("state beginning", hpcur, i)
					local t = state[i]	-- set t to our state table
					local st = t(v)	-- set st to our state table function
					if i == 1 and hpcur ~= hpmax then	-- check to see if it's state one and if our worker just started
						while st == pPos do	-- since we're only ran during state one, loop if our dir check is an old pos
							st = t(v)	-- run another check, consequently in a different dir (Hopefully!)
						end
						table.insert(prevPos, st) -- add the new pos to the previous pos list
						v = st	-- set the worker's position to the new position
						print("worker pos",pPos,v)
					end	
					print("state", st)
					print("state ending", hpcur, i)
				end
				hpcur = hpcur - 1	-- once our states are done we decrease the hp of our worker
			end
			table.remove(WorkerList, k) -- if our worker is dead remove it
			print("worker update end", #WorkerList)
		end
	end
end

return worker