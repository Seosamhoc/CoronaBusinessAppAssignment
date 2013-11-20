----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------
local ui = require("ui")
local screenOffsetW, screenOffsetH = display.contentWidth - display.viewableContentWidth, display.contentHeight - display.viewableContentHeight
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local w , h = display.contentWidth , display.contentHeight
display.setStatusBar( display.HiddenStatusBar)

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
function gotohome (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene1" )
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	background = display.newRect(0, 0, w, h)
	group:insert(background)

	title = display.newText( "At Space Objects and Coffee, we're a business that cares about our customers, a business like no other. We sell one of a kind products you'll not find anywhere else and that's just the coffee!", 250, 250, 200, 400, nil, 20)
	title.x = w/2
	title.y = h*3/4
	title:setTextColor( 0,0,0)
	group:insert(title)

--Setup nav bar
    navBar = ui.newButton{
	default = "navBar.png",
	onRelease = scrollToTop
	}
	navBar.x = display.contentWidth*.5
	navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	group:insert(navBar)

	navHeader = display.newText("About", 0, 0, native.systemFontBold, 16)
	navHeader:setTextColor(255,255,255)
	navHeader.x = display.contentWidth*.5
	navHeader.y = navBar.y
	group:insert(navHeader)

--Setup the back button
	backBtn = ui.newButton{
	default = "backButton_over.png",
	over = "backButton_over.png",
	onRelease = backBtnRelease
	}
	backBtn.x = math.floor(backBtn.width/4) + screenOffsetW
	backBtn.y = navBar.y
	backBtn.alpha = 1
	group:insert(backBtn)


	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	backBtn:addEventListener ("touch", gotohome)
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene