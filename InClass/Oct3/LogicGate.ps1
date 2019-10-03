##################################
#    Author: Zachary Johnson     #
#    Date: Oct. 3, 2019         #
#    Description: Tech Check 2   #
##################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    $p = $true
    $q = $false
    $r = $true
    
    # 2. Processing
    if ( ($p -or $q) -and -not($q -and $r)) 
    {
        Write-Output "True"    
    }
    else 
    {
            Write-Output "False"
    }
    # 3. Output
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main