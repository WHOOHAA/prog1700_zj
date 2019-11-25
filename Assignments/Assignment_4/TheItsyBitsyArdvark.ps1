#############################################################
#    Author: Zachary Johnson                                #
#    Date: Nov, 18, 2019                                    #
#    Description: The Itsy Bitsy Assignment 4 - Project 2   #
#############################################################

# COMMENT ABOVE
function Catch-Error($InInputTextFile, $InInputCSVFile, $InOutputFile, $OutFileDataToAlter)
{
    # INITILIZE VARIABLE
    $numberRegEx = "^\D+$"

    # IF PASSED IN VARIABLE IS ININPUTFILE THEN CONTINUE
    # IF NOT THEN ELSEIF
    if($InInputTextFile -match $numberRegEx)
    {
        # IF ERROR CATCH THEN OUTPUT TEXT ONLY AND EXIT PROGRAM
        try
        {
            $OutFileDataToAlter = Get-Content $InInputTextFile
        }
        catch [System.IO.DirectoryNotFoundException]
        {
            Write-Output "That directory does not exist"
            EXIT
        }
        catch
        {
            Write-Output "Unspecified Error"
            # EXIT
        }    
        # IF RUNS THROUGH THEN RETURN THE TXT FILE DATA TO THE MAIN FUNCTION
        RETURN $OutFileDataToAlter
    }
    elseif($InInputCSVFile -match $numberRegEx)
    {
        # IF ERROR CATCH THEN OUTPUT TEXT ONLY AND EXIT PROGRAM
        try
        {
            $OutFileDataToAlter = Import-CSV  $InInputCSVFile -Header "Question","ChoiceOne","ChoiceTwo","ChoiceThree","ChoiceFour","ChoiceFive"
        }
        catch [System.IO.DirectoryNotFoundException]
        {
            Write-Output "That directory does not exist"
            EXIT
        }
        catch
        {
            Write-Output "Unspecified Error"
            # EXIT
        }    
        # IF RUNS THROUGH THEN RETURN THE TXT FILE DATA TO THE MAIN FUNCTION
        RETURN $OutFileDataToAlter
    }
   
}

# DO NOT EDIT: The main function to house our program code 
function main {

    # INITILIZING VARIABLES
    $inputTextFile = "the_choices_file.txt"
    $inputCSVFile = "the_choices_file.csv"
    $choicesCSV = @()
    $decision = @()
    $chosen = @()



    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $storyText = Catch-Error -InInputTextFile $inputTextFile
    $choicesCSV = Catch-Error -InInputCSVFile $inputCSVFile

    foreach($data in $choicesCSV)
    {
        Write-Output $data.Question
        Write-Output $data.ChoiceOne
        Write-Output $data.ChoiceTwo
        Write-Output $data.ChoiceThree
        Write-Output $data.ChoiceFour
        Write-Output $data.ChoiceFive
        $decision = Read-Host -Prompt "Choose between a-e"
        if($decision -eq "a")
        {
            $chosen += $data.ChoiceOne
        }
        elseif($decision -eq "b")
        {
            $chosen += $data.ChoiceTwo
        }
        elseif($decision -eq "c")
        {
            $chosen += $data.ChoiceThree
        }
        elseif($decision -eq "d")
        {
            $chosen += $data.ChoiceFour
        }
        elseif($decision -eq "e")
        {
            $chosen += $data.ChoiceFive
        }
        
    }

    # $storyText -replace "_1_", $chosen[0]
    # $joinedStoryText = $storyText -join "`n"

    for($i = 0; $i -lt $chosen.length; $i++)
    {
        $replace = "_"+($i + 1)+"_"
        
        $storyText = $storyText -replace $replace, $chosen[$i]
    }


   $storyText


}

# DO NOT EDIT: Trigger our main function to launch the program
main