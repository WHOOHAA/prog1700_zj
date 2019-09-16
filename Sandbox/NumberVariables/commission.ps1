#Author: Zachary Johnson
#Date: Sep. 16, 2019
#Description: Commission of sales with input

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    $employeeName = Read-Host -Prompt "Enter your fist name"
    $monthlySales = [float](Read-Host -Prompt "Enter monthly sales")
    $commissionRate = [float](Read-Host -Prompt "Enter your commission rate")

    #Processing
    $commissionAmount = $monthlySales * ($commissionRate / 100)

    #Output
    Write-Output "The comission amount for $employeeName is: $commissionAmount!" 
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main