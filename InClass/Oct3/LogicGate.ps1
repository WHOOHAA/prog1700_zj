########################################
#    Author: Zachary Johnson           #
#    Date: Oct. 3, 2019                #
#    Description: Logic Gate Example   #
########################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    $pString = Read-Host -Prompt "Enter value for p (true / false)"
    $qString = Read-Host -Prompt "Enter value for q (true / false)"
    $rString = Read-Host -Prompt "Enter value for r (true / false)"

    # 2. Processing
    $p = [System.Convert]::ToBoolean($pString)
    $q = [System.Convert]::ToBoolean($qString)
    $r = [System.Convert]::ToBoolean($rString)


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