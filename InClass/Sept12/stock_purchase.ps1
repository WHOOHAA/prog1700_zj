#Author: Zachary Johnson
#Date: Sep. 12, 2019
#Description: Stock total worth

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    $cost_per_share = 25.625
    $number_of_Shares = 400

    #Processing
    $markdown = $cost_per_share * $number_of_Shares

    #Output
    Write-Output "Total worth of shares $markdown!"    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main