########################################################################
#    Author: Zachary Johnson                                           #
#    Date: Oct. 19, 2019                                               #
#    Description: Erewhon Mobile Data Plans Assignment 2 - Project 2   #
########################################################################




# DO NOT EDIT: The main function to house our program code 
function main {

    # Input/Output and Variables
    $usedData = [int](Read-Host -Prompt "Enter data usage (Mb)")


    # Initialize Variables
    $totalCharge = "ERROR"
    
    # Processing
    if($usedData -le 200 -and $usedData -ge 0 )
    {
        $totalCharge = 20
    }
    elseif ($usedData -gt 200 -and $usedData -le 500) 
    {
        $totalCharge = $usedData * 0.105
    }
    elseif ($usedData -gt 500 -and $usedData -le 1000) 
    {
        $totalCharge = $usedData * 0.110    
    }
    elseif ($usedData -gt 1000) 
    {
        $totalCharge = 118    
    }
    
    # Output
    Write-Output ("Total charge is {0:C}" -f $totalCharge)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main