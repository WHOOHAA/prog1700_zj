<#
    Student Name:   Zachary Johnson
    Date:           26 Sept 2019  
    Program Title:  Baseball OBP Calculator - BROKEN
    Description:    Debugging and conditionals practice
#>

# DO NOT EDIT: The main function to house our program code 
function main {

    Write-Output "Baseball On-Base Percentage Calculator"
    Write-Output "`nThis program will calculate a baseball player's OBP based on"
    Write-Output "how many at-bats, hits, walks, hit by pitch, and sacrifice flies"
    Write-Output "they have had.`n"

    $atBats = [int](Read-Host -Prompt "Enter the number of at-bats: ") #BUG HERE changed to int from string
	$hits = [int](Read-Host -Prompt "Enter the number of hits: ") #BUG HERE changed to int from string
	$walks = [int](Read-Host -Prompt "Enter the number of walks: ") #BUG HERE changed to int from string
	$hitByPitches = [int](Read-Host -Prompt "Enter the number of hit by pitches: ") #BUG HERE changed to int from string
	$sacrificeFlies = [int](Read-Host -Prompt "Enter the number of sacrifice flies: ") #BUG HERE changed to int from string
	
	$timesOnBase = $hits + $walks + $hitByPitches
	$totalAtBats = $atBats + $walks + $hitByPitches + $sacrificeFlies
	
	$onBasePercentage = $timesOnBase / $totalAtBats; #BUG HERE math corrected from + to /

	Write-Output ("`nThe player's OBP is {0:N3} for the year." -f $onBasePercentage);#BUG HERE formatted from currency to decimal (tousandths)

    If ($onBasePercentage -eq 0.482 ) 
    {

        Write-Output "The player's OBP is on par with Ted William's career record of 0.482!!!"
    
    }
    elseif ($onBasePercentage -lt 0.482) 
    {

        Write-Output "Keep trying!!! The player's OBP is lower then Ted William's record of 0.482."
        
    }
    else 
    {

        Write-Output "Great!!! The player's OBP is higher then Ted William's record of 0.482!!!"

    }


}

# DO NOT EDIT: Trigger our main function to launch the program
main