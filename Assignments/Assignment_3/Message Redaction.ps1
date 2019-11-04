################################################################
#    Author: Zachary Johnson                                   #
#    Date: Nov. 03, 2019                                       #
#    Description: Message Redaction Assignment 3 - Project 2   #
################################################################




# DO NOT EDIT: The main function to house our program code 
function main {

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

    $testString2 = "a,b,c,d"
    $letterArray = $testString2 -split ","
    Write-Output = $letterArray
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main