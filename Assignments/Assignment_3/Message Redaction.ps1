################################################################
#    Author: Zachary Johnson                                   #
#    Date: Nov. 03, 2019                                       #
#    Description: Message Redaction Assignment 3 - Project 2   #
################################################################




# DO NOT EDIT: The main function to house our program code 
function main {

    

    # $redactArray = @()
    # $redactedArray = @()
    $userPhrase = "Imagination is more important than knolege."
    $userRedact = "a,i,k,j"
    
    $phraseArray = $userPhrase.ToCharArray()
    $redactArray = $userRedact -split ","

    # for($i = 0; $i -lt $redactArray.Length; $i++)
    # {
    #    $redactedPhrase = $userPhrase -replace $redactArray[$i], "_"
    # }

    # compare-object -referenceobject $userPhrase -differenceobject $redactedPhrase
    
    $redactedPhrase = ""
    
    
    for($i = 0; $i -lt $phraseArray.Length; $i++)
    {
        # CHECK IF CURRENT LETTER IN LIST TO REMOVE
        if($redactArray -Contains $phraseArray[$i])
        {
            $redactedPhrase += "_"
            $count++
        }
        else 
        {
            $redactedPhrase += $phraseArray[$i]    
        }


        # for($j = 0; $j -lt $redactArray.Length; $j++)
        # {
        #     if($phraseArray[$i] -eq  $redactArray[$j])
        #     {
        #         $redactedArray += $phraseArray[$i] -replace $redactArray[$j]
        #     }
        #     else
        #     {
        #         $redactedArray += $phraseArray[$i]
        #     }
        # }
    }
    
    Write-Output $redactedPhrase
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main










# $testString = "The rain in spain falls mainly on the plain"

    # #Write-Output ($testString -replace "a","-")

    # for($i = 0;$i -lt $testString.Length; $i++)
    # {
    #     if($testString[$i] -eq "a")
    #     {
    #         Write-Output "-"
    #     }
    #     else
    #     {
    #     Write-Output $testString[$i]
    #     }
    # }