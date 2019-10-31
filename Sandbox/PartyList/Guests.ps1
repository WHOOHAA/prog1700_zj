################################
#    Author: Zachary Johnson   #
#    Date: Oct. 21, 2019       #
#    Description: Guest List   #
################################




# DO NOT EDIT: The main function to house our program code 
function main {
    #Creat an empty array variable to hold guest names
    $partyGuests = @()
    # while look to enter party guest name Q to quit
    $guestName= ""
    
    while($guestName -ne "Q")
    {
        $guestName = Read-Host -Prompt "Enter guest name ('Q' to quit)"
        
        if($guestName -ne "Q")
        {
            $partyGuests += $guestName
        }
    }
    
    # sort and save
    $partyGuests = $partyGuests | Sort-object

        3 output
    Write-Output "The guest list is:"
    Write-Output $partyGuests
    Write-Output "Program Complete!"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main