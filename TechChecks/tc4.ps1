############################################
## Tech Check 4 - Provided Starter File
############################################

##################################
#    Author: Zachary Johnson     #
#    Date: Oct. 17, 2019         #
#    Description: Tech Check 4   #
##################################
#The main function to house our program code 
function Calculate-NumberGrade($InLetterGrade, $InModifier)
{
    $OutNumericGrade = 0.0
     # Determine base numeric value of the grade
     if($InLetterGrade-eq "A")
     {
         $OutNumericGrade = 4.0
     }
     elseif($InLetterGrade-eq "B")
     {
         $OutNumericGrade = 3.0
     }
     elseif($InLetterGrade-eq "C")
     {
         $OutNumericGrade = 2.0
     }
     elseif($InLetterGrade-eq "D")
     {
         $OutNumericGrade = 1.0
     }
     elseif($InLetterGrade-eq "F")
     {
         $OutNumericGrade = 0.0
     }
     else
     {
         Write-Output "You entered an invalid letter grade."
     }
     
     # Determine whether to apply a modifier
     if($InModifier -eq "+")
     {
         if($InLetterGrade -ne "A" -and $InLetterGrade -ne "F") # Plus is not valid on A or F
         {
             $OutNumericGrade += 0.3
         }
     }
     elseif($InModifier -eq "-")
     {
         if($InLetterGrade -ne "F")     # Minus is not valid on F
         {
             $OutNumericGrade -= 0.3
         }
     }
     return $OutNumericGrade
}

function main()
{
    Write-Output "Grade Point Calculator"
    Write-Output ""
    Write-Output "Valid letter grades that can be entered: A, B, C, D, F."
    Write-Output "Valid grade modifiers are +, - or nothing."
    Write-Output "All letter grades except F can include a + or - symbol."
    Write-Output "Calculated grade point value cannot exceed 4.0."
    Write-Output ""

    

    $letterGrade = (Read-Host -Prompt "Please enter a letter grade for PROG1700").ToUpper()
    $modifier = Read-Host -Prompt "Please enter a modifier (+, - or nothing)"

    $numericGrade1 = Calculate-NumberGrade -InLetterGrade $letterGrade -InModifier $modifier

    $letterGrade = (Read-Host -Prompt "`nPlease enter a letter grade for NETW1700").ToUpper()
    $modifier = Read-Host -Prompt "Please enter a modifier (+, - or nothing)"

    $numericGrade2 = Calculate-NumberGrade -InLetterGrade $letterGrade -InModifier $modifier

    $letterGrade = (Read-Host -Prompt "`nPlease enter a letter grade for OSYS1200").ToUpper()
    $modifier = Read-Host -Prompt "Please enter a modifier (+, - or nothing)"

    $numericGrade3 = Calculate-NumberGrade -InLetterGrade $letterGrade -InModifier $modifier

    $letterGrade = (Read-Host -Prompt "P`nlease enter a letter grade for WEBD1000").ToUpper()
    $modifier = Read-Host -Prompt "Please enter a modifier (+, - or nothing)"

    $numericGrade4 = Calculate-NumberGrade -InLetterGrade $letterGrade -InModifier $modifier

    $letterGrade = (Read-Host -Prompt "`nPlease enter a letter grade for COMM1700").ToUpper()
    $modifier = Read-Host -Prompt "Please enter a modifier (+, - or nothing)"

    $numericGrade5 = Calculate-NumberGrade -InLetterGrade $letterGrade -InModifier $modifier

    $letterGrade = (Read-Host -Prompt "`nPlease enter a letter grade for DBAS1001").ToUpper()
    $modifier = Read-Host -Prompt "Please enter a modifier (+, - or nothing)"

    $numericGrade6 = Calculate-NumberGrade -InLetterGrade $letterGrade -InModifier $modifier

    $averageGrade = ($numericGrade1 + $numericGrade2 + $numericGrade3 + $numericGrade4 + $numericGrade5 + $numericGrade6) / 6
    # Output final message and result, with formatting
    Write-Output "`n****************************************`n"
    Write-Output ("The numeric value for PROG1700 is: {0:N1}" -f $numericGrade1)
    Write-Output ("The numeric value for NETW1700 is: {0:N1}" -f $numericGrade2)
    Write-Output ("The numeric value for OSYS1200 is: {0:N1}" -f $numericGrade3)
    Write-Output ("The numeric value for WEBD1000 is: {0:N1}" -f $numericGrade4)
    Write-Output ("The numeric value for COMM1700 is: {0:N1}" -f $numericGrade5)
    Write-Output ("The numeric value for DBAS1001 is: {0:N1}`n" -f $numericGrade6)
    Write-Output "==============================================="    
    Write-Output ("Your grade point average this semester is: {0:N1}" -f $averageGrade)
    Write-Output "===============================================" 
     
}

# Trigger our main function to launch the program
main