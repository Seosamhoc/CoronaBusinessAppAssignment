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

function gotoGalaxies (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "galaxies" )
    end
end

function gotoplanets (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "planets" )
    end
end

function gotoMoonsOfSaturn (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "moonsOfSaturn" )
    end
end

function gotocoffee (event)
	if event.phase == "ended" then
	storyboard.gotoScene( "coffee" )
    end
end


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
	
	background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
	group:insert(background)


	Galaxies = display.newRect(w*3/24, h/4, w/3, w/3)
	Galaxies:setFillColor(0,150,255)
	group:insert(Galaxies)

	Galaxiesmessage = display.newText( "Galaxies", 250, 250, nil, 12)
	Galaxiesmessage.x = w*7/24
	Galaxiesmessage.y = h/4+w/6
	group:insert(Galaxiesmessage)

	planets = display.newRect(w*13/24, h/4, w/3, w/3)
	planets:setFillColor(0,150,255)
	group:insert(planets)

	planetsmessage = display.newText( "Planets", 250, 250, nil, 12)
	planetsmessage.x = w*17/24
	planetsmessage.y = h/4+w/6
	group:insert(planetsmessage)

	moonsOfSaturn = display.newRect(w* 3/24, h*25/32-w/3, w/3, w/3)
	moonsOfSaturn:setFillColor(0,150,255)
	group:insert(moonsOfSaturn)

	moonsOfSaturnmessage = display.newText( "Moons Of Saturn", 250, 250, nil, 12)
	moonsOfSaturnmessage.x = w*7/24
	moonsOfSaturnmessage.y = h*25/32-w/6
	group:insert(moonsOfSaturnmessage)

	coffee = display.newRect(w* 13/24, h*25/32-w/3, w/3, w/3)
	coffee:setFillColor(0,150,255)
	group:insert(coffee)
	coffeemessage = display.newText( "Coffee", 250, 250, nil, 12)
	coffeemessage.x = w*17/24
	coffeemessage.y = h*25/32-w/6
	group:insert(coffeemessage)

--Setup nav bar
    navBar = ui.newButton{
	default = "navBar.png",
	onRelease = scrollToTop
	}
	navBar.x = display.contentWidth*.5
	navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	group:insert(navBar)

	navHeader = display.newText("Categories", 0, 0, native.systemFontBold, 16)
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
	backBtn.x = math.floor(backBtn.width/2) + screenOffsetW/2
	backBtn.y = navBar.y
	backBtn.alpha = 1
	group:insert(backBtn)
	print(backBtn.width/2)
	print(screenOffsetW)

	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)

	Galaxies:addEventListener ("touch", gotoGalaxies)
	planets:addEventListener ("touch", gotoplanets)
	moonsOfSaturn:addEventListener ("touch", gotoMoonsOfSaturn)
	coffee:addEventListener ("touch", gotocoffee)

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