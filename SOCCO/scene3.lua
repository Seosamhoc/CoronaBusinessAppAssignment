----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local ui = require("ui")
local screenOffsetW, screenOffsetH = display.contentWidth - display.viewableContentWidth, display.contentHeight - display.viewableContentHeight
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
display.setStatusBar( display.HiddenStatusBar)
local w , h = display.viewableContentWidth , display.viewableContentHeight
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




-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
		local params = event.params
      	  print(params.var1)
      	  print(params.var2)
      	  print(params.var3)
      	  print(params.var5)

function gotolist (event)
	if event.phase == "ended" then
		if params.var5 == "galaxy" then
			storyboard.purgeScene("scene3")
			storyboard.gotoScene( "galaxies" )
		elseif params.var5 == "planet" then
			storyboard.purgeScene("scene3")
			storyboard.gotoScene( "planets" )
		elseif params.var5 == "moon" then
			storyboard.purgeScene("scene3")
			storyboard.gotoScene( "moonsOfSaturn" )
		elseif params.var5 == "coffee" then
			storyboard.purgeScene("scene3")
			storyboard.gotoScene( "coffee" )
		end
    end
end

	logomessage = display.newImage( params.var3, 250, 250, nil, 30)
	logomessage.x = w/2
	logomessage.y = h/4
	group:insert(logomessage)

    message = display.newText( params.var1 .. " ".. params.var4 .. " Price: " .. params.price , 0, 0, w+0.5, 283, nil, 20 )
	message.x = display.contentWidth/2
	message.y = display.contentHeight * 11/16
	group:insert(message)

--Setup nav bar
    navBar = ui.newButton{
	default = "navBar.png",
	onRelease = scrollToTop
	}
	navBar.x = display.contentWidth*.5
	navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	group:insert(navBar)

	navHeader = display.newText(params.var1, 0, 0, native.systemFontBold, 16)
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
	backBtn.x = math.floor(backBtn.width/2 + screenOffsetW/2)
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
	backBtn:addEventListener ("touch", gotolist)

 

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