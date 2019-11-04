#########################################################
#    Author: Zachary Johnson                            #
#    Date: Nov. 03, 2019                                #
#    Description: Time Sheet Assignment 3 - Project 1   #
#########################################################

# TAKES $INUSERINPUT from $userInput AND CHECKS FOR DIGITS. 
# IF NON DIGIT IT WILL RETURN $ERROROUT AS $true
# IF CONTAINS ONLY DIGITS IT WILL RETURN $ERROROUT AS $false
function Check-InputError ($INUSERINPUT)
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
    # SET $hoursWorked TO EMPTY ARRAY
    $hoursWorked = @()
    
    # ASKES FOR HOURS WORKED AND REASKS IF $error is returned as $true
    # RESTORES $userInput AS AN INT IN $hoursWorked AS AN ARRAY
    for ($i = 1; $i -lt 6; $i++)
    {
        $error = $false
        do
        {
            $userInput = Read-Host "Enter hours worked on Day #$i"
            $error = Check-InputError -INUSERINPUT $userInput
            if($error -eq $true)
            {
                Write-Output "ERROR"
            }
            else
            {
                $hoursWorked += [int]($userInput)
            }
        }
        While($error -ne $false)
    }
   
    # ORGANIZES $hoursWorked IN DESENDING ORDER
    # STORES THE HIGHEST HOUR OF WORK IN $mostHoursWorked
    $sortedHours = $hoursWorked | Sort-Object -Descending
    $mostHoursWorked = $sortedHours[0]
    
    Write-Output ("-" * 80)
    Write-Output "The most hours worked was on:"
    
    # GOES THROUGH THE ARRAY FOR THE DAY THAT CORRESPONDS WITH THE MOST HOURS WORKED
    # OUTPUTS MULTIPLE DAYS IF THEY SHARE THE SAME MOST HOURS WORKED
    for($i = 0; $i -lt $hoursWorked.Length; $i++)
    {
            
        if($hoursWorked[$i] -eq $mostHoursWorked)
        {
            $day = $i + 1
            Write-Output ("Day #{0} when you worked {1} hours." -f $day,$hoursWorked[$i])
        }   
    } 

    Write-Output ("-" * 80)
    $totalHoursWorked = 0

    # GOES THOUGH THE ARRAY AND ADDS ALL OF THE HOURS TOGETHER FOR THE TOTAL HOUrS WORKED $totalHoursWorked
    for($i = 0; $i -lt $hoursWorked.Length; $i++ )
    {
        $totalHoursWorked = $totalHoursWorked + $hoursWorked[$i]  
    }

    # GETS THE AVERAGE HOURS WORKED $averageHoursWorked
    $averageHoursWorked = $totalHoursWorked / $hoursWorked.Length

    Write-Output ("Total number of hours worked: {0}" -f $totalHoursWorked)
    Write-Output ("The average number of hours worked each day was: {0}" -f $averageHoursWorked)
    Write-Output ("-" * 80)
    Write-Output "Days you have slacked off (i.e. worked less then 7 hours):"
    
    # GOES THROUGH THE ARRAY FOR THE DAY THAT CORRESPONDS WITH THE DAYS WHERE LESS THEN 7 HOURS ARE WORKED
    # OUTPUTS LESS THEN 7 HOURS WORKED
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