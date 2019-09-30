#############################################
#    Author: Zachary Johnson                #
#    Date: Sep. 30, 2019                    #
#    Description: Exercise Pay Calculator   #
#############################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # testing values
    # $hoursWorked = 50 #Hard-coded
    # $payRate = 10 #Hard-coded

    # 1. Input and variables
    $payRate = [float](Read-Host "Enter number of pay rate")
    $hoursWorked = [float](Read-Host "Enter number of hours worked")
    
    # constant
    Set-Variable OVERTIMETHRESHOLD -Option Constant -Value 40
    Set-Variable OVERTIMERATE -Option Constant -Value 1.5

    # initialize variables
    $overTimePay = 0
    
    # new processing
    if($hoursWorked -gt $OVERTIMETHRESHOLD)
    {
        $overTimePay = ($hoursWorked - $OVERTIMETHRESHOLD) * ($payRate * $OVERTIMERATE)
        $hoursWorked = $OVERTIMETHRESHOLD
    }

    $payTotal = ($hoursWorked * $payRate) + $overTimePay
    
    # 2. Processing
    # if($hoursWorked -gt 40)
    # {
    #     $payTotal = 40 * $payRate
    #     $overTimeHours = ($hoursWorked - 40) * ($payRate * 1.5)
    #     $payTotal = $payTotal + $overTimeHours
    # }
    # else    
    # {
    #     $payTotal = $hoursWorked * $payRate
    # }

    # 3. Output
    Write-Output ("Your total pay for the week is: {0:C}!!!!!!!!!!!!" -f $payTotal)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main