--Add composer library
local composer = require( "composer" )
local scene = composer.newScene()


local function changeScene()
    composer.gotoScene("TvScene", {effect="fade", time = 1000})
end
local function changeScene( )
  composer.gotoScene("LibLab", {effect = "fade", time = 1000 })
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
    bkg = display.newImageRect("Images/libFloor.png", display.contentWidth+10, display.contentHeight+30)
    sceneGroup:insert(bkg)
    --set the position
    bkg.x = 510
    bkg.y = 380
     
    --create the object (mouse)
    mouse = display.newImage("Images/running mouse.png", 0, 0)
    mouse.isVisible = true
    sceneGroup:insert(mouse)
    --set the size and position of the mouse
    mouse:scale(-0.25, 0.25)
    mouse.x = display.contentWidth+200
    mouse.y = 20

   --create the object
   cat = display.newImage("Images/badCAt.png", 0, 0)
   cat.isVisible = true
   sceneGroup:insert(cat)
   --set the size and position of the cat
   cat.x = display.contentWidth + 200
   cat.y = 20
   cat:scale(-0.35, 0.35)
    ----------------------------------------------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------------------------------------------
    
    --Function: RunMouse
    --Description: mouse moves in the labyrinth

    local function RunMouse(  )
        transition.to (mouse, { x = display.contentWidth - 200, y = 20, time = 1000})
        transition.to(mouse, { delay = 1000, x = display.contentWidth - 80, y = 100, time = 500 })
        transition.to(mouse, {delay = 1500,  x = display.contentWidth, y = 250, time = 500})
        transition.to (mouse, {delay = 2000, x = display.contentWidth/2+220, y = 250, time = 1000})
        transition.to(mouse, {delay = 3000, x= display.contentWidth/2+50, y = 150, time = 500})
        transition.to(mouse, {delay = 3500, x = display.contentWidth/2, y = 120, time = 200})
        transition.to(mouse, {delay = 3700, x = display.contentWidth/2, y = 100, time= 100})
        transition.to(mouse, {delay = 3800, x = display.contentWidth/2-50, time = 100})
        transition.to(mouse, {delay = 3900, y = 50, time = 100})
        transition.to(mouse, {delay = 4000, x = display.contentWidth/2-250, time = 500})
        transition.to(mouse, {delay = 4500, x = display.contentWidth/2 - 100, y = 270, time = 900})
        transition.to(mouse, {delay = 5400, x = 250, y = 380, time = 400})
        transition.to(mouse, {delay = 5800, x = 300, y = 400, time = 200})
        transition.to(mouse, {delay = 6000, y = 700, time = 1000})
        transition.to (mouse , {delay = 7000, x = 50, time = 1000})
    end
    timer.performWithDelay(1000, RunMouse)

    --Function: RunCat
    --Descrption: cat moves in the labyrinth
    local function RunCat()
      transition.to(cat, {  x = display.contentWidth - 200, y = 20, time = 1000})
      transition.to(cat, { delay = 1000, x = display.contentWidth - 80, y = 100, time = 500 })
        transition.to(cat, {delay = 1500,  x = display.contentWidth, y = 250, time = 500})
        transition.to (cat, {delay = 2000, x = display.contentWidth/2+220, y = 250, time = 1000})
        transition.to(cat, {delay = 3000, x= display.contentWidth/2+50, y = 150, time = 500})
        transition.to(cat, {delay = 3500, x = display.contentWidth/2, y = 120, time = 200})
        transition.to(cat, {delay = 3700, x = display.contentWidth/2, y = 100, time= 100})
        transition.to(cat, {delay = 3800, x = display.contentWidth/2-50, time = 100})
        transition.to(cat, {delay = 3900, y = 50, time = 100})
        transition.to(cat, {delay = 4000, x = display.contentWidth/2-250, time = 500})
        transition.to(cat, {delay = 4500, x = display.contentWidth/2 - 100, y = 270, time = 900})
    end
    timer.performWithDelay( 3500, RunCat)

    --Function: StartMath
    --Description: after a period of time labyrinth and objects hide, and math part is displayed
    local function StartMath()
        cat.isVisible = false
        mouse.isVisible = false
        background.isVisible = true
        floor.is = true
        round.isVisible = true
    end

    timer.performWithDelay(9100, StartMath)
    
    ------------------------------------------------------------------------------------------------------
    --!!PART 2 - MATH GAME!!--
    -----------------------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------------------------
    --LOCAL FUNCTIONS
    ----------------------------------------------------------------------------------------------------------

     --Fucntion: DisplayInstruction
    --Description: the instruction of the first  round appears
    local function DisplayInstruction()
        round.isVisible = false
        infoPannel.isVisible = true
        info.isVisible = true
        info2.isVisible = true
    end

    timer.performWithDelay(13000, DisplayInstruction)


    local function DisplayMath()
        infoPannel.isVisible = false
        info.isVisible = false
        info2.isVisible = false
        transition.to(book, {alpha = 1, time = 500})
    end

    timer.performWithDelay(17000, DisplayMath)

    local function ShowEquation()
        questionObject.isVisible = true
        numericField.isVisible = true
        points.isVisible = true
    end

    timer.performWithDelay(17500, ShowEquation)

    ---------------------------------------------------------------------------------------------------------------
    local function AskQuestion(  )
        --generate randomly an opeartion
        randomOperator = math.random(1, 4)
        -- generate 2 random numbers
        randomNumber1 = math.random(0, 20)
        randomNumber2 = math.random(0, 20)

        --generate 2 random numbers
          randomNumberMult1 = math.random(0, 10)
          randomNumberMult2 = math.random(0, 10)
         
        if (randomOperator == 1) then
          correctAnswer = randomNumber1 + randomNumber2

          --create question in text object
          questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

        elseif (randomOperator == 2) then
            correctAnswer = randomNumber1 - randomNumber2
            --create question in text object
            questionObject.text = randomNumber1 .. " - "..randomNumber2.." = "
             if(correctAnswer < 0) then
                correctAnswer = randomNumber2 - randomNumber1
                --create question in text object
                questionObject.text = randomNumber2 .. " - "..randomNumber1.." = "
            end

        elseif ( randomOperator == 3) then
            correctAnswer = randomNumberMult1 * randomNumberMult2
            --create question in text object
            questionObject.text = randomNumberMult1 .. " * ".. randomNumberMult2 .. " = "

        elseif(randomOperator == 4) then
            correctAnswer = randomNumberMult1 * randomNumberMult2
            randomNumberMult1 = correctAnswer
            correctAnswer = randomNumberMult1/randomNumberMult2
            --create question in text object
            questionObject.text = randomNumberMult1.." / "..randomNumberMult2.." = "
        
        end

    end
    
    local function HideCorrect( )
        correctObject.x = 2000
        correctObject.alpha = 0
        AskQuestion()
        correctMouse.x  = 2000
        correctMouse.alpha = 0
        incorrectCat.x = -1000
        incorrectObject.x = -1000
        incorrectCat.alpha = 0
        incorrectObject.alpha = 0
        tellCorrect.isVisible = false
    end

    local function numericFieldListener( event )
        --User begins editing "numericField"
        if(event.phase == "began" ) then
            --clear text field
            

        elseif event.phase == "submitted" then
            --when the answer is submitte(enter key is pressed) set user input as user answer
            userAnswer = tonumber(event.target.text)

            --if the users answer and the correct answer are the same 
            if (userAnswer == correctAnswer) then
                transition.to(correctObject, {x = display.contentWidth/1.63, alpha = 1, time = 1000})
                transition.to(correctMouse, {x = 750, alpha = 1, time = 1000})
                timer.performWithDelay(2000, HideCorrect)
                event.target.text = ""
                counter = counter + 1
                print("counter = " ..counter)
                points.text = "Points: "..counter

            else
               transition.to(incorrectCat, { x = 300, alpha = 1, time =1000})
               transition.to(incorrectObject, { x = 460, alpha = 1, time = 1000})
               event.target.text = ""
               timer.performWithDelay(2000, HideCorrect)
               tellCorrect.text = "Correct answer is "..correctAnswer
               tellCorrect.isVisible = true
            end

            if (counter == 5) then
              book.isVisible = false
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

    --displays a question
    questionObject = display.newText( "", 425, display.contentHeight/2, native.systemFontBold, 100 )
    questionObject:setTextColor(0 ,140/255, 149/255)
    questionObject.isVisible = false

    --create the correct text object 
    correctObject = display.newText("Correct", 2000, 200, "Georgia" , 60)
    correctObject:setTextColor(155/255, 42/255, 198/255)
    correctObject.alpha = 0

    --create numeric field
    numericField = native.newTextField( 700, display.contentHeight/2, 150, 80)
    sceneGroup:insert(numericField)
    numericField.input = "number"
    numericField.isVisible = false


    --------------------------------------------------------------------------------------------------------------

    --create the background
    background = display.newImageRect("Images/library.jpg", display.contentWidth, display.contentHeight+20)
    sceneGroup:insert(background)
    background.isVisible = false
    --set its position
    background.x = 520
    background.y = 380
    
    --create floor
    floor = display.newRect(500, 500, 800, 70)
    sceneGroup:insert(floor)
    floor.isVisible = false
    floor.alpha = 0
    --add physics to the object
    physics.addBody( floor, "static", {friction = 0.5, bounce = 0.3})

    --create Text
    round = display.newText("Round 1", 250, -3500, native.systemFontBold, 150)
    sceneGroup:insert(round)
    round.isVisible = false
    --anchor the text and set the color
    round.anchorX = 0
    round:setTextColor(255/255, 170/255, 14/255)
    --add physics to text
    physics.addBody( round, {friction = 0.5, bounce = 0.5})

    --create the info pannel
    infoPannel = display.newRect(500, 400, 600, 600)
    infoPannel.strokeWidth = 7
    sceneGroup:insert(infoPannel)
    infoPannel.isVisible = false
    --set the color of the pannel
    infoPannel:setFillColor(249/255, 228/255, 157/255)
    infoPannel:setStrokeColor(255/255, 170/255, 14/255)

    --create the text
    info = display.newText("Instruction", 510, 200, native.systemFontBold, 70)
    sceneGroup:insert(info)
    info.isVisible = false
    --set the color
    info:setTextColor(0 ,140/255, 149/255)

    --create text
    info2 = display.newText(" In order to get\nto the next level\n you must answer\n    five math\n    questions. ",505, 400, "Courier", 50)
    sceneGroup:insert(info2)
    info2.isVisible = false
    --set the color
    info2:setTextColor(0 ,140/255, 149/255)
    
    --create object
    book = display.newImage("Images/book.png", 0, 0)
    sceneGroup:insert(book)
    book.alpha = 0
    --set the position of the object
    book.x = 500
    book.y = 400
    
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
    tellCorrect = display.newText ( "", 500, 500, "Georgia", 50 )
    sceneGroup:insert(tellCorrect)
    tellCorrect.isVisible = false
    --set the color
    tellCorrect: setTextColor (0 ,140/255, 149/255)

    --create text
    points = display.newText( "Points: 0", 500, 300, native.systemFontBold, 70)
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
    buttonText:setFillColor(255/255, 170/255, 14/255)
    ------------------------------------------------------------------------------------------------------------------------------------------------

    

    --add event listener
    numericField:addEventListener("userInput", numericFieldListener)    
    button:addEventListener("tap", changeScene)

    --call the function
    AskQuestion()
end 

scene:addEventListener( "create", scene )
-- -----------------------------------------------------------------------------------
 
return scene