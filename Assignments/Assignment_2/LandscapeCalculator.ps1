###################################################################
#    Author: Zachary Johnson                                      #
#    Date: Oct. 19, 2019                                          #
#    Description: Landscape Calculator Assignment 2 - Project 1   #
###################################################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # Input/Output and Variables
    $houseNumber = [int](Read-Host -Prompt "Enter House Number")
    $propertyDepth = [int](Read-Host -Prompt "Enter property depth (feet)")
    $propertyWidth = [int](Read-Host -Prompt "Enter property width (feet)")
    $grassType = Read-Host -Prompt "Enter type of grass (fescue, bentgrass, campus)"
    $treeNumber = [int](Read-Host -Prompt "Enter the number of trees")

    # Processing
    $propertySize = $propertyDepth * $propertyWidth

    if($propertySize -gt 5000)
    {
        $overSizeCharge = 500
    }
    else
    {
        $overSizeCharge = 0
    }

    if($grassType -eq "fescue")
    {
        $grassCost = 0.05
    }
    elseif ($grassType -eq "bentgrass") 
    {
        $grassCost = 0.02
    }
    elseif($grassType -eq "campus")
    {
        $grassCost = 0.01
    }
    else 
    {
    $totalCost = "ERROR"
    }
    
    if($totalCost -ne "ERROR")
    {
        $totalCost = ($propertySize * $grassCost) + ($treeNumber * 100) + 1000 + $overSizeCharge
    }
        # Output
    Write-Output ("Total cost for house {0} is: {1:C}" -f $houseNumber, $totalCost)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main