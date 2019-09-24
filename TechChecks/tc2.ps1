##################################
#    Author: Zachary Johnson     #
#    Date: Sep. 24, 2019         #
#    Description: Tech Check 2   #
##################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input, variables & output
    Write-Output "Tax Withholding Calculator`n"
    $weeklySalary = [float](Read-Host -Prompt "Please enter the full amount of your weekly salary")
    $dependents = [float](Read-Host -Prompt "How many dependents do you have?")
    Set-Variable PROVINCIALTAX -Option Constant -Value 0.06
    Set-Variable FEDERALTAX -Option Constant -Value 0.25
    Set-Variable DEPENDENTDEDUCTION -Option Constant -Value 0.02
    
    # 2. Processing
    $provincialTaxHeld = $weeklySalary * $PROVINCIALTAX
    $federalTaxHeld = $weeklySalary * $FEDERALTAX
    $totalDependentDeduction = $weeklySalary * ($dependents * $DEPENDENTDEDUCTION)
    $totalHeld = $provincialTaxHeld + $federalTaxHeld - $totalDependentDeduction
    $totalTakeHome = $weeklySalary - $totalHeld
    
    # 3. Output
    Write-Output ("`nProvincial Tax Withheld: {0:C}" -f $provincialTaxHeld)
    Write-Output ("Federal Tax Withheld: {0:C}" -f $federalTaxHeld)
    Write-Output ("Dependent Deduction for $dependents dependents: {0:C}" -f $totalDependentDeduction) 
    Write-Output ("Provincial Withheld: {0:C}" -f $totalHeld) 
    Write-Output ("Total Take-Home Pay: {0:C}" -f $totalTakeHome) 

}

# DO NOT EDIT: Trigger our main function to launch the program
main