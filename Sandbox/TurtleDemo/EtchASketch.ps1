##############################################
#    Author: Zachary Johnson                 #
#    Date: Oct. 29, 2019                     #
#    Description: EtchASketch using Turtle   #
##############################################

Using module ".\Turtle.psm1"


# DO NOT EDIT: The main function to house our program code 
function main {
    
    # set the window size
    $myTurtle = [Turtle]::new(400, 300, 50, 50)
        
    while ($lengthOfSide -ne 0)
    {
        $lengthOfSide = Read-Host -Prompt "Enter side length (0 to quit)"
        
        if($lengthOfSide -ne 0)
        {
            $angleToTurn = Read-Host -Prompt "Enter degree to turn 0"
            $myTurtle.Forward($lengthOfSide)
            $myTurtle.RIGHT($angleToTurn)
        }
    }
    
    # draw the form
    $myTurtle.Stroke()
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main