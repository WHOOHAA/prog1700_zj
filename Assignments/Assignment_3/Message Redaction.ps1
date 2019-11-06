################################################################
#    Author: Zachary Johnson                                   #
#    Date: Nov. 03, 2019                                       #
#    Description: Message Redaction Assignment 3 - Project 2   #
################################################################


# TAKES $INUSERINPUT from $userInput AND CHECKS FOR DIGITS. 
# IF NON DIGIT IT WILL RETURN $ERROROUT AS $true
# IF CONTAINS ONLY DIGITS IT WILL RETURN $ERROROUT AS $false
function Check-InputError ($INUSERINPUT)
{
    $numberRegEx = "^\d+$"
    $letterRegEx = "^\D+$"

    
    if($INUSERINPUT -Match $numberRegEx -or $INUSERINPUT -Match $letterRegEx)
    {
        $OUTERROR = $false
    }
    else 
    {
        $OUTERROR = $true
    }
    return $OUTERROR
}


# DO NOT EDIT: The main function to house our program code 
function main {
    while($userPhrase -ne "quit")
    {
        $redactedPhrase = ""
        $numberRedacted = 0
        do
        {   
            $userPhrase = Read-Host -Prompt "Type a phrase (or quit to exit program)"
            $error = Check-InputError -INUSERINPUT $userPhrase
            if($userPhrase -eq "quit")
            {
                Exit
            }
        }
        
        while($error -ne $false)  
        
        
            do
            {      
                $userRedact = Read-Host -Prompt "`nType a comma-separated list of letters to redact"
                $error = Check-InputError -INUSERINPUT $userRedact                
            } 
            While($error -ne $false)     
        

            $phraseArray = $userPhrase.ToCharArray()
            $redactArray = $userRedact -split ","
            

            for($i = 0; $i -lt $phraseArray.Length; $i++)
            {
                # CHECK IF CURRENT LETTER IN LIST TO REMOVE
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
            Write-Output "Number of letters redacted: $numberRedacted"
            Write-Output "$redactedPhrase `n"
        } 
}

# DO NOT EDIT: Trigger our main function to launch the program
main