########################################################
#    Author: Zachary Johnson                           #
#    Date: 15 Oct 2019                                 #
#    Description: Hogwarts Sorting Hat with Functioin  #
########################################################

function Assign-House($InLastName)
{
    
    $assignedNumber = Get-Random -minimum 1 -maximum 5 # generate a random number between 1 and 4
    $assignMuggle = Get-Random -minimum 1 -maximum 3 # generate a random number between 1 and 2

        if($InLastName -eq "Potter")
        {
            $assignedNumber = 1
            $assignMuggle = 1
        }
        elseif($InLastName -eq "Malfoy")
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
                
        }
        elseif ($assignMuggle -eq 2)
        {
            $assignedHouse = "Muggle"
        }
        
    return $assignedHouse
}



# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input and variables
    $gryffindor = 0
    $hufflepuff = 0
    $ravenclaw = 0
    $slytherin = 0
    $muggle = 0

    # 2. Processing
   
    for ($i=0; $i -lt 10; $i++)
    {      
        $lastName = Read-Host -Prompt "Enter your last name"    
        $CurrentAssignedHouse = Assign-House -InLastName $lastname
        
        if($CurrentAssignedHouse -ne "muggle")
        {
            Write-Output "The sorting Hat has assigned you to $CurrentAssignedHouse!`n"
        }
        elseif($CurrentAssignedHouse -eq "Muggle")
        {
            $muggle++
            Write-Output "You are a Muggle. You will be put on the train back to Platform 9 3/4 (How did they get on the train in the first place if you are Muggle?)`n"
        }     
        
        if($CurrentAssignedHouse -eq "Gryffindor")
        {
            $gryffindor++

        }
        elseif ($CurrentAssignedHouse -eq "Hufflepuff") 
        {
            $hufflepuff++
        }
        elseif ($CurrentAssignedHouse -eq "Ravenclaw") 
        {
            $ravenclaw++    
        }
        elseif ($CurrentAssignedHouse -eq "Slytherin") 
        {
            $slytherin++ 
        }
           
    }
    # 3. Output
        Write-Output "Thanks for using the Hogwarts Sorting Hat!`n"
        Write-Output "There are: `n$gryffindor people in Gryddindor `n$hufflepuff people in Hufflepuff `n$ravenclaw people in Ravenclaw `n$slytherin people in Slytherin `n$muggle Muggles"
}

# DO NOT EDIT: Trigger our main function to launch the program
main