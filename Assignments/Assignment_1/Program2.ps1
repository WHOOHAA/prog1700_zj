#Author: Zachary Johnson
#Date: Sep. 17, 2019
#Description: Assignment 1 Project 2 Weekly Loan Calculator

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input, variables and program title output
    Write-Output "Weekly Loan Calculator `n"
    $loanAmount = [float](Read-Host -Prompt "Enter the amount of loan")
    $interestRate = [float](Read-Host -Prompt "Enter the interest rate (%)")
    $numberYears = [float](Read-Host -Prompt "Enter the number of years")

    # 2. Processing
    $i = $interestRate / 5200
    $weeklyPayments = ($i / (1 - [math]::pow((1 + $i),-52 * $numberYears))) * $loanAmount
    
    # 3. Output
    Write-Output ("`nYour weekly payment will be: {0:C}"-f $weeklyPayments)

}

# DO NOT EDIT: Trigger our main function to launch the program
main