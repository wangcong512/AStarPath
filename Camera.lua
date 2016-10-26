Camera = class("Camera")
Camera.pos_x = 0
Camera.pos_y = 0

function Camera:ctor(parent)
	-- body

	self.m_pos = cc.p(0,0)
	self.m_parent = parent
	local size = cc.Director:getInstance():getWinSize()
	self.m_width = size.width
	self.m_height = size.height
end

function Camera:setCameraPos(pos)
	-- body
	self.m_pos = pos
end

function Camera:moveCamera(pos)
	-- body
end

