#####################################################################
#    Author: Zachary Johnson                                        #
#    Date: Nov, 18, 2019                                            #
#    Description: The Itsy Bitsy Assignment 4 - Project 2   #
#####################################################################

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
            $OutFileDataToAlter = Import-Csv $InInputCSVFile
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
    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $storyText = Catch-Error -InInputTextFile $inputTextFile
    $choicesCSV = Catch-Error -InInputCSVFile $inputCSVFile
    
    
    # FORLOOP CYCLING THOUGH EACH LINE IN THE ORIGIONAL TEXT ARRAY
    for($i = 0; $i -lt $choicesCSV.Length; $i++)
    {

        for($j = 0; $j -lt $choicesCSV[$i,$j].Length; $j++)
        {
            # ADDING 1 TO THE CURRENT CYCLE TO BECOME THE NEW LINE NUMBER
            $choiceNumber = $j + 1
            # $choiceNumberOutput = [string]($choiceNumber) + ") "

            Write-Output ("{0}) {1}" -f $choiceNumber, $choicesCSV.[$i,$j])
            
        }

    }

}

# DO NOT EDIT: Trigger our main function to launch the program
main