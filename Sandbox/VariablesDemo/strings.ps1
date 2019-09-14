#Author: Zachary Johnson
#Date: Sep. 14, 2019
#Description: Constant Variables

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    Set-Variable MESSAGE -Option Constant -Value "Welcome to my program"
    $firstName = Read-Host -prompt "Enter your name"
    
    #Output
    Write-Output "$MESSAGE, $firstName!!"    

    #Change value of variable
    $firstName = "Emma"
    $firstName = $firstName.ToUpper()

    #Output 2
    Write-Output "$MESSAGE, $firstName!!" 

}

# DO NOT EDIT: Trigger our main function to launch the program
main