local object = {} 

function object.CreateObject(ent, label, symbol, pos, wt)
		if ent == "worker" then
			local w = {pos, 1, 0}
			table.insert(WorkerList, w)
		elseif ent == "object" then
			table.insert(ObjectList, {label,symbol,pos})
		elseif ent == "creature" then
			table.insert(CreatureList, {label,symbol,pos})
		elseif ent == "item" then
			table.insert(ItemList, {label,symbol,pos,wt})
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