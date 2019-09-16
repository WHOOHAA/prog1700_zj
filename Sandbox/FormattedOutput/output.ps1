#Author: Zachary Johnson
#Date: Sep. 12, 2019
#Description: Total stock worth

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input amd variables
    $firstName = Read-Host -Prompt "Enter your first name"
    $weeklyPay = [float](Read-Host -Prompt "Enter your weekly pay")
    $weeklyBonus = [float](Read-Host -Prompt "Enter your weekly bonus")
    
    # 2. Processing
    $total = $weeklyPay + $weeklyBonus
   
    # 3. Output
    Write-Output ("Hello {0}. Your total pay is {1:C}" -f $firstName,$total)
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main