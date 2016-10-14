PathNode = {
	x = 0,
	y = 0,
	G = 0,
	H = 0,
	F = 0,

}

Path = class()


function Path.CreateNode()
	-- body

	local node = {}
	node.x = 0
	node.y = 0
	node.F = 0
	node.G = 0
	node.H = 0

	return node
end

function Path:GenPath(start_pos,end_pos,max_deep = 100)

	local path_list = {}
	local open_list = {}
	local close_list = {}
	while true do
		--todo
		
	end

end

function Path:Round9Node(x,y,list)
	-- body
	list = list or {}
	for i= x - 1,x + 1 do
		for j= y -1,y + 1 do
			
			local path_node = Path.CreateNode()
			path_node.x,path_node.y = x,y
			table.insert(list,path_node)
		end
	end

end

function Path:IsBlock(x,y)
	-- body

	return false
end
