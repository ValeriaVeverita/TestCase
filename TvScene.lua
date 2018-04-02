--Add composer library
local composer = require( "composer" )
local scene = composer.newScene()

local function changeScene(  )
    composer.gotoScene("Final", {effect = "fade", time= 1000})
end

-- create()
function scene:create( event )

    --require physics
    local physics = require("physics")
    physics.start()
    
    ----------------------------------------------------------------------------------------
    --!!PART 1 - LABYRINTH!!--
    ---------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------
    --LOCAL VARIABLES
    ----------------------------------------------------------------------------------------
    --create local variables(LABYRINTH)
    local bkg
    local mouse
    local cat
    local bkgSound
    local bkgChannel
    
    --create local variables(MATH)
    local background
    local questionObject
    local correctObject
    local incorrectObject
    local numericField
    local randomOperator

    local randomNumber1
    local randomNumber2

    local randomNumberMult1
    local randomNumberMult2

    local userAnswer
    local correctAnswer
    local round
    local floor
    local infoPannel
    local info
    local info2
    local book
    local correctMouse
    local incorrectCat
    local tellCorrect
    local points
    local counter = 0
    local cong
    local button
    local buttonText

    local sceneGroup = self.view
   
    ----------------------------------------------------------------------------------------------------------
    --OBJECT CREATION
    ---------------------------------------------------------------------------------------------------------
    --create the background
    bkg = display.newImageRect("Images/TvBackground.png", display.contentWidth+10, display.contentHeight+30)
    sceneGroup:insert(bkg)
    --set the position
    bkg.x = 510
    bkg.y = 380
     
    --create the object (mouse)
    mouse = display.newImage("Images/running mouse.png", 0, 0)
    mouse.isVisible = true
    sceneGroup:insert(mouse)
    --set the size and position of the mouse
    mouse:scale(0.2, 0.2)
    mouse.x = 60
    mouse.y = -200


   --create the object
   cat = display.newImage("Images/badCAt.png", 0, 0)
   cat.isVisible = true
   sceneGroup:insert(cat)
   --set the size and position of the cat
   cat.x = 60
   cat.y = -200
   cat:scale(-0.3, 0.3)
    ----------------------------------------------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------------------------------------------
    
    --Function: RunMouse
    --Description: mouse moves in the labyrinth 
    local function RunMouse( )
        transition.to(mouse, {y = 180, time = 1000 })
        transition.to(mouse, { x = 250, delay = 1000, time= 500})
        transition.to(mouse, { y = 250, delay = 1500, time= 500})
        transition.to(mouse, { y = 280, x = 90, delay = 2000, time = 1000})
        transition.to(mouse, { y = 500, delay = 3000, time = 1300})
        transition.to(mouse, {x = 630, delay = 4300, time = 1700})
        transition.to(mouse, {y = 580, delay = 6000, time = 500})
        transition.to(mouse, {x = 500, delay = 6500, time = 500})
        transition.to(mouse, {y = 700, delay = 7000, time = 700})
        transition.to(mouse, {x = 750, delay = 7700, time = 700})
        transition.to(mouse, {x = 920, y = 600, delay = 8400, time = 500})
        transition.to(mouse, {y = 750, delay = 8900, time = 500})
    end
    timer.performWithDelay(1000, RunMouse)

    --Function: RunCat
    --Description: cat moves in the labyrinth
    local function RunCat()
        transition.to(cat, {y = 180, time = 1000 })
        transition.to(cat, { x = 250, delay = 1000, time= 500})
        transition.to(cat, { y = 250, delay = 1500, time= 500})
        transition.to(cat, { y = 280, x = 90, delay = 2000, time = 1000})
        transition.to(cat, { y = 500, delay = 3000, time = 1300})
        transition.to(cat, {x = 630, delay = 4300, time = 1700})
        transition.to(cat, {y = 580, delay = 6000, time = 500})
    end
    timer.performWithDelay( 4300, RunCat)

    --Function: StartMath
    --Description: After a period of time some objects hide and the pannel and instruction display

     local function AddPhysics( )
       physics.addBody( round, {friction = 0.5, bounce = 0.3}) 
    end

    local function StartMath()
        bkg.isVisible = false
        cat.isVisible = false
        mouse.isVisible = false
        background.isVisible = true
        AddPhysics()
    end
    timer.performWithDelay(10500, StartMath)

   
    
    ------------------------------------------------------------------------------------------------------
    --!!PART 2 - MATH GAME!!--
    -----------------------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------
    --Function: DisplayInstruction
    --Description: the instruction appears
    local function DisplayInstruction()
        round.isVisible = false
        infoPannel.isVisible = true
        info.isVisible = true
        info2.isVisible = true
    end
    timer.performWithDelay(14500, DisplayInstruction)

    local function ShowEquation()
        infoPannel.isVisible = false
        info.isVisible = false
        info2.isVisible = false
        questionObject.isVisible = true
        numericField.isVisible = true
        points.isVisible = true
    end
    timer.performWithDelay(18500, ShowEquation)

    ------------------------------------------------------------------------------------------------------------------
    local function AskQuestion()
        --pich randomly the operator
        randomOperator = math.random(1,2)
        -- generate randomly an operation
        randomNumber1 = math.random(1,10)
        randomNumber2 = math.random(1,3)
        
        if (randomOperator == 1) then
           correctAnswer = randomNumber1^randomNumber2
            --create question in text object
            questionObject.text = randomNumber1 .. " ^ "..randomNumber2.." = "

        elseif (randomOperator == 2) then
            correctAnswer = randomNumber1*randomNumber1
            randomNumber1 = correctAnswer
            correctAnswer = math.sqrt(randomNumber1)
            --create question in text object
            questionObject.text = " √"..randomNumber1.." = "
        end
    end
    
    local function HideCorrect()
        correctObject.x = 2000
        correctObject.alpha = 0
        AskQuestion()
        correctMouse.x = 2000
        correctMouse.alpha = 0
        incorrectCat.x = -1000
        incorrectCat.alpha = 0
        incorrectObject.alpha = 0
        incorrectObject.x = -1000
        tellCorrect.isVisible = false
    end

    local function numericFieldListener( event )
        --User begins editing numeric field
        if (event.phase == "began" ) then

            --

        elseif (event.phase == "submitted") then
          --when the answer is submited set user's answer to a number
          userAnswer = tonumber(event.target.text)

            --if the user answer and the correct answer are the same
            if (userAnswer == correctAnswer ) then
                transition.to(correctObject, {x = display.contentWidth/1.63, alpha = 1, time = 1000})
                transition.to(correctMouse, {x = 750, alpha = 1, time = 1000})
                timer.performWithDelay(2000, HideCorrect)
                event.target.text = ""
                counter = counter + 1
                print("counter = " ..counter)
                points.text = "Points: "..counter

            else 
                transition.to(incorrectCat, { x = 300, alpha = 1, time = 1000})
                transition.to(incorrectObject, {x = 460, alpha = 1, time = 1000})
                event.target.text = ""
                timer.performWithDelay(2000, HideCorrect)
                tellCorrect.text = "Correct answer is "..correctAnswer
                tellCorrect.isVisible = true
            end

            if (counter == 5) then
              
              questionObject.isVisible = false
              numericField.isVisible = false
              points.isVisible = false
              infoPannel.isVisible = true
              correctMouse.isVisible = false
              correctObject.isVisible = false
              cong.isVisible = true
              buttonText.isVisible = true
              button.isVisible = true
            end

        end 
    end
    ----------------------------------
    --Object Creation
    -----------------------------------
    --create background
    background = display.newImageRect("Images/tv.jpg", display.contentWidth+30, display.contentHeight+10)
    sceneGroup:insert(background)
    background.isVisible = false
    --set the position of the background
    background. x = 500
    background.y = 380

    --create the text
    round = display.newText("Round 2", 500, -300, native.systemFontBold, 150)
    sceneGroup:insert(round)
    --set the color of the text
     round:setTextColor(0/255, 149/255, 126/255)
    

    --create the floor
    floor = display.newRect(500, 500, 800, 50)
    sceneGroup:insert(floor)
    physics.addBody( floor, "static", {friction = 0.5, bounce = 0.3})
    floor.alpha = 0

    --create info pannel
    infoPannel = display.newRect(500, 400, 600, 600)
    infoPannel.strokeWidth = 7
    sceneGroup:insert(infoPannel)
    infoPannel.isVisible = false
    --set the color of the pannel
    infoPannel:setFillColor(201/255, 206/255, 209/255)

    --create the information
    info = display.newText("Instruction", 506, 200, native.systemFontBold, 70)
    sceneGroup:insert(info)
    info.isVisible = false
    --set the color
    info:setTextColor(0/255, 149/255, 126/255)

    --create the information
    info2 = display.newText(" In order to get\nto the next level\n you must answer\n    five math\n    questions. ",505, 400, "Courier", 50)
    sceneGroup:insert(info2)
    info2.isVisible = false
    --set the color
    info2:setTextColor(0/255, 149/255, 126/255)

    -----------------------------------------------------------------------------------------------------------------------------------------------

    --displays a question
    questionObject = display.newText( "", 450, display.contentHeight/2-150, native.systemFontBold, 100 )
    questionObject:setTextColor(0 ,140/255, 149/255)
    questionObject.isVisible = false

    --create the correct text object 
    correctObject = display.newText("Correct", 2000, 400, "Georgia" , 60)
    correctObject:setTextColor(155/255, 42/255, 198/255)
    correctObject.alpha = 0

    --create numeric field
    numericField = native.newTextField( 700, display.contentHeight/2-150, 150, 80)
    sceneGroup:insert(numericField)
    numericField.input = "number"
    numericField.isVisible = false

    ----------------------------------------------------------------------------------------------------------------------------------------------------
     
    --create object
    correctMouse = display.newImage("Images/correctMouse.png", 0, 0)
    sceneGroup:insert(correctMouse)
    correctMouse:scale( 0.7, 0.7)
    correctMouse.alpha = 0
    --set the position
    correctMouse.x = 2000
    correctMouse.y = 600

    --create object
    incorrectCat = display.newImage("Images/incorrectCat.png", 0, 0)
    sceneGroup:insert(incorrectCat)
    incorrectCat.alpha = 0
    incorrectCat:scale(0.5, 0.5)
    --set the position
    incorrectCat.x = - 1000
    incorrectCat.y = 600

    --create object
    incorrectObject = display.newText("Incorrect", -1000, 450, "Georgia", 58)
    sceneGroup:insert(incorrectObject)
    incorrectObject.alpha = 0
    --set the color
    incorrectObject:setTextColor(0 ,140/255, 149/255)

    --create the text
    tellCorrect = display.newText ( "", 550, 300, "Georgia", 50 )
    sceneGroup:insert(tellCorrect)
    tellCorrect.isVisible = false
    --set the color
    tellCorrect: setTextColor (0 ,140/255, 149/255)

    --create text
    points = display.newText( "Points: 0", 530, 120, native.systemFontBold, 70)
    sceneGroup:insert(points)
    points.isVisible = false
    --set the color
    points:setTextColor( 0 ,140/255, 149/255 )

    --Create text
    cong = display.newText("Congratulations!\nPress the button\n    to continue.", 500, 350, native.systemFontBold, 70)
    sceneGroup:insert(cong)
    cong.isVisible = false
    --set the color
    cong:setTextColor(0 ,140/255, 149/255)

    --create the button
    button = display.newRoundedRect(500, 600, 200, 100, 10)
    sceneGroup:insert(button)
    button.isVisible = false
    --set the color
    button:setFillColor(0 ,140/255, 149/255)

    --create the text
    buttonText = display.newText("Next...", 500, 600, native.systemFontBold, 60)
    sceneGroup:insert(buttonText)
    buttonText.isVisible = false
    --set the color
    buttonText:setFillColor(201/255, 206/255, 209/255)

    -------------------------------------------------------------------------
    --add event listener

    numericField:addEventListener("userInput", numericFieldListener)    
    button:addEventListener("tap", changeScene)

    --call the function
    AskQuestion()

end 

scene:addEventListener( "create", scene )
-- -----------------------------------------------------------------------------------
 
return scene