function Check-LeapYear($InCurrentYear)
{
    $isALeapYear = $false

    if($InCurrentYear % 4 -eq 0 -and $InCurrentYear % 100 -ne 0)
    {
        $isALeapYear = $true
    }
    elseif ($InCurrentYear % 400 -eq 0) 
    {
        $isALeapYear = $true
    }
   
    return $isALeapYear
}

# DO NOT EDIT: The main function to house our program code 
function main {

    # create a variable to store the year as a string
    $enteredYearString = ""
    
    # Regular Expression to match only digits
    $yearRegEx = "^\d+$"

    # ask the user for the year to check repeatedly until a number is entered
    do{

        $enteredYearString = Read-Host -Prompt "Enter the year to check"

        if(-Not ($enteredYearString -Match $yearRegEx)
        {
            Write-Output "Error"
        }
    } while(-Not ($enteredYearString -Match $yearRegEx))

    # processing
    $currentYear = [int]$enteredYearString
    $isLeapYear = Check-LeapYear -InCurrentYear $currentYear

    # output 
    if($isLeapYear -eq $true)
    {
        Write-Output "$currentYear is a leap year."
    }
    else 
    {
        Write-Output "$currentYear is NOT a leap year."
    }
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main
