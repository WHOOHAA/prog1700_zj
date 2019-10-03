##################################
#    Author: Zachary Johnson     #
#    Date: Sep. 24, 2019         #
#    Description: Tech Check 2   #
##################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    $p = $false
    $q = $false
    $r = $true
    
    # 2. Processing
    if( ($p -and -not $q) -and ($q -or $r) )
    {
        Write-Output "The whole expression is true"
    }
    else
    {
        Write-Output "The whole expression is false"
    }
    # 3. Output
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main