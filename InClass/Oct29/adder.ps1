###################################################################
#    Author: Zachary Johnson                                      #
#    Date: Oct. 29, 2019                                          #
#    Description: Adder   #
###################################################################


# DO NOT EDIT: The main function to house our program code 
function main {

        # create a variable to store the year as a string
        Write-Output "Enter two numbers when prompted to get the sum."
        
        $enteredNumberStringOne = ""
        $enteredNumberStringTwo =""
    
        # Regular Expression to match only digits
        $numberRegEx = "^\d+$"
    
        # ask the user for the year to check repeatedly until a number is entered
        do{
    
            $enteredNumberStringOne = Read-Host -Prompt "Enter the the first number to add"
    
            if(-Not ($enteredNumberStringOne -Match $numberRegEx))
            {
                Write-Output "Error! Please try again! (Digits Only)"
            }
        } while(-Not ($enteredNumberStringOne -Match $numberRegEx))
    
        do{
    
            $enteredNumberStringTwo = Read-Host -Prompt "Enter the the second number to add"
    
            if(-Not ($enteredNumberString -Match $numberRegEx))
            {
                Write-Output "Error! Please try again! (Digits Only)"
            }
        } while(-Not ($enteredNumberStringTwo -Match $numberRegEx))

    # processing
    $currentNumberOne = [int]$enteredNumberStringOne
    $currentNumberTwo = [int]$enteredNumberStringTwo
    $totalSum = $currentNumberOne + $currentNumberTwo #enters the numbers together
    
    # output 
    Write-Output "The sum of the two numbers is $totalSum!"
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main