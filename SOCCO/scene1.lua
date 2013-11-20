----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local w , h = display.contentWidth , display.contentHeight
display.setStatusBar( display.TranslucentStatusBar)
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

function gotoproducts (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene4" )
    end
end


function left (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene5" )
	end
end

function gotocontact (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "scene6" )
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view
	display.setStatusBar( display.TranslucentStatusBar)
	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	background = display.newRect(0, 0, w, h)
	background:setFillColor( 0,0,0)
	group:insert(background)


	logomessage = display.newImage( "logo.png", 250, 250, nil, 30)
	logomessage.x = w/2
	logomessage.y = h/4
	group:insert(logomessage)

	products = display.newRect(w* 1/8, h*4/8, w*3/4, h/8)
	products:setFillColor(0,150,255)
	group:insert(products)

	productsmessage = display.newText( "Products", 250, 250, nil, 15)
	productsmessage.x = w/2
	productsmessage.y = h*18/32
	group:insert(productsmessage)

	about = display.newRect(w* 1/8, h*21/32, w*3/4, h/8)
	about:setFillColor(0,150,255)
	group:insert(about)

	aboutmessage = display.newText( "About", 250, 250, nil, 15)
	aboutmessage.x = w/2
	aboutmessage.y = h*23/32
	group:insert(aboutmessage)

	contact = display.newRect(w* 1/8, h*26/32, w*3/4, h/8)
	contact:setFillColor(0,150,255)
	group:insert(contact)
	contactmessage = display.newText( "Contact", 250, 250, nil, 15)
	contactmessage.x = w/2
	contactmessage.y = h*28/32
	group:insert(contactmessage)



	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)


	products:addEventListener ("touch", gotoproducts)
	about:addEventListener ("touch", left)
	contact:addEventListener ("touch", gotocontact)
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