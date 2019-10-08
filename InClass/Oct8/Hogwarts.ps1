##########################################
#    Author: Zachary Johnson             #
#    Date: 7 Oct 2019                 #
#    Description: Hogwarts Sorting Hat   #
##########################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    $lastName = Read-Host -Prompt "Enter your last name"
    $assignedNumber = Get-Random -minimum 1 -maximum 5 # generate a random number between 1 and 4
    $assignMuggle = Get-Random -minimum 1 -maximum 3 # generate a random number between 1 and 2
    
    # 2. Processing
    if($lastName -eq "Potter")
    {
        $assignedNumber = 1
        $assignMuggle = 1
    }
    elseif($lastname -eq "Malfoy")
    {
        $assignedNumber = 4
        $assignMuggle = 1
    }
    
           
        if($assignMuggle -eq 1)
        {
            if($assignedNumber -eq 1)
            {
                $assignedHouse = "Gryffindor"
            }
            elseif ($assignedNumber -eq 2) 
            {
                $assignedHouse = "Hufflepuff"    
            }
            elseif ($assignedNumber -eq 3) 
            {
                $assignedHouse = "Ravenclaw"    
            }
            elseif ($assignedNumber -eq 4) 
            {
                $assignedHouse = "Slytherin"    
    
            }
            Write-Output "The sorting Hat has assigned you to $assignedHouse!"
        }
        elseif($assignMuggle -eq 2)
        {
            Write-Output "You are a Muggle. You will be put on the train back to Platform 9 3/4 (How did they get on the train in the first place if you are Muggle?)"
        }          
    
    # 3. Output
        Write-Output "Thanks for using the Hogwarts Sorting Hat!"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main