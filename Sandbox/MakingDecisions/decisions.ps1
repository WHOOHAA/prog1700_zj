##################################
#    Author: Zachary Johnson     #
#    Date: Sep. 24, 2019         #
#    Description: Tech Check 2   #
##################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    $numberResponse = [int](Read-Host -Prompt "What is your favorite number?")
    # 2. Processing and Output if Statment
    if($numberResponse -ge 50)
    {
        Write-Output "You like large numbers"
    }
    
    Write-Output "Have a nice Day!"
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main