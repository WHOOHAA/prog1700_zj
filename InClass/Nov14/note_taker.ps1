######################################
#    Author: Zachary Johnson         #
#    Date: Nov. 14, 2019             #
#    Description: note taker ver 2   #
######################################



# DO NOT EDIT: The main function to house our program code 
function main {

    #OUTPUTFILE
    $outputFile = "note_log.txt"


    # INITIALIZE THE $note, $numbeOfTimes,  VARIABLE
    $note = ""
    $numberOfTimes = 0
    $fullNote = @()

    # LOOP OVER GUESTNAME ENTRY UNTILL Q TO QUIT
    
    do
    {
        
        $dateTime = Get-Date -Format "yyyy-MM-dd hh:mm:ss:ffffff"
        $note = Read-Host "Enter your note"
        
        if($note -ne "Q")
        {
            while($true) # DANGEROUS LOOP
            {
                try
                {
                    $numberOfTimes = [int](Read-Host -Prompt "Enter how many times the you repeated the task") # CAUSES SYSTEM EXCEPTION
                    
                    if($numberOfTimes -lt 1)
                    {
                        throw # CAUSES OUR OWN SYTEM EXCEPTUON
                    }
                    elseif($numberOfTimes -eq 1)
                    {
                        $numberOfTimesFormatted = "time"
                    }
                    elseif($numberOfTimes -gt 1)
                    {
                        $numberOfTimesFormatted = "times"
                    }
                    break

                }
                catch
                {
                    Write-Output "Error: bad input"
                }
            }
            $fullNote += "{0} {1} {2} {3}." -f $dateTime, $note,  $numberOfTimes, $numberOfTimesFormatted
        }  
    }
    while ($note -ne "Q")

    try
    {
        $fullNote -join "`n" | Add-Content -Path $outputFile -ErrorAction Stop
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