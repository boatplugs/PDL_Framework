local check = {}

function check.Bounds(newPos)
	if newPos[1] > 0 and newPos[1] <= StageX and newPos[2] > 0 and newPos[2] <= StageY then	-- check if the newPos is in bounds
	return true
	else
	return false
	end
end

function check.Tile(pos)
	if pos ~= nil then
		local stageVal = Stage[pos[1]][pos[2]]
		print("check.Tile", pos)
		if stageVal == MapFill or stageVal == " " then
		return true
		else
		return false
		end
	end
end

function check.Area(origin,w,h)
	print("check.Area")
	if w ~= nil and h ~= nil then
		--print("check.Area, w,h")
		local checkTable = {}
		for x=1, w do
			checkTable[x] = {}
			for y=1, h do
				local p = {origin[1]+x,origin[2]+y}
				if Stage[p[1]][p[2]] == MapFill and stageVal == " " then
					--print("check.Area, w,h, true")
					return true
				else
					--print("check.Area, w,h, false")
					return false
				end
			end
		end
	else
		--print("check.Area, no w,h",origin)
		local t = check.Tile(origin)
		--print("check.Area, no w,h", t)
		return t
	end
	
end

return check