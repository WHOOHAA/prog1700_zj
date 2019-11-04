#########################################################
#    Author: Zachary Johnson                            #
#    Date: Nov. 03, 2019                                #
#    Description: Time Sheet Assignment 3 - Project 1   #
#########################################################

function Check-Input ($INUSERINPUT)
{
    $numberRegEx = "^\d+$"
    if($INUSERINPUT -Match $numberRegEx)
    {
        $OUTERROR = $false
    }
    else 
    {
        $OUTERROR = $true
    }
    return $OUTERROR
}


# DO NOT EDIT: The main function to house our program code 
function main {
    $hoursWorked = @()
    
    for ($i = 1; $i -lt 6; $i++)
    {
        $error = $false
        do
        {
            $userInput = Read-Host "Enter hours worked on Day #$i"
            $error = Check-Input -INUSERINPUT $userInput
            if($error -eq $true)
            {
                Write-Output "ERROR"
            }
            else
            {
                $hoursWorked += $userInput
            }
        }
        While($error -ne $false)
    }

    # for($i = 0; $i = $hoursWorked.Length; $i++
    # {
        $sortedHours = $hoursWorked | Sort-Object -Descending
        $mostHoursWorked = $sortedHours[0]
        
        # if()
        # $hoursWorked[i]
    # } 
	Write-Output $hoursWorked $mostHoursWorked
}

# DO NOT EDIT: Trigger our main function to launch the program
main