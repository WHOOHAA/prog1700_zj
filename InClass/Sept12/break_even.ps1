#Author: Zachary Johnson
#Date: Sep. 12, 2019
#Description: Companys break even point

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    $variable_fixed_cost = 5000
    $price_per_unit = 8
    $cost_per_unit = 6

    #Processing
    $break_even_point = $variable_fixed_cost /($price_per_unit - $cost_per_unit)

    #Output
    Write-Output "The company's braking point is $break_even_point!!"    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main