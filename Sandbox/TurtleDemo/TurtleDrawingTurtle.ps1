##############################################
#    Author: Zachary Johnson                 #
#    Date: Oct. 29, 2019                     #
#    Description: EtchASketch using Turtle   #
##############################################

Using module ".\Turtle.psm1"


# DO NOT EDIT: The main function to house our program code 
function main {

    # set the window size and starting position
    $myTurtle = [Turtle]::new(500, 500, 50, 50)
    

    $myTurtle.Forward(100)
    $myTurtle.RIGHT(45)
    $myTurtle.Forward(100)
    $myTurtle.Left(45)
    $myTurtle.Forward(50)
    $myTurtle.Right(45)
    $myTurtle.Forward(50)
    $myTurtle.Right(135)
    $myTurtle.Forward(50)

    
    # draw the form
    $myTurtle.Stroke()
    
    
    # Output
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main