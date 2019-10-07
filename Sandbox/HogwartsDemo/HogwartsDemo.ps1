##########################################
#    Author: Zachary Johnson             #
#    Date: 7 Oct 2019                 #
#    Description: Hogwarts Sorting Hat   #
##########################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    # generate a random number between 1 and 4
    $assignedNumber = Get-Random -minimum 1 -maximum 5
    $assignedHouse = "an ussigned house try again"    
    

    # 2. Processing
    if($assignedNumber -eq 1)
    {
       $assignedHouse = "Gryffindor"
    }
    elseif ($assignedNumber -eq 2) 
    {
        $assignedHouse = "Hufflepuf"    
    }
    elseif ($assignedNumber -eq 3) 
    {
        $assignedHouse = "Ravenclaw"    
    }
    elseif ($assignedNumber -eq 4) 
    {
        $assignedHouse = "Slytherin"    
    }
    
    
    # 3. Output
    Write-Output "The sorting Hat has assigned you to $assignedHouse!"
    Write-Output "Thanks for using the Hogwarts Sorting Hat!"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main