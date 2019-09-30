##################################
#    Author: Zachary Johnson     #
#    Date: Sep. 30, 2019         #
#    Description: Orange Orders  #
##################################

<#
Pseudocode
1. Start Program
2. Output "Orange Order System" followed by a dropped a line, to the user.
3. Prompt for the number of pounds of oranges wanted to order and store it in a float variable called orangeOrder.
4. Create Constant PRICEPERPOUND 1.99
5. Create Constant SHIPPINGCOST set to 7.50
6. Create Constant SHIPPINGDISCOUNT set to 1.5
7. Initilize Variable totalShippingCost = SHIPPINGCOST
8. if orangeOrder >= 100 Calculate totalShippingCost = SHIPPINGCOST - SHIPPINGDISCOUNT
9. After if ended totalOrder = (orangeOrder * PRICEPERPOUND) + totalShippingCost
10.Output "drop line, Your price for the oranges including shipping is: totalOrder" to the user.
11.Program end.
#> 


# DO NOT EDIT: The main function to house our program code 
function main {

    # Input and variables
    Write-Output "Orange Order System`n"
    $orangeOrder = [float](Read-Host -Prompt "Enter the number of pounds of oranges wanted to order")
 
    # constant
    Set-Variable PRICEPERPOUND -Option Constant -Value 1.99
    Set-Variable SHIPPINGCOST -Option Constant -Value 7.5
    Set-Variable SHIPPINGDISCOUNT -Option Constant -Value 1.5
    
    # initialize variables
    $totalShippingCost = $SHIPPINGCOST    
    
    # Processing
    if ($orangeOrder -ge 100)
    {
    $totalShippingCost = $SHIPPINGCOST - $SHIPPINGDISCOUNT
    }
    $totalOrder = ($orangeOrder * $PRICEPERPOUND) + $totalShippingCost
    
    # Output
    Write-Output ("`nYour price for the oranges including shipping is: {0:C}"-f $totalOrder)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main