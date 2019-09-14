#Author: Zachary Johnson
#Date: Sep. 14, 2019
#Description: Numbers Demo

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    $firstNumber = [float] (Read-Host -Prompt "Enter the first number")
    $secondNumber = [float] (Read-Host -Prompt "Enter the second number")

    #Processing
    $total = $firstNumber + $secondNumber
    
    #Output
    Write-Output $total 
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main