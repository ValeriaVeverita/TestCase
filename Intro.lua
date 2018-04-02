--Add composer library
local composer = require( "composer" )
local scene = composer.newScene()



-- create()
function scene:create( event )

    --add physics library
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
    local fridge
    local questionObject
    local correctObject
    local incorrectObject
    local numericField
    local randomOperator

    local randomNumber1
    local randomNumber2

    local randomNumberMult1
    local randomNumberMult2

    local randomNumberAdd1
    local randomNumberAdd2

    local userAnswer
    local correctAnswer
    local round
    local floor
    local infoPannel
    local info
    local info2
    local cheese
    local correctMouse
    local incorrectCat
    local tellCorrect
    local points
    local counter = 0
    local cong
    local button
    local buttonText
    
    --variables for timer
    local totalSeconds = 10
    local secondsLeft = 10
    local clockText
    local countDownTimer

    local lives = 3
    local heart1
    local heart2
    local heart3
    local loseBackground


    local sceneGroup = self.view
   
    ----------------------------------------------------------------------------------------------------------
    --OBJECT CREATION
    ---------------------------------------------------------------------------------------------------------
    --create the background
    bkg = display.newImageRect("Images/kitchenBack.png", display.contentWidth+10, display.contentHeight+30)
    sceneGroup:insert(bkg)
    --set the position
    bkg.x = 510
    bkg.y = 385
     
    --create the object (mouse)
    mouse = display.newImage("Images/running mouse.png", 0, 0)
    mouse.isVisible = true
    sceneGroup:insert(mouse)
    --set the size and position of the mouse
    mouse:scale(0.25, 0.25)
    mouse.x = 30
    mouse.y = 900

   --create the object
   cat = display.newImage("Images/badCAt.png", 0, 0)
   cat.isVisible = true
   sceneGroup:insert(cat)
   --set the size and position of the cat
   cat:scale(0.3, 0.3)
   cat.x = 100
   cat.y = 900
   
    ----------------------------------------------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------------------------------------------
    
    --Function: RunMouse
    --Description: mouse moves in the labyrinth 
    local function RunMouse()
        transition.to(mouse, {y = 50, time = 2000})
        transition.to(mouse,{x = 900, time = 2000, delay = 2000})
        transition.to(mouse, {y = 530, time = 1500, delay = 4000})
        transition.to(mouse, {x = 270, time = 1500, delay = 5500})
        transition.to(mouse, { y = 230, time = 1000, delay = 7000})
        transition.to(mouse, {x = 650, time = 1000, delay = 8000})
        transition.to(mouse, {y = 430, time = 500, delay = 9000})
        transition.to(mouse, {x = 470, time = 300, delay = 9500})
        transition.to(mouse, {y = 390, time = 100, delay = 9800})
    end
    timer.performWithDelay(1000, RunMouse)   

    --Function: RunCat
    --Description: cat moves in the labyrinth
    local function RunCat()
        transition.to(cat, {y = 50, time = 2000})
        transition.to(cat,{x = 1000, time = 2000, delay = 2000})
        transition.to(cat, {y = 530, time = 1500, delay = 4000})
        transition.to(cat, {x = 350, time = 1500, delay = 5500})
        transition.to(cat, { y = 230, time = 1000, delay = 7000})
        transition.to(cat, {x = 700, time = 1000, delay = 8000})
        transition.to(cat, {y = 430, time = 500, delay = 9000})
    end
    timer.performWithDelay(5500, RunCat)

    --Function: StartMath
    --Description: After a period of time some objects hide and the pannel and instruction display
     local function AddPhysics( )
       physics.addBody( round, {friction = 0.5, bounce = 0.3}) 
    end
    local function StartMath(  )
        mouse.isVisible = false
        cat.isVisible = false
        background.isVisible = true
        fridge.isVisible = true
        AddPhysics()
    end

     timer.performWithDelay(11000, StartMath)

    ------------------------------------------------------------------------------------------------------
    --!!PART 2 - MATH GAME!!--
    -----------------------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------

   local function ReplaceTimer()
      secondsLeft = totalSeconds
   end

   local function UpdateHearts() 
        if ( lives == 1 ) then
          heart1.isVisible = false
       elseif ( lives == 2 ) then
          heart2.isVisible = false
        elseif ( lives == 0 ) then
           heart3.isVisible = false
          numericField.isVisible = false  
        end
   end

    --Function: DisplayInstruction
    --Description: the instruction appears
    local function DisplayInstruction()
        round.isVisible = false
        infoPannel.isVisible = true
        info.isVisible = true
        info2.isVisible = true
    end
    timer.performWithDelay(14500, DisplayInstruction)

    local function MoveCheese( )
        transition.to(cheese, {alpha = 1, xScale = -1, yScale = 1, time = 1000, x = 500, y = 400})
         infoPannel.isVisible = false
        info.isVisible = false
        info2.isVisible = false

    end
   timer.performWithDelay(19000, MoveCheese)

    local function ShowEquation()
       
        questionObject.isVisible = true
        numericField.isVisible = true
        points.isVisible = true
        heart1.isVisible = true
        heart2.isVisible = true
        heart3.isVisible = true
        clockText.isVisible = true
    end
    timer.performWithDelay(20000, ShowEquation)

    ------------------------------------------------------------------------------------------------------------------
    local function AskQuestion()
        --generate randomly an operation
        randomOperator = math.random(1,6)
        -- generate randomly 2 numbers
        randomNumber1 = math.random(1,10)
        randomNumber2 = math.random(1,3)
        --generate randomly 2 numbers
        randomNumberAdd1 = math.random(0,20)
        randomNumberAdd2 = math.random(0,20)
        --generate 2 random numbers
        randomNumberMult1 = math.random(1, 10)
        randomNumberMult2 = math.random(1, 10)
        
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

        elseif(randomOperator == 3) then

            correctAnswer = randomNumberAdd1 + randomNumberAdd2

          --create question in text object
          questionObject.text = randomNumberAdd1 .. " + " .. randomNumberAdd2 .. " = "

        elseif (randomOperator == 4) then
            correctAnswer = randomNumberAdd1 - randomNumberAdd2
            --create question in text object
            questionObject.text = randomNumberAdd1 .. " - "..randomNumberAdd2.." = "
             if(correctAnswer < 0) then
                correctAnswer = randomNumberAdd2 - randomNumberAdd1
                --create question in text object
                questionObject.text = randomNumberAdd2 .. " - "..randomNumberAdd1.." = "
            end

        elseif ( randomOperator == 5) then
            correctAnswer = randomNumberMult1 * randomNumberMult2
            --create question in text object
            questionObject.text = randomNumberMult1 .. " * ".. randomNumberMult2 .. " = "

        elseif(randomOperator == 6) then
            correctAnswer = randomNumberMult1 * randomNumberMult2
            randomNumberMult1 = correctAnswer
            correctAnswer = randomNumberMult1/randomNumberMult2
            --create question in text object
            questionObject.text = randomNumberMult1.." / "..randomNumberMult2.." = "
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
                timer.performWithDelay(2000, ReplaceTimer)

            else 
                transition.to(incorrectCat, { x = 300, alpha = 1, time = 1000})
                transition.to(incorrectObject, {x = 460, alpha = 1, time = 1000})
                event.target.text = ""
                timer.performWithDelay(2000, HideCorrect)
                tellCorrect.text = "Correct answer is "..correctAnswer
                tellCorrect.isVisible = true
                lives = lives - 1
                UpdateHearts()
                timer.performWithDelay(2000, ReplaceTimer)
            end

            if (counter == 5) then
              
              questionObject.isVisible = false
              numericField.isVisible = false
              points.isVisible = false
              infoPannel.isVisible = true
              correctMouse.isVisible = false
              correctObject.isVisible = false
              
            end

        end 
    end
    
    
    local function UpdateTime( )
    
      --decrement the number of seconds
      secondsLeft = secondsLeft - 1

       --display the number of seconds left in the clock object
       clockText.text = secondsLeft .. ""

        if (secondsLeft == 0 ) then
          --reset the number of seconds left
           secondsLeft = totalSeconds
           lives = lives - 1
           UpdateHearts()
           --***CALL THE FUNCTION TO ASK A NEW QUESTION
          AskQuestion()
       end
   end

   --function that calls the timer
    local function StartTimer()
      --create a countdown timer that loops infinitely
      countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
   end
    ----------------------------------
    --Object Creation
    -----------------------------------
    --create background
    background = display.newImageRect("Images/background.jpg", display.contentWidth, display.contentHeight+10)
    sceneGroup:insert(background)
    background.isVisible = false
    --set the position
    background.x = 510
    background.y = 380

    --create the fridge
   fridge = display.newImage("Images/openFridge.png", 0, 0)
   sceneGroup:insert(fridge)
   fridge.isVisible = false
   --set the size and position
   fridge:scale(0.23, 0.23)
   fridge.x = 230
   fridge.y = 400

   --create the pannel
   infoPannel = display.newRect(500, 400, 650, 600)
   infoPannel.strokeWidth = 7
   sceneGroup:insert(infoPannel)
   infoPannel.isVisible = false
  --set the color of the pannel
   infoPannel:setFillColor(249/255, 228/255, 157/255)
   infoPannel:setStrokeColor(255/255, 170/255, 14/255)

    --create the text
    info = display.newText("Instruction", 510, 170, native.systemFontBold, 70)
    sceneGroup:insert(info)
    info.isVisible = false
    --set the color
    info:setTextColor(0 ,140/255, 149/255)

    --create text
    info2 = display.newText("This is last level. If you\nanswer 5 question, you'll\nwin the game. If you get\none question wrong you'll\nlose one life. You have\n10 seconds to answer each\nquestion. If you run out\nof time you also lose one\n           life.\n\n              Good Luck!  ",505, 450, "Courier", 40)
    sceneGroup:insert(info2)
    info2.isVisible = false
    --set the color
    info2:setTextColor(0 ,140/255, 149/255)

    --create Text
    round = display.newText("Round 3", 250, -200, native.systemFontBold, 150)
    sceneGroup:insert(round)
    --anchor the text and set the color
    round.anchorX = 0
    round:setTextColor(0 ,140/255, 149/255)
    

    --create floor
    floor = display.newRect(500, 500, 800, 70)
    sceneGroup:insert(floor)
    floor.isVisible = false
    floor.alpha = 0
    --add physics to the object
    physics.addBody( floor, "static", {friction = 0.5, bounce = 0.3})

    --create image
    cheese = display.newImage("Images/cheese.png", 0, 0)
    sceneGroup:insert(cheese)
    cheese.alpha = 0
    --set the position of the image
    cheese.x = 100
    cheese.y = 400
    cheese:scale(-0.2, 0.2)


    -------------------------------------------------------------------------
   
   --displays a question
    questionObject = display.newText( "", 450, display.contentHeight/2+50, native.systemFontBold, 100 )
    questionObject:setTextColor(0 ,140/255, 149/255)
    questionObject.isVisible = false

    --create the correct text object 
    correctObject = display.newText("Correct", 2000, 200, "Georgia" , 60)
    correctObject:setTextColor(155/255, 42/255, 198/255)
    correctObject.alpha = 0

    --create numeric field
    numericField = native.newTextField( 700, display.contentHeight/2+50, 150, 80)
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
    correctMouse.y = 400

    --create object
    incorrectCat = display.newImage("Images/incorrectCat.png", 0, 0)
    sceneGroup:insert(incorrectCat)
    incorrectCat.alpha = 0
    incorrectCat:scale(0.5, 0.5)
    --set the position
    incorrectCat.x = - 1000
    incorrectCat.y = 300

    --create object
    incorrectObject = display.newText("Incorrect", -1000, 150, "Georgia", 58)
    sceneGroup:insert(incorrectObject)
    incorrectObject.alpha = 0
    --set the color
    incorrectObject:setTextColor(0 ,140/255, 149/255)

    --create the text
    tellCorrect = display.newText ( "", 550, 500, "Georgia", 50 )
    sceneGroup:insert(tellCorrect)
    tellCorrect.isVisible = false
    --set the color
    tellCorrect: setTextColor (0 ,140/255, 149/255)

    --create text
    points = display.newText( "Points: 0", 530, 350, native.systemFontBold, 70)
    sceneGroup:insert(points)
    points.isVisible = false
    --set the color
    points:setTextColor( 0 ,140/255, 149/255 )

   -------------------------------------------------------------------------------------------------------------
    --create the first live
    heart1 = display.newImageRect("Images/heart.png", 100, 100)
    heart1.isVisible = false
    sceneGroup:insert(heart1)
   heart1.x = display.contentWidth * 5/8
   heart1.y = display.contentHeight * 1 / 7

    --create the second live
   heart2 = display.newImageRect("Images/heart.png", 100, 100)
   heart2.isVisible = false
   sceneGroup:insert(heart2)
   heart2.x = display.contentWidth * 4 /8
   heart2.y = display.contentHeight * 1 / 7

    --create the second live
    heart3 = display.newImageRect("Images/heart.png", 100, 100)
    heart3.isVisible = false
    sceneGroup:insert(heart3)
    heart3.x = display.contentWidth * 6 /8
    heart3.y = display.contentHeight * 1 / 7

    --create the timer text
   clockText = display.newText("", 500, 600, nil, 150)
   sceneGroup:insert(clockText)
   clockText:setTextColor(0 ,140/255, 149/255)
   
    -------------------------------------------------------------------------
    --add event listener

    numericField:addEventListener("userInput", numericFieldListener)    
   

    --call the function
    AskQuestion()
   timer.performWithDelay(19000, StartTimer)
    
    
end 

scene:addEventListener( "create", scene )
-- -----------------------------------------------------------------------------------
 
return scene