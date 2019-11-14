######################################
#    Author: Zachary Johnson         #
#    Date: Nov. 14, 2019             #
#    Description: Party Guests Vr 3  #
######################################



# DO NOT EDIT: The main function to house our program code 
function main {

    #OUTPUTFILE
    $outputFile = "guests.csv"


    # INITIALIZE THE GUESTNAME VARIABLE
    $guestName = ""
    $age = 0
    $partyGuests = @()

    # LOOP OVER GUESTNAME ENTRY UNTILL Q TO QUIT
    
    do
    {
        
        $guestName = Read-Host -Prompt "Enter guest name ('Q' to quit)" 
        
        if($guestName -ne "Q")
        {
            while($true) # DANGEROUS LOOP
            {
                try
                {
                    $age = [int](Read-Host -Prompt "Enter guest age") # CAUSES SYSTEM EXCEPTION
                    
                    if($age -lt 1)
                    {
                        throw "Bad input"    # CAUSES OUR OWN SYTEM EXCEPTUON
                    }
                    break
                }
                catch
                {
                    Write-Output "Error: bad input"
                }
            }
            $partyGuests += "{0},{1}" -f $guestName, $age
        }  
    }
    while ($guestName -ne "Q")

    try
    {
        $partyGuests -join "`n" | Add-Content -Path $outputFile -ErrorAction Stop
    }
    catch [System.UnauthorizedAccessException]
    {
        Write-Output "You dont have access to that folder"
    }    
    catch [System.IO.DirectoryNotFoundException]
    {
        Write-Output "That directory does not exist"
    }
    catch
    {
        Write-Output "Unspecified Error writing file"
    }
    Write-Output "Program Done!"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main