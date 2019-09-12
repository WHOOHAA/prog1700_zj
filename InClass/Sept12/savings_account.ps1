#Author: Zachary Johnson
#Date: Sep. 12, 2019
#Description: Total stock worth

# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    $balance = 100

    #Processing
    $balance = $balance * 1.05 + 100
    $balance = $balance * 1.05 + 100
    $balance = $balance * 1.05

    #Output
    Write-Output ("The balance is {0:C}" -f $balance )
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main