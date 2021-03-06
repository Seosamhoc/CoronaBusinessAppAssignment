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
	storyboard.purgeScene("galaxies")
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
	data[1].title = "Milkyway"
	data[1].subtitle = "Our most conveniently located!"
	data[1].image = "galaxy1.jpg"
	data[1].description = "You are here! No need for a lengthy description, take a look around! Ownership of a galaxy does NOT guarantee ownership or obedience of entities within said galaxy!"
	data[1].price = "1 galactic currency unit"
	data[1].type = "galaxy"

	data[2] = {}
	data[2].title = "Sombrero Galaxy"
	data[2].subtitle = "Our finest hat themed galaxy!"
	data[2].image = "galaxy2.jpg"
	data[2].description = "If you base all your purchasing decisions on the item's similarity to hats then this is the perfect galaxy for you! Ownership of a galaxy does NOT guarantee ownership or obedience of entities within said galaxy!"
	data[2].price = "3 galactic currency units"
	data[2].type = "galaxy"

	data[3] = {}
	data[3].title = "Andromeda"
	data[3].subtitle = "A relatively short distance from here!"
	data[3].image = "galaxy3.jpg"
	data[3].description = "Our nearest spiral neighbour. With a trillion stars the bright decision is to buy this galaxy now! Ownership of a galaxy does NOT guarantee ownership or obedience of entities within said galaxy!"
	data[3].price = "0.9 galactic currency units"
	data[3].type = "galaxy"

	data[4] = {}
	data[4].title = "NGC_5879"
	data[4].subtitle = "One of our beautiful spiral galaxies!"
	data[4].image = "galaxy4.jpg"
	data[4].description = "Ah NGC_5879, the poets tell tale of your beauty! Ownership of a galaxy does NOT guarantee ownership or obedience of entities within said galaxy!"
	data[4].price = "0.7 galactic currency units"
	data[4].type = "galaxy"

	data[5] = {}
	data[5].title = "M101"
	data[5].subtitle = "AKA the Pinwheel galaxy. Very spacious!"
	data[5].image = "galaxy5.jpg"
	data[5].description = "70% larger than the Milkyway! If you're looking for space look no further! Ownership of a galaxy does NOT guarantee ownership or obedience of entities within said galaxy!"
	data[5].price = "2 galactic currency units"
	data[5].type = "galaxy"

	data[6] = {}
	data[6].title = "Ngc5907"
	data[6].subtitle = "AKA Splinter galaxy. Low metallicity!"
	data[6].image = "galaxy6.jpg"
	data[6].description = "NGC 5907, the Splinter or Knife Edge galaxy. Don't let that name fool you though this is THE galaxy to buy TODAY for low metallicity! Ownership of a galaxy does NOT guarantee ownership or obedience of entities within said galaxy!"
	data[6].price = "1.1 galactic currency units"
	data[6].type = "galaxy"

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



--Add a white background to the list.  

	listBackground = display.newRect( 0, 0, myList.width, myList.height )
	listBackground:setFillColor(255,255,255)
	myList:insert(1,listBackground)

--Setup nav bar
    navBar = ui.newButton{
	default = "navBar.png",
	onRelease = scrollToTop
	}
	navBar.x = display.contentWidth*.5
	navBar.y = math.floor(display.screenOriginY + navBar.height*0.5)
	group:insert(navBar)

	navHeader = display.newText("Galaxies", 0, 0, native.systemFontBold, 16)
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