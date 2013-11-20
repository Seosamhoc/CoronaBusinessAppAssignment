----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local tableView = require("tableView")
local ui = require("ui") 
display.setStatusBar( display.HiddenStatusBar ) 
local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight
local topBoundary = display.screenOriginY + 40
local bottomBoundary = display.screenOriginY + 0

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
function listButtonRelease( event )
	self = event.target -- the target is the row 
	local id = self.id  -- this is the row id in the table

	--print(self.data.title) -- the rows data.title
    --print(self.data.subtitle) -- the rows data.subtitle
    --print(self.data.image) -- the rows data.image
    --print(self.data.description)
		
	local options =
	{
    params =
   		 {
      	  var1 = self.data.title,
      	  var2 = self.data.subtitle,
      	  var3 = self.data.image,
      	  var4 = self.data.description,
      	  price = self.data.price,
      	  var5 = self.data.type
  		 }
	}

	storyboard.gotoScene( "scene3", options )

end

local function scrollToTop()
	myList:scrollTo(topBoundary)
end

function gotoproducts (event)
	if event.phase == "ended" then
	storyboard.purgeScene("planets")
	storyboard.gotoScene( "scene4" )
    end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view


	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
		background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
	background:setFillColor(77, 77, 77)
	group:insert(background)
 
--setup the table
	data = {}  


--setup a color fill for selected items
	selected = display.newRect(0, 0, 50, 50)  --add acolor fill to show the selected item
	selected:setFillColor(67,141,241,180)  --set the color fill to light blue
	selected.isVisible = false  --hide color fill until needed
	group:insert(selected)

--setup each row as a new table, then add title, subtitle, and image
	data[1] = {}
	data[1].title = "Mercury"
	data[1].subtitle = "Perfect for sun lovers!"
	data[1].image = "planet1.jpg"
	data[1].description = "Looking to catch some sun? Then consider this planet, the closest of all to the sun!"
	data[1].price = "0.6 planetary currency units"
	data[1].type = "planet"

	data[2] = {}
	data[2].title = "Venus"
	data[2].subtitle = "Hot, hot, hotest planet in the solar system!"
	data[2].image = "planet2.jpg"
	data[2].description = "Do you love carbon dioxide? Do you value your privacy? Then this could be the planet for you! The atmosphere is 96% CO2 and clouds of sulpheric acid act like a curtain for your privacy. What's not to love!?"
	data[2].price = "0.7 planetary currency units"
	data[2].type = "planet"

	data[3] = {}
	data[3].title = "Earth"
	data[3].subtitle = "Watery planet with life"
	data[3].image = "planet3.jpg"
	data[3].description = "This planet is currently occupied with all sorts of life. But it's otherwise quite nice."
	data[3].price = "0.1 planetary currency untis"
	data[3].type = "planet"

	data[4] = {}
	data[4].title = "Mars"
	data[4].subtitle = "Planet (RED)"
	data[4].image = "planet4.jpg"
	data[4].description = "We wanted to give something back, so as part of the product (RED) initiative, if you buy the (RED) planet 50% of the proceeds go to fight aids."
	data[4].price = "0.5 planetary currency units"
	data[4].type = "planet"

	data[5] = {}
	data[5].title = "Jupiter"
	data[5].subtitle = "The largest planet we have on sale!"
	data[5].image = "planet5.jpg"
	data[5].description = "Primarily composed of hydrogen, with a quater of it's mass composed of helium. If you're looking for mass buy now, this planey is 2.5 times more massive than all the other planets combined!"
	data[5].price = "5 planetary currency units"
	data[5].type = "planet"

	data[6] = {}
	data[6].title = "Saturn"
	data[6].subtitle = "The lord of the rings!"
	data[6].image = "planet6.jpg"
	data[6].description = "If you want it we've put a ring on it! Show off the most impressive rings in the galaxy by being the proud owner of Saturn. If planetary ownership is out of your price range check out our moons of Saturn section, or try our coffees!"
	data[6].price = "4 planetary currency units"
	data[6].type = "planet"

	data[7] = {}
	data[7].title = "Uranus"
	data[7].subtitle = "Chill out here"
	data[7].image = "planet7.jpg"
	data[7].description = "The coldest planetary atmosphere in the Solar System, with a minimum temperature of 49 K, and has a complex, layered cloud structure, with water thought to make up the lowest clouds, and methane the uppermost layer of clouds."
	data[7].price = "0.6 planetary currency units"
	data[7].type = "planet"

	data[8] = {}
	data[8].title = "Neptune"
	data[8].subtitle = "Farthest from the sun"
	data[8].image = "planet8.jpg"
	data[8].description = "It's atmosphere is notable for its active and visible weather patterns. These weather patterns are driven by the strongest sustained winds of any planet in the Solar System, with recorded wind speeds as high as 2,100 kilometres per hour."
	data[8].price = "0.8 planetary currency units"
	data[8].type = "planet"

-- create the list of items
	myList = tableView.newList{
	data=data, --A table containing elements that the list can iterate through to display in each row.
	default="listItemBg.png", --An image for the row background. Defines the hit area for the touch.
	over="listItemBg_over.png", --An image that will show on touch.
	onRelease=listButtonRelease, --A function name that defines the action to take after a row is tapped.
	top=topBoundary, --The upper boundary of the list. The list will start and snap back to this position.
	bottom=bottomBoundary, --The bottom boundary of the list. The list will snap back to this position when scrolled upward.
	
	-- callback = A function that defines how to display the data in each row. Each element in the data table will be used in place of the 
    -- argument ("item")  assigned to the callback function. 
    callback = function( row ) 
                         local g = display.newGroup()

                         local img = display.newImage(row.image)
                         g:insert(img)
                         img.x = math.floor(img.width*0.5 + 6)
                         img.y = math.floor(img.height*0.5) 

                         local title =  display.newText( row.title, 0, 0, 130.5, 20.5, native.systemFontBold, 14 )
                         title:setTextColor(0, 0, 0)
                         g:insert(title)
                         title.x = math.floor(title.width*0.5 + img.width + 6)
                         title.y = 30

                         local subtitle =  display.newText( row.subtitle, 0, 0, 130.5, 30.5, native.systemFont, 12 )
                         subtitle:setTextColor(80,80,80)
                         g:insert(subtitle)
                         subtitle.x = math.floor(subtitle.width*0.5 + img.width + 6)
                         subtitle.y = math.floor(title.y + title.height + 6)

                         return g  


                  end 
	}
	group:insert(myList)



--Setup the nav bar 
	navBar = ui.newButton{
	default = "navBar.png",
	onRelease = scrollToTop
	}
	navBar.x = display.contentWidth*.5
	navBar.y = math.floor(display.screenOriginY + navBar.height*0.5) -- screenOriginY is used in cases like iphone 5 where borders are added to screen
	group:insert(navBar)

	navHeader = display.newText("Planets", 0, 0, native.systemFontBold, 16)
	navHeader:setTextColor(255, 255, 255)
	navHeader.x = display.contentWidth*.5
	navHeader.y = navBar.y
	group:insert(navHeader)

--Add a white background to the list.  

	listBackground = display.newRect( 0, 0, myList.width, myList.height )
	listBackground:setFillColor(255,255,255)
	myList:insert(1,listBackground)



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



	backBtn:addEventListener ("touch", gotoproducts)

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