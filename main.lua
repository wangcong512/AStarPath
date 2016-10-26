
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"

--head
require "app.GameGlobal"
require "app.views.Map"
require "app.views.astarpath.path"
require "app.Actor"
require "app.views.Camera"

function updatePerFrame(dt)
	-- body
	--printInfo("update time %f",dt)
	Map.getInstance():update(dt)
end

local function main()
	cc.Director:getInstance():setUpdateCallBack(updatePerFrame)
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end


