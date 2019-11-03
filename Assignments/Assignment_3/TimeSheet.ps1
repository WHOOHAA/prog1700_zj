#########################################################
#    Author: Zachary Johnson                            #
#    Date: Nov. 03, 2019                                #
#    Description: Time Sheet Assignment 3 - Project 1   #
#########################################################

function Check-Input ($INPUTIN)
{
    $numberRegEx = "^\d+$"

}

# DO NOT EDIT: The main function to house our program code 
function main {
    $hoursWorked = @()
    for ($i = 1; $i -lt 6; $i++)
    {
        do
        {
            Read-Host "Enter hours worked on Day $i"
            
            $hoursWorked =+ $userInput

            if($error -eq $true)
            {
                Write-Output "ERROR try again"
            }
        }
        While($error -ne $false)
    }
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main