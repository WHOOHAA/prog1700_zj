########################################################################
#    Author: Zachary Johnson                                           #
#    Date: Oct. 21, 2019                                               #
#    Description: Auto Insurance Calculator Assignment 2 - Project 3   #
########################################################################

function Calculate-AutoInsurance ($InSex, $InAge, $InVehiclePurchasePrice) 
{
    if ($InSex -eq "Male") 
    {
       if ($InAge -ge 15 -and $InAge -lt 25) 
       {
            $OutMonthlyInsuranceCost = ($InVehiclePurchasePrice * 0.25) / 12
       }
       elseif ($InAge -ge 25 -and $InAge -lt 40) 
       {
            $OutMonthlyInsuranceCost = ($InVehiclePurchasePrice * 0.17) / 12
       }
       elseif ($InAge -ge 40 -and $InAge -lt 70) 
       {
            $OutMonthlyInsuranceCost = ($InVehiclePurchasePrice * 0.10) / 12 
       } 
    }
    elseif ($InSex -eq "Female") 
    {
        if ($InAge -ge 15 -and $InAge -lt 25) 
        {
            $OutMonthlyInsuranceCost = ($InVehiclePurchasePrice * 0.20) / 12    
        }
        elseif ($InAge -ge 25 -and $InAge -lt 40) 
        {
            $OutMonthlyInsuranceCost = ($InVehiclePurchasePrice * 0.15) / 12             
        }
        elseif ($InAge -ge 40 -and $InAge -lt 70) 
        {
            $OutMonthlyInsuranceCost = ($InVehiclePurchasePrice * 0.10) / 12             
        }         
    }
Return $OutMonthlyInsuranceCost
}

# DO NOT EDIT: The main function to house our program code 
function main {

    # Input/Output and Variables
    $sex = Read-Host -Prompt "Are you 'Male' or 'Female'"
    $age = [int](Read-Host -Prompt "Enter your age")
    $vehiclePurchasePrice = [int](Read-Host -Prompt "Enter the purchase price of the vehicle")
    
    # Processing
    $monthlyInsuranceCost = Calculate-AutoInsurance -InSex $sex -InAge $age -InVehiclePurchasePrice $vehiclePurchasePrice
    
    # Output
    Write-Output ("Your monthly insurance will be {0:C}" -f $monthlyInsuranceCost)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main