local object = {} 

function object.CreateObject(ent, label, symbol, pos, wt)
	local newObj = {label, symbol, pos, wt}
	if Stage[pos[1]][pos[2]] == MapFill then
		if ent == "worker" then
			local w = {pos, 3, 1}
			table.insert(WorkerList, w)
		elseif ent == "object" then
			table.insert(ObjectList, newObj)
		elseif ent == "creature" then
			table.insert(CreatureList, newObj)
		elseif ent == "item" then
			table.insert(ItemList, newObj)
		end
	end
end

function object.UpdateObject(list, symbol, x, y)
	
end

function object.DestroyObject(objlist)
	if #objlist >= 1 then
		objlist[#objlist] = nil
	end
end

function object.UpdateWorker(array, ticks)

end

return object