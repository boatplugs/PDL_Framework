local check = {}

function check.Bounds(newPos)
	if newPos[1] > 0 and newPos[1] <= StageX and newPos[2] > 0 and newPos[2] <= StageY then	-- check if the newPos is in bounds
	return true
	else
	return false
	end
end

function check.Tile(pos)
	local stageVal = Stage[pos[1]][pos[2]]
	if stageVal == MapFill then
	return true
	else
	return false
	end
end

function check.Area(origin,w,h)
	print("check.Area")
	checkTable = {}
	if w == 0 and h == 0 then
		for x=1, 1 do
			for y=1, 1 do
				local p = {origin[1],origin[2]}
				local val = Stage[p[1]][p[2]]
				local t = {p, val}
				if val == MapFill then
					print("check.Area 1x1, true")
					return true
				else
					print("check.Area 1x1, false")
					return false
				end
			end
		end
	else
		for x=1, w do
			checkTable[x] = {} 
			for y=1, h do
				local p = {origin[1]+x,origin[2]+y}	-- set p position to our origin
				local val = Stage[p[1]][p[2]] 	-- pull the value from the stage
				local t = {p,"*"}
				if val == MapFill then	-- checking for empty space
					print("check.Area any, true")
					return true
					-- checkTable[x][y] = t
				else
					print("check.Area any, false")
					return false
				end
			end
		end
	end
end


return check