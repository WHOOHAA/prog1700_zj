################################################################
#    Author: Zachary Johnson                                   #
#    Date: Nov. 03, 2019                                       #
#    Description: Message Redaction Assignment 3 - Project 2   #
################################################################


# TAKES $INUSERINPUT from $userPhrase, $userRedact AND CHECKS FOR LETTER AND DIGITS. 
# IF NON DIGITS AND/OR NON LETTERS IT WILL RETURN $OUTERROR AS $true
# IF CONTAINS ONLY DIGITS AND/OR LETTERS IT WILL RETURN $OUTERROR AS $false
function Check-InputError ($INUSERINPUT)
{
    $numberRegEx = "^\d+$"
    $letterRegEx = "^\D+$"
    $OUTERROR = $true
    
    if($INUSERINPUT -Match $numberRegEx -or $INUSERINPUT -Match $letterRegEx)
    {
        $OUTERROR = $false
    }
    
    return $OUTERROR
}


# DO NOT EDIT: The main function to house our program code 
function main {
    
    #RUNS UNTILL $userPhrase -EQ "quit"
    while($userPhrase -ne "quit")
    {
        # SETS VARIABLES
        $redactedPhrase = ""
        $numberRedacted = 0
        
        # PROMPTS FOR THE PHRASE UNTILL REQUIRMENT IS MET -EQ "^\D+$" AND QUIT TO EXIT THE PROGRAM
        do
        {   
            $userPhrase = Read-Host -Prompt "Type a phrase (or quit to exit program)"
            $error = Check-InputError -INUSERINPUT $userPhrase
            
            # $userPhrase -EQ QUIT THEN EXITS THE PROGRAM
            if($userPhrase -eq "quit")
            {
                Exit
            }
        }
        while($error -ne $false)  
        
        # PROMPTS FOR THE REDACT LIST UNTILL REQUIRMENT IS MET -EQ "^\D+$"
        do
        {      
            $userRedact = Read-Host -Prompt "`nType a comma-separated list of letters to redact"
            $error = Check-InputError -INUSERINPUT $userRedact                
        } 
        While($error -ne $false)     
    
        # BREAKES UP THE USER PHRASE INTO AN ARRAY FOR EACH LETTER INTO THE PHRASE ARRAY
        $phraseArray = $userPhrase.ToCharArray()
        # SPLITS UP THE USER REDACT INTO REDACT ARRAY AT EACH ","
        $redactArray = $userRedact -split ","
        
        # RUNS THROUGHT THE TOTAL LENGTH OF THE PHRASE ARRAY
        for($i = 0; $i -lt $phraseArray.Length; $i++)
        {
            # CHECK IF CURRENT LETTER IS IN THE REDACT ARRAY LIST TO REMOVE IT WITH "_" TO THE REDACTED PHRASE ARRAY
            # COUNTS EACH REDACTED REPLACEMENT AS NUMBER REDACTED
            # IF NUMBER ISNT ON THE REDACT ARRAY LIST THEN IT READDS THE LETTER TO THE  REDACTED PHRASE ARRAY
            if($redactArray -Contains $phraseArray[$i])
            {
                $redactedPhrase += "_"
                $numberRedacted++
            }
            else 
            {
                $redactedPhrase += $phraseArray[$i]    
            }
        }


        # OUTPUTS THE NUMBER OF REDACTED LETTERS AND THE NEW REDACTED PHRASE
        Write-Output "Number of letters redacted: $numberRedacted"
        Write-Output "Redacted phrase: $redactedPhrase `n"
    } 
}

# DO NOT EDIT: Trigger our main function to launch the program
main