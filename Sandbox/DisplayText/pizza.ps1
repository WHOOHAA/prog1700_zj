#Author: Zachary Johnson
#Date: Sep. 12, 2019
#Description: A simple message application

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    # $slicesPerSecond = 350 # hard-coded variable
    $slicesPerSecond = [int] (Read-Host -Prompt "Enter the number of slices per second")

    #Processing
    $slicesPerDay = $slicesPerSecond * 60 * 60 * 24

    #Output
    Write-Output "Americans eat $slicesPerDay slices of pizza a day!!" 
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main