
local MainScene = class("MainScene", cc.load("mvc").ViewBase)



function MainScene:onCreate()
    -- add background image
    -- local image_info = 
    -- {

    -- --"HelloWorld.png",
    -- --"test_jpg_1024x1024.jpg",

    -- --png
 
    -- "png_128x128.png",
    -- "png_512x512.png",
    -- "png_1024x1024.png",

    -- --pkm
    -- "png_128x128.pkm",
    -- "png_512x512.pkm",
    -- "png_1024x1024.pkm",

    -- --pvr
    -- "pvr_128x128.pvr",
    -- "pvr_512x512.pvr",
    -- "pvr_1024x1024.pvr",

    
    -- -- "test_jpg_1024x1024.jpg",
    -- -- "test_png_1024x1024.png",
    -- -- "test_pvr_1024x1024.pvr",
    
    
    -- }

    -- self.m_text = nil
    -- self.m_image = nil


    -- local move_pos = display.CENTER

    -- self.m_bk = display.newSprite("74.jpg")
    -- self.m_bk:move(cc.p(display.cx, display.cy))
    --         :addTo(self)

    -- -- for i=1,1 do
    -- --     local start_time = os.clock()
    -- --     self.m_image = display.newSprite(image_info[i])
    -- --     self.m_image:move(cc.p(display.cx, display.cy + i*100))
    -- --         :addTo(self)

    -- --     local end_time = os.clock()

    -- --     -- add HelloWorld label
    -- --     self.m_text = cc.Label:createWithSystemFont(string.format("cost_time%s :%f",image_info[i],end_time - start_time), "Arial", 40)
    -- --     self.m_text:setTextColor(ccc4(255,0,0,255))
    -- --     self.m_text:move(display.cx, display.height - i*50)
    -- --         :addTo(self)

    -- --     print(debug.traceback())
    -- --     local value_index = 1
    -- --     local value_name,value_value = debug.getlocal(1,value_index)
    -- --     while value_name do
    -- --         --todo
    -- --         print(string.format("name:%s value:%s",value_name,value_value))
    -- --         value_name,value_value = debug.getlocal(1,value_index)
    -- --         value_index = value_index + 1
    -- --     end
        
    -- -- end

    -- local function menuCallback(item)
    --     -- body
    --     print(string.format("click"))
    --     for k,v in pairs(image_info) do
    --         display.removeImage(v)
    --     end
        

    --     local tag_val = item
    --     local i = tag_val
    --     if self.m_image then
    --         self.m_image:removeSelf()
    --     end

    --     if self.m_text then
    --         self.m_text:removeSelf()
    --     end

    --     local start_time = os.clock()
    --     self.m_image = display.newSprite(image_info[i])
    --     self.m_image:move(cc.p(display.cx, 0))
    --         :addTo(self)

    --     local end_time = os.clock()

    --     -- add HelloWorld label
    --     self.m_text = cc.Label:createWithSystemFont(string.format("cost_time%s :%f",image_info[i],end_time - start_time), "Arial", 40)
    --     self.m_text:setTextColor(ccc4(255,0,0,255))
    --     self.m_text:move(display.cx,display.height - 50)
    --         :addTo(self)

    --     local director = cc.Director:getInstance()
    --     local textureCache = director:getTextureCache()

    --     --输出占用内存信息
    --     print(textureCache:getCachedTextureInfo())

    -- end

    -- -- local label = cc.Label:createWithSystemFont("close", "Arial", 40)
    -- -- label:setString("jpg")
    -- -- local btn_close = cc.MenuItemLabel:create(label)
    -- -- btn_close:setPosition(cc.p(display.cx +200, display.cy))
    -- -- btn_close:setTag(1)
    -- -- btn_close:registerScriptTapHandler(menuCallback)

    -- -- local label_png = cc.Label:createWithSystemFont("png", "Arial", 40)
    -- -- local btn_png = cc.MenuItemLabel:create(label_png)
    -- -- btn_png:setPosition(cc.p(display.cx +200, display.cy - 50))
    -- -- btn_png:setTag(2)
    
    -- -- btn_png:registerScriptTapHandler(menuCallback)
   
    -- -- local label_pvr = cc.Label:createWithSystemFont("pvr", "Arial", 40)
    -- -- local btn_pvr = cc.MenuItemLabel:create(label_pvr)
    -- -- btn_pvr:setPosition(cc.p(display.cx +200, display.cy - 100))
    -- -- btn_pvr:registerScriptTapHandler(menuCallback)
    -- -- btn_pvr:setTag(3)

    -- local arr = {}
    -- table.insert(arr,btn_close)
    -- -- table.insert(arr,btn_pvr)
    -- -- table.insert(arr,btn_png)

    -- for i=1,#image_info do
    --     local label_pvr = cc.Label:createWithSystemFont(image_info[i], "Arial", 40)
    --     local btn_pvr = cc.MenuItemLabel:create(label_pvr)
    --     btn_pvr:setPosition(cc.p(display.cx +200,display.height - 50*i -50))
    --     btn_pvr:registerScriptTapHandler(menuCallback)
    --     btn_pvr:setTag(i)
    --     table.insert(arr,btn_pvr)
    -- end

    
    -- --btn_close:setLabel(label)




    -- local menu_list = cc.Menu:create()

    -- menu_list:initWithArray(arr)
    -- --menu_list:addChild(btn_close)

    -- menu_list:setContentSize(display.size)
    -- menu_list:move(0, 0)

    -- self:addChild(menu_list,10000)

    --test
 
    local function menuCallback()
        -- body

        local path_mgr = Path.create()
        local start_pos = {x = 1, y = 1}
        local end_pos = {x = 2000,y = 3000}

        local start_time =  os.clock()
        local path_list = path_mgr:GenPath(start_pos,end_pos)
        local start_end =  os.clock()

        printInfo("cost time %f",start_end - start_time)

        --dump(path_list,"route")

        self:onShowAnimation()

    end
    local arr = {}
    local label_pvr = cc.Label:createWithSystemFont("gen", "Arial", 40)
    local btn_pvr = cc.MenuItemLabel:create(label_pvr)
    btn_pvr:setPosition(cc.p(display.cx,display.cy))
    btn_pvr:registerScriptTapHandler(menuCallback)
    
    table.insert(arr,btn_pvr)
    local menu_list = cc.Menu:create()
    menu_list:initWithArray(arr)
    
    menu_list:setContentSize(display.size)
    menu_list:move(0, 0)
    self:addChild(menu_list,10000)



    local map = Map.create()
    self:addChild(map)

    self.m_sprite = display.newSprite()
    self.m_sprite:move(display.cx, display.cy)
    self:addChild(self.m_sprite)

end

function MainScene:onShowAnimation(path)
    -- body
    path = path or "sprite/test"
    local res_index = 0
    local res_queue = 0


    while true do
        --todo
        local temp_path = string.format("%s%d.png",path,res_index)
        local temp_plist_path = string.format("%s%d.plist",path,res_index)
        local fullpat =  cc.FileUtils:getInstance():fullPathForFilename(temp_path);
        if not cc.FileUtils:getInstance():isFileExist(temp_path) then
            break
        end
        local function reloadCallBack(texture)
            -- body
            cc.SpriteFrameCache:getInstance():addSpriteFrames(temp_plist_path,texture)
            res_queue = res_queue - 1
            if res_queue == 0 then
                local frames = {}
                for i=1,8 do
                    local frame = cc.SpriteFrameCache:getInstance():getSpriteFrame(string.format("f-%d.jpg",i - 1))
                    table.insert(frames,frame)
                end

                local animation = cc.Animation:createWithSpriteFrames(frames,0.1,-1)
                local animate = cc.Animate:create(animation)
                
                self.m_sprite:runAction(animate)



            end
        end
        cc.TextureCache:getInstance():addImageAsync(temp_path,reloadCallBack)
        res_index = res_index + 1
        res_queue = res_index

        
    end

 

end

return MainScene
