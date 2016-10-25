ActorAnimation = class("ActorAnimation",cc.ActionInterval)

ActorAnimation.ActionType = {}
ActorAnimation.ActionType.MoveDown = 1
ActorAnimation.ActionType.MoveLeft = 2
ActorAnimation.ActionType.MoveUp = 3
ActorAnimation.ActionType.MoveRight = 4

ActorAnimation.BodyParts = {}
ActorAnimation.BodyParts.Cloth = 1
ActorAnimation.BodyParts.Weapon = 2


function ActorAnimation.create()
	-- body
	self.m_sprite = display.newSprite()
	self.m_frames = 0
	self.m_cur_frame = 1
	self.m_kf = 0
	self.m_frames = {}

	self.m_action_id = 1


end

--异步加载frame
function ActorAnimation:load(res_name)
	-- body
	local path_info = io.pathinfo(res_name)
	while true do
		local temp_path = string.format("%s%d%s",res_name,res_index,G.res_suffix)
	    local temp_plist_path = string.format("%s%d.plist",res_name,res_index)
	    local fullpath =  cc.FileUtils:getInstance():fullPathForFilename(temp_path);
	    if not cc.FileUtils:getInstance():isFileExist(temp_path) then
	        break
	    end
        local function reloadCallBack(texture)
            -- body
            cc.SpriteFrameCache:getInstance():addSpriteFrames(temp_plist_path,texture)
            res_queue = res_queue - 1
            if res_queue == 0 then
               	self.m_frames = {}
                for k,v in pairs(ActorAnimation.ActionType) do
                	self.m_frames[v] = self.m_frames[v] or {}
                	for i = 1,10 do
	                	local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame(string.format("%s_%d_%d.png",path_info.basename,v,i))
	                    if frame then
	                        table.insert(self.m_frames[v],frame)
	                    end
                	end

                    
                end

                -- local animation = cc.Animation:createWithSpriteFrames(frames,0.1,-1)
                -- local animate = cc.Animate:create(animation)
                
                -- self.m_sprite:runAction(animate)



            end
        end
        cc.TextureCache:getInstance():addImageAsync(temp_path,reloadCallBack)
        res_index = res_index + 1
        res_queue = res_index

        
    end


end


function ActorAnimation:update(dt)
	-- body
	self.m_sprite:setSpriteFrame(self.m_frames[self.m_action_id][self.m_cur_frame])
end

function ActorAnimation:changeState(action_id)
	-- body
	self.m_action_id = action_id
end