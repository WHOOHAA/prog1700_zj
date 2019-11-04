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

    $sortedHours = $hoursWorked | Sort-Object -Descending
    $mostHoursWorked = $sortedHours[0]
    
    Write-Output ("=" * 40)
    Write-Output "The most hours worked was:"
    for($i = 0; $i -lt $hoursWorked.Length; $i++)
    {
            
            if($hoursWorked[$i] -eq $mostHoursWorked)
            {
                $day = $i + 1
                Write-Output ("Day #{0} when you worked {1} hours." -f $day,$hoursWorked[$i])
            }   
    } 

    Write-Output ("=" * 40)
    $totalHoursWorked = 0

    for($i = 0; $i -lt $hoursWorked.Length; $i++ )
    {
        $totalHoursWorked = $totalHoursWorked + $hoursWorked[$i]  
    }

        $averageHoursWorked = $totalHoursWorked / $hoursWorked.Length

    Write-Output ("Total number of hours worked: {0}" -f $totalHoursWorked)
    Write-Output ("The average number of hours worked each day was: {0}" -f $averageHoursWorked)
    Write-Output ("=" * 40)
    
    Write-Output "Days you have slacked off (i.e. worked less then 7 hours):"
    
    for($i = 0; $i -lt $hoursWorked.Length; $i++ )
    {
        if($hoursWorked[$i] -lt 7)
        {
            $day = $i + 1
            Write-Output ("Day #{0}: {1} hours" -f $day,$hoursWorked[$i])
        }
    }
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main