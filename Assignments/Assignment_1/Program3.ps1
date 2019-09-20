#Author: Zachary Johnson
#Date: Sep. 20, 2019
#Description: #Description: Assignment 1 Project 3 Imperial to Metric Conversion

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
   $metricTons = [math]::Floor($totalKilos / 1000)
   $kilo = [math]::Floor($totalKilos) - ($metricTons * 1000)
   $totalGrams = 1000 * (($totalKilos - ($metricTons * 1000)) - $kilo)

   # 3. Output
   Write-Output ("`nThe metric weight is {0:N0} metric tons, {1:N0} kilos, and {2:N1} grams" -f $metricTons, $kilo, $totalGrams)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main