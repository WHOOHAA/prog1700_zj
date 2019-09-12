#Author
#
#
# DO NOT EDIT: The main function to house our program code 
function main {

    #Input amd variables
    $percentPizzarias = 0.12 # hard-coded variable
    $numberPizzarias = 70000 # hard-coded variable

    #Processing
    # 0.12 = 70000 / x
    # 0.12 x =70000
    # x = 70000 / 0.12
    $totalUSRestautants = $numberPizzarias/$percentPizzarias

    #Output
    Write-Output "The total number of restaurants in the US is $totalUSRestautants"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main
