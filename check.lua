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
	checkTable = {}
	for x=1, w do
		checkTable[x] = {} 
		for y=1, h do
			local p = {origin[1]+x,origin[2]+y}
			local val = Stage[p[1]][p[2]]
			local check = {p,val}
			checkTable[x][y] = check
		end
	end		
end


return check