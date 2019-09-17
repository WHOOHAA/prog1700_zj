#Author: Zachary Johnson
#Date: Sep. 17, 2019
#Description: Tech Check 1

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input amd variables
    $bill = [float](Read-Host -Prompt "Please enter your original bill amount")
    Set-Variable TAX -Option Constant -Value 0.15
    Set-Variable TIP -Option Constant -Value 0.20

    #$bill = 85
    #$tax = 0.15 # hard-coded variable
    #$tip = 0.20 # hard-coded variable

    # 2. Processing
    $totalTax = $bill * $TAX
    $totalTip = $bill * $TIP
    $totalBill = $bill + $totalTax + $totalTip

    # 3. Output
    Write-Output ("Your original bill amount {0:C} `n Your tax is: {1:C} `n Your tip is: {2:C} `n Your total is: {3:C}" -f $bill, $totalTax, $totalTip, $totalBill)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main