################################
#    Author: Zachary Johnson   #
#    Date: Oct. 24, 2019       #
#    Description: Even Sum     #
################################




# DO NOT EDIT: The main function to house our program code 
function main {

    # Processing    
    for ($i=0; $i -le 100; $i+=2)
    {
        $total = $total + $i
    }
    
    # Output
    Write-Output "The sum of all even numbers from 0 to 100 is $total."
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main