Map = class("Map",cc.Node)

function Map:ctor()
 	-- body
 	self:onCreate()

 	self.m_hero = Actor.create()

 	self.m_camera = Camera.create(self)

 	self.m_map_width = 0
 	self.m_map_height = 0

end 

function Map.getInstance()
	-- body
	-- local instance =  Map.create()
	-- return instance
	if G.m_game_map then
		return G.m_game_map
	else
		G.m_game_map = Map.create()
		return G.m_game_map
	end

end

function Map:onCreate( ... )
	-- body
	
    self.m_bk = display.newSprite("74.jpg")
    self.m_bk:setAnchorPoint(cc.p(0,0))
    self.m_bk:move(cc.p(0, 0))
            :addTo(self)


end



function Map:initMap()
	-- body
	local size = self:getContentSize()
	size.width = 1000
	size.height = 1000

	self.m_map_width = size.width
	self.m_map_height = size.height


end

--间隔一段时间调整一下镜头
function Map:update(dt)
	-- body
	self:ajustPosition()

end

function Map:ajustPosition()
	-- body

	local x = self.m_camera.m_pos.x
	local y = self.m_camera.m_pos.y
	local width = self.m_camera.m_width
	local height = self.m_camera.m_height

	local map_max_move_x = math.max(0,self.m_map_width - width)
	local map_max_move_y = math.max(0,self.m_map_height - height)

	self:setPosition(-x, -y)
end