#Author: Zachary Johnson
#Date: Sep. 19, 2019
#Description: Cost of electricity

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    Set-Variable KILLOWATTHOURCOST -Option Constant -Value 11.76
    #$diviceWattage = 100 # hard-coded
    #$hoursUsed = 3 # hard-coded
    $diviceWattage = [float](Read-Host -Prompt "Enter the device wattage used")
    $hoursUsed = [float](Read-Host -Prompt "Enter the hours used")
    
    # 2. Processing
    $electricityCost = ($diviceWattage * $hoursUsed) / (1000 * $KILLOWATTHOURCOST)
    
    # 3. Output
    Write-Output ("Your your cost of electricity: {0:C}" -f $electricityCost)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main