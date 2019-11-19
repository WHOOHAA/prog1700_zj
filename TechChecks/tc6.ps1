##################################
#    Author: Zachary Johnson     #
#    Date: Nov, 19, 2019         #
#    Description: TechCheck 6    #
##################################

# DO NOT EDIT: The main function to house our program code 
function main {

    # INITIALIZE VALUE
    $continue = ""

    # FILE NAME TO READ
    $inputFile = "monsters.csv" 

    # IF ERROR THEN OUTPUT TEXT ONLY AND EXIT PROGRAM
    try
    {    
        # READ IN A CSV FILE WITH HEADINGS
        $csvData = Import-Csv $inputFile
    }
    catch [System.IO.DirectoryNotFoundException]
    {
        Write-Output "That directory does not exist"
        EXIT
    }
    catch
    {
        Write-Output "Unspecified Error"
        EXIT
    }    
    

    # DO ATLEAST ONCE AND CONTINUE UNTILL $continue -ne TO Q
    do
    {   
        # PROGRAM WELCOME MESSAGE AND INPUT FOR $continue
        Write-Output "Welcome to the Dungeon Attack application where none shall survive! Simply try to live as long as you can."
        $continue = Read-host "Hit any key to continue ('Q' or 'q' to quit)"
        # $continue -eq Q THEN BREAK
        if ($continue -eq "Q") 
        {
            break    
        }
        Write-Output ""
        
        # DO ATLEAST ONCE UNTILL BETWEEN 1 AND 200
        do
        {
            # CATCH ERROR IF NOT A NUMBER OR BETWEEN 1 AND 200
            try
            {
                $hitPoints = [int](Read-Host -Prompt "Please enter your initial hit points (1-200)")
                if($hitPoints -gt 200 -or $hitPoints -lt 1)
                {
                    throw "Not between 1 and 200"
                }
            }
            Catch
            {
                Write-Output "You do not listen very well do you? Think you are going to survive this dungeon?"
            }
        }
        while($hitPoints -gt 200 -or $hitPoints -lt 1)

        # DO ATLEAST ONCE UNTILL $hitPoints -eq 0
        do
        {
            Write-Output ("=" * 100)
            # RUN THOUGH EACH ARRAY
            foreach($data in $csvData)
            {
                # IF  $hitPoints ARE -gt 0 THEN SUPTRACT EACH ARRAYS $damage FROM $hitPoints 
                if($hitPoints -gt 0)
                {
                    $hitPoints = [int]($hitPoints) - [int]($data.damage)
                    # IF $hitPoints ARE -lt 0 SET TO 0
                    if($hitPoints -le 0)
                    {
                        $hitPoints = 0
                    }
                    # SHOWING EACH ATTACK
                    Write-Output("You were attacked by a {0} with a {1} for {2}. Current hit points: {3}"-f $data.monster,$data.attack,$data.damage,$hitPoints)
                }      
            }
            # STATING YOU DEFENCE AND HOW THE ELF NOW FEELS
            Write-Output "That was sad. And brief. Atleast the elf feels better about himself!!!`n"
        }  
        while($hitPoints -ne 0)      
    }
    while($continue -ne "Q")

    # ONCE QUIT FINAL DISPLAY MESSAGE
    Write-Output "Thats's it. Retreat in fear and warn your friends!"
}

# DO NOT EDIT: Trigger our main function to launch the program
main