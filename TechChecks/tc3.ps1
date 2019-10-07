##################################
#    Author: Zachary Johnson     #
#    Date: Oct. 7 , 2019         #
#    Description: Tech Check 3   #
##################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # Input, variables and outupt.
    Write-Output "Grade Point Calculator`n"
    Write-Output "Valid letter grades that can be entered: A, B, C, D F."
    Write-Output "Valid grade modifiers are +, - or nothing"
    Write-Output "All letter grades except F can include a + or - symbol."
    Write-Output "Calculated grade point value cannot exceed 4.0."
    
    $gradeLetter = Read-Host -prompt "`nPlease enter a letter grade"
    $gradeModifier = Read-Host -prompt "Please enter a modifier (+, - or nothing)"
    
    # initialize variables
    $gradeNumber = 0
    $totalGradeNumber = 0
    $gradeModifierNumber = 0
    
    # constant

    
    # Processing
    
    
    if ($gradeLetter -eq "A") 
    {
        $gradeNumber = 4
    }
    elseif ($gradeLetter -eq "B") 
    {
        $gradeNumber = 3
    }
    elseif ($gradeLetter -eq "C") 
    {
        $gradeNumber = 2
    }
    elseif ($gradeLetter -eq "D") 
    {
        $gradeNumber = 1
    }
    elseif ($gradeLetter -eq "F") 
    {
        $gradeNumber = 0
    }
    else 
    {
        Write-Output "You have entered an invalid letter grade."
        $gradeLetter = "F"
    }

    if (($gradeLetter -ne "A" -and $gradeLetter -ne "F") -and $gradeModifier -eq "+") 
    {
        
        $gradeModifierNumber = 0.3
        
    }
    elseif ($gradeLetter -ne "F" -and $gradeModifier -eq "-")
    {
        $gradeModifierNumber = -0.3
    }
    
    $totalGradeNumber = $gradeNumber + $gradeModifierNumber
    
   
    # Output
    Write-Output "The numeric valuse is: $totalGradeNumber"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main