######################################
#    Author: Zachary Johnson         #
#    Date: Nov. 12, 2019             #
#    Description: Party Guests Vr 2  #
######################################

function Check-InputError ($INCHECKLETTER, $INCHECKNUMBER)
{
    $numberRegEx = "^\d+$"
    $letterRegEx = "^\D+$"
    $OUTERROR = $true
    
    if($INCHECKLETTER -Match $letterRegEx)
    {
        $OUTERROR = $false
    }
    elseif($INCHECKNUMBER -Match $numberRegEx)
    {
        $OUTERROR = $false
    }
    
    return $OUTERROR
}


# DO NOT EDIT: The main function to house our program code 
function main {

    #OUTPUTFILE
    $outputFile = "guests.csv"


    # INITIALIZE THE GUESTNAME VARIABLE
    $guestName = ""
    $age = 0
    # LOOP OVER GUESTNAME ENTRY UNTILL Q TO QUIT
    
    do
    {
        do
        {
            $guestName = Read-Host -Prompt "Enter guest name ('Q' to quit)"
            $error = Check-InputError -INCHECKLETTER $guestName
        }
        while($error -ne $false)
            
        
        if($guestName -ne "Q")
        {
            do
            {
            $age = Read-Host -Prompt "Enter guest age"
            $error = Check-InputError -INCHECKNUMBER $age
            }
            while($error -ne $false)
        
            "{0},{1}" -f $guestName, $age  | Add-Content -Path $outputFile
        }  
    }
    while ($guestName -ne "Q")

    # TEMP
    Write-Output "Program Done!"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main