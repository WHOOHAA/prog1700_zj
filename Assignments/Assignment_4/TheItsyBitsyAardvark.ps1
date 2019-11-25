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
    $error = $false
    $choicesCSV = @()
    $decision = @()
    $chosen = @()
    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $storyText = Catch-Error -InInputTextFile $inputTextFile
    $choicesCSV = Catch-Error -InInputCSVFile $inputCSVFile

    Write-Output "The Itsy Bitsy Aardvark"

    foreach($data in $choicesCSV)
    {
               
        Write-Output ("`nPlease choose {0}:" -f $data.Question)
        Write-Output ("a) {0}" -f $data.ChoiceOne)
        Write-Output ("b) {0}" -f $data.ChoiceTwo)
        Write-Output ("c) {0}" -f $data.ChoiceThree)
        Write-Output ("d) {0}" -f $data.ChoiceFour)
        Write-Output ("e) {0}" -f $data.ChoiceFive)
        do
        { 
            $decision = Read-Host -Prompt "Enter Choice (a-e)"
            if($decision -eq "a")
            {
                $chosen += $data.ChoiceOne
                $error = $false
            }
            elseif($decision -eq "b")
            {
                $chosen += $data.ChoiceTwo
                $error = $false
            }
            elseif($decision -eq "c")
            {
                $chosen += $data.ChoiceThree
                $error = $false
            }
            elseif($decision -eq "d")
            {
                $chosen += $data.ChoiceFour
                $error = $false
            }
            elseif($decision -eq "e")
            {
                $chosen += $data.ChoiceFive
                $error = $false
            }
            else 
            {
                $error = $true     
            }
        }
        while($error -eq $true)
    }

    for($i = 0; $i -lt $chosen.length; $i++)
    {
        $replace = "_"+($i + 1)+"_"
        
        $storyText = $storyText -replace $replace, $chosen[$i].ToUpper()
    }

    Write-Output "`nYour Completed Story:`n"
    $storyText


}

# DO NOT EDIT: Trigger our main function to launch the program
main