PathAI = class("PathAI")

function PathAI:ctor(parent)

	self.m_path = {}
	self.m_parent = parent



	self:init()

end

function PathAI:init()
	-- body
	for i=1,10 do
		local node = {}
		node.x = i
		node.y = i
		table.insert(self.m_path,node)
	end
end

function PathAI:update(dt)
	-- body
	local distance = dt*Camera.speed
	local dst = self.m_path.
	--printInfo("camera move distance distance:%f",distance)

	if math.abs(self.m_target_pos.x - self.m_pos.x) > distance then

		if self.m_target_pos.x > self.m_pos.x then
			self.m_pos.x = self.m_pos.x + distance
		else
			self.m_pos.x = self.m_pos.x - distance
		end

	end

	if math.abs(self.m_target_pos.y - self.m_pos.y) > distance then

		if self.m_target_pos.y > self.m_pos.y then
			self.m_pos.y = self.m_pos.y + distance
		else
			self.m_pos.y = self.m_pos.y - distance
		end

	end


end