##################################
#    Author: Zachary Johnson     #
#    Date: Oct. 31, 2019         #
#    Description: Tech Check 5   #
##################################

function Get-HighestCommonDivisor($inNumberOne,$inNumberTwo)
{
    for($i=1; $i -le $inNumberOne; $i++)
    {
        $highestCommonDivisor = 0

        if($inNumberOne % $i -eq 0 -and $inNumberTwo % $i -eq 0)
        {
            $OutHighestCommonDivisor = $i
            
        }
    }
    
    return $OutHighestCommonDivisor
}

# DO NOT EDIT: The main function to house our program code 
function main {

    # create a variable to store string
    $enteredNumberStringOne = ""
    $enteredNumberStringTwo = ""
    $retryOrQuit = "Y"

    # Regular Expression to match only digits
    $numberRegEx = "^\d+$"

    while($retryOrQuit -eq "Y")
    {    
        # ask the user for the first number to check repeatedly until a digit is entered
        do{

            $enteredNumberStringOne = Read-Host -Prompt "Enter the the first number"

            if(-Not ($enteredNumberStringOne -Match $numberRegEx))
            {
                Write-Output "Error! Enter a valid first number."
            }
        } while(-Not ($enteredNumberStringOne -Match $numberRegEx))

        # ask the user for the second number to check repeatedly until a digit is entered
        do{

            $enteredNumberStringTwo = Read-Host -Prompt "Enter the the second number"

            if(-Not ($enteredNumberStringTwo -Match $numberRegEx))
            {
                Write-Output "Error! Enter a valid second number."
            }
        } while(-Not ($enteredNumberStringTwo -Match $numberRegEx))
        
        $currentNumberOne = [int]$enteredNumberStringOne
        $currentNumberTwo = [int]$enteredNumberStringTwo
        $totalDivisor = Get-HighestCommonDivisor $currentNumberOne $currentNumberTwo # uses Get-HighestDivisor function above
        
        Write-Output "The Highest Common Divisor of $currentNumberOne and $currentNumberTwo is $totalDivisor!"
        
        $retryOrQuit = Read-Host "`nWould you like to try again (y/n)"
    
    }    
    
    Write-Output "`nThank you for using HCD program.`n"



}

# DO NOT EDIT: Trigger our main function to launch the program
main