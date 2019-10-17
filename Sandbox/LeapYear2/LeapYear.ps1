#######################################
#    Author: Zachary Johnson          #
#    Date: Oct. 15, 2019              #
#    Description: Leap Year Checker   #
#######################################

Import-Module '.\Sandbox\LeapYear2\LeapYear.psm1'

# DO NOT EDIT: The main function to house our program code 
function main {

    # Input and variables
    $currentYear = [int](Read-Host -Prompt "Enter the year to check") # Ask for year to check
     
    # Processing
    $isLeapYear = Check-LeapYear -InCurrentYear $currentYear
    
    # Output
    if($isLeapYear -eq $true)
    {
        Write-Output "$currentYear is a leap year"
    }
    else 
    {
        Write-Output "$currentYear is NOT a leap year."   
    }
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main