########################################################################
#    Author: Zachary Johnson                                           #
#    Date: Oct. 19, 2019                                               #
#    Description: Erewhon Mobile Data Plans Assignment 2 - Project 2   #
########################################################################

Function Data-Price($InUsedData)
{
  # Initialize Variables
  $OutTotalCharge = "ERROR"
    
  # Processing
  if($InUsedData -le 200 -and $InUsedData -ge 0 )
  {
      $OutTotalCharge = 20
  }
  elseif ($InUsedData -gt 200 -and $InUsedData -le 500) 
  {
      $OutTotalCharge = $InUsedData * 0.105
  }
  elseif ($InUsedData -gt 500 -and $InUsedData -le 1000) 
  {
      $OutTotalCharge = $InUsedData * 0.110    
  }
  elseif ($InUsedData -gt 1000) 
  {
      $OutTotalCharge = 118    
  }
  Return $OutTotalCharge
}


# DO NOT EDIT: The main function to house our program code 
function main {

    # Input/Output and Variables
    $usedData = [int](Read-Host -Prompt "Enter data usage (Mb)")

    $totalCharge = Data-Price -InUsedData $usedData
  
    # Output
    Write-Output ("Total charge is {0:C}" -f $totalCharge)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main