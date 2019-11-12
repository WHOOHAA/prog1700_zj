################################
#    Author: Zachary Johnson   #
#    Date: Nov. 12, 2019       #
#    Description: Note Taker   #
################################


# DO NOT EDIT: The main function to house our program code 
function main {

    #OUTPUTFILE
    $outputFile = "note_log.txt"


    # INITIALIZE THE GUESTNAME VARIABLE
    $note = ""
    
    # LOOP OVER GUESTNAME ENTRY UNTILL Q TO QUIT
    
    do
    {
       
        $date = Get-Date -Format "yyyy-MM-dd hh:mm:ss:ffffff"
        $note = Read-Host -Prompt "Please enter your note ('Q' to quit)"

        if($note -ne "Q")
        {
        "{0} {1}" -f $date, $note  | Add-Content -Path $outputFile
        }

        
    }
    while ($note -ne "Q")

    # TEMP
    Write-Output "Program Done!"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main