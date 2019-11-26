#############################################################
#    Author: Zachary Johnson                                #
#    Date: Nov, 18, 2019                                    #
#    Description: The Itsy Bitsy Assignment 4 - Project 2   #
#############################################################

# COMMENT ABOVE
function Catch-Error($InInputTextFile, $InInputCSVFile, $InOutputFile, $OutFileDataToAlter)
{
    # INITILIZE VARIABLE
    $letterRegEx = "^\D+$"

    # IF PASSED IN VARIABLE IS ININPUTFILE THEN CONTINUE
    # IF NOT THEN ELSEIF
    if($InInputTextFile -match $letterRegEx)
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
    elseif($InInputCSVFile -match $letterRegEx)
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

    # TITLE
    Write-Output "The Itsy Bitsy Aardvark"

    # CYCLES THOUGH OPTIONS ONCE SET AT A TIME
    foreach($data in $choicesCSV)
    {
               
        Write-Output ("`nPlease choose {0}:" -f $data.Question)
        Write-Output ("a) {0}" -f $data.ChoiceOne)
        Write-Output ("b) {0}" -f $data.ChoiceTwo)
        Write-Output ("c) {0}" -f $data.ChoiceThree)
        Write-Output ("d) {0}" -f $data.ChoiceFour)
        Write-Output ("e) {0}" -f $data.ChoiceFive)
        
        # DO WHILE ERROR IS TRUE
        do
        { 
            # ASKS HOST FOR INPUT A-E
            $decision = Read-Host -Prompt "Enter Choice (a-e)"
            #IF INPUT IS A
            if($decision -eq "a")
            {
                # SAVES CHOICE ONE IN CHOSEN ARRAY
                $chosen += $data.ChoiceOne
                $error = $false
            }
            #IF INPUT IS B
            elseif($decision -eq "b")
            {
                $chosen += $data.ChoiceTwo
                $error = $false
            }
            #IF INPUT IS C
            elseif($decision -eq "c")
            {
                # SAVES CHOICE TWO IN CHOSEN ARRAY
                $chosen += $data.ChoiceThree
                $error = $false
            }
            #IF INPUT IS D
            elseif($decision -eq "d")
            {
                #SAVES CHOICE THREE IN CHOSEN ARRAY
                $chosen += $data.ChoiceFour
                $error = $false
            }
            #IF INPUT IS E
            elseif($decision -eq "e")
            {
                #SAVES CHOICE FOUR IN CHOSEN ARRAY
                $chosen += $data.ChoiceFive
                $error = $false
            }
            # IF PASSES ALL ELSEIF THNE SETS ERROR TO TRUE
            else 
            {
                $error = $true     
            }
        }
        while($error -eq $true)
    }

    # FOR LOOP TO REPLACE ALL _#_ STORY LINE OPTIONS WITH THE CHOSEN CHOICES
    # ALSO SETS SRINGS OF THE CHOSEN WORDS TO UPPER BEFORE REPLACING
    for($i = 0; $i -lt $chosen.length; $i++)
    {
        $replace = "_"+($i + 1)+"_"
        
        $storyText = $storyText -replace $replace, $chosen[$i].ToUpper()
    }

    # OUTPUTTING THAT BELOW IS THE EDITED STORY
    Write-Output "`nYour Completed Story:`n"
    # OUTPUTS THE STORY THAT HAS BEEN CREATED
    $storyText


}

# DO NOT EDIT: Trigger our main function to launch the program
main