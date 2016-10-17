local PathNode = {
	x = 0,
	y = 0,
	G = 0,
	H = 0,
	F = 0,

}

Path = class("Path")


function Path.CreateNode(x,y,f,g,h)
	-- body

	local node = {}
	node.x = x or 0
	node.y = y or 0
	node.F = f or 0
	node.G = g or 0
	node.H = h or 0

	return node
end

function Path:GenPath(start_pos,end_pos,max_deep)
	if not start_pos then
		print("start_pos nil")
		return {}
	end
	if not end_pos then
        print("end_pos nil")
		return {}
	end
	self.m_start_pt = start_pos or {x = 0,y = 0}
	self.m_end_pt = end_pos or {x = 0,y = 0}

	local path_list = {}
	local open_list = {}
	local close_list = {}
	local start_node = Path.CreateNode(start_pos.x,start_pos.y)
	local is_obstacle = self:IsBlock(start_pos.x,start_pos.y)
	if not is_obstacle then

		--table.insert(open_list,start_node)
		table.insert(close_list,start_node)
		local function sort_compare(src,dest)
			-- body
			if src.F <  dest.F then
				return true
			else
				return false
			end
		end

		local parent_node = start_node
		while parent_node do
			--todo
			open_list = {}
			self:Round9Node(parent_node,open_list)

			table.sort(open_list, sort_compare)

			parent_node = open_list[1]

			if parent_node then
				table.insert(close_list,parent_node)

			end
		end
			
	else
		
	end

	return close_list

end

function Path:CalcF(parent_node,path_node)
	-- body
	local f = 0
	local g = self:CalcG(parent_node,path_node)
	local h = self:CalcH(path_node)
	f = g + h
	path_node.F = f
	return f
end

function Path:CalcG(parent_node,path_node)
	-- body
	path_node.G = parent_node.G + path_node.G

	return path_node.G
end

function Path:CalcH(path_node)
	-- body
	local lenX = math.abs(path_node.x - self.m_end_pt.x)
	local lenY = math.abs(path_node.y - self.m_end_pt.y)
	path_node.H = (lenY+lenX)*10
	return (lenY+lenX)*10
end

function Path:Round9Node(parent_node,list)
	-- body
	local x = parent_node.x
	local y = parent_node.y
	list = list or {}
	for i= x - 1,x + 1 do
		for j= y -1,y + 1 do
			--是否障碍物

			local is_block = self:IsBlock(i,j)
			if is_block or (i == x and j == y) then

			else

				local path_node = Path.CreateNode()
				path_node.x,path_node.y = i,j


				if (i == x - 1 and j == y - 1)
					or (i == x - 1 and j == y + 1)
					or (i == x + 1 and j == y + 1)
					or (i == x + 1 and j == y - 1) then

					path_node.G = 14
				else
					path_node.G = 10
				end

				self:CalcF(path_node)

				table.insert(list,path_node)
			end

		end
	end

end

function Path:IsBlock(x,y)
	-- body

	return false
end

return Path
