############################################
#    Edited By: Zachary Johnson            #
#    Date: Nov, 26, 2019                   #
#    Description: DriverMilageLegalClass   #
############################################

# USES THE MODUAL TO CREAT THE CLASSES IN THE FALLOWING LOCATION
Using module ".\DriverMilageLegalClass.psm1"


# DO NOT EDIT: The main function to house our program code 
function main {

    # CREATES NEW OBJECT AND PASSES THE VARIABLES BELOW
    $myCar = [Car]::new("Mike", 40, $true)

    # OUTPUTS THE FIRST DRIVER RETURN AS CLASS
    Write-Output $myCar.driverMilageLegal(10)

    # CREATS THE SECOND OBJECT WITH THE BELOW VARIABLES THE SECOND WAY
    $myCar2 = New-Object Car -ArgumentList "Sally", 100, $false

    # OUTPUTS THE SECOND DRIVER RETUEN AS CLASS
    Write-Output $myCar2.driverMilageLegal(10)
}
main