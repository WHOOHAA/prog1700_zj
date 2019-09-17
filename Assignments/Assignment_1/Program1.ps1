#Author: Zachary Johnson
#Date: Sep. 17, 2019
#Description: Assignment 1 Project 1 Hipster's Local Vinyl Records

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input, variables and program title output
    Write-Output "Hipster's Local Vinyl Records - Customer Order Details `n"
    $customer = Read-Host -Prompt "Enter customer's name"
    $distance = [float](Read-Host -Prompt "Enter the distance in kilometers for delivery")
    $purchased = [float](Read-Host -Prompt "Enter the cost of cost of records purchased")
    Set-Variable KILOMETERPRICE -Option Constant -Value 15
    Set-Variable TAX -Option Constant -Value 0.14

    # 2. Processing
    $deliveryCost = $distance * $KILOMETERPRICE
    $purchasedTaxed = $purchased * (1 + $TAX)
    $totalCost = $deliveryCost + $purchasedTaxed
    
    # 3. Output
    Write-Output "`nPurchase summary for $customer"
    Write-Output ("Delivery Cost: {0:C}"-f $deliveryCost)
    Write-Output ("Purchase Cost: {0:C}"-f $purchasedTaxed)
    Write-Output ("Total Cost: {0:C}"-f $totalCost)
}

# DO NOT EDIT: Trigger our main function to launch the program
main