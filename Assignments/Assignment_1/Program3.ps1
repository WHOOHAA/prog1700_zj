#Author: Zachary Johnson
#Date: Sep. 12, 2019
#Description: Total stock worth

# DO NOT EDIT: The main function to house our program code 
function main {

   # 1. Input, variables and program title output
   Write-Output "Imperial To Metric Conversion `n"
   $tons = [float](Read-Host -Prompt "Enter the amount of tons")
   $stone = [float](Read-Host -Prompt "Enter the stone")
   $pounds = [float](Read-Host -Prompt "Enter the pounds")
   $ounces = [float](Read-Host -Prompt "Enter the ounces")

   # 2. Processing
   $totalOunces = (35840 * $tons) + (224 * $stone) + (16 * $pounds) + $ounces
   $totalKilos = $totalOunces / 35.274
   $totalGrams = $totalOunces / 28.35
   $metricTons = [math]::Floor($totalKilos / 1000)
   
   # 3. Output
   Write-Output ("`nThe metric weight is {0:N0} metric tons, {1:N2} kilos, and {2:N2} grams" -f $metricTons, $totalKilos, $totalGrams)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main