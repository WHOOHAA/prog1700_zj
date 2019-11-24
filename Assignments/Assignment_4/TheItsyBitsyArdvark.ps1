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
            $OutFileDataToAlter = Get-Content  $InInputCSVFile
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
    $dataCSV = @()
    $tempDataCSV = @()
    $choicesCSV = @()
    $choiceAnimal = @()
    $choiceActionOne = @()
    $choiceAdjective = @()
    $choiceActionTwo = @()
    $choiceNoun = @()
    $choiceActionThree = @()
    $choiceAdverb = @()


    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $storyText = Catch-Error -InInputTextFile $inputTextFile
    $dataCSV = Catch-Error -InInputCSVFile $inputCSVFile
    
    foreach($data in $dataCSV)
    {
        $choicesCSV += $data -split ","
    }

    for ($i = 0; $i -lt $choicesCSV.length; $i++)
    {
        if($i -le 5)
        {
            $choiceAnimal += $choicesCSV[$i]
        }
        elseif($i -le 11)
        {
            $choiceActionOne += $choicesCSV[$i]
        }
        elseif($i -le 17)
        {
            $choiceAdjective += $choicesCSV[$i]
        }
        elseif($i -le 23)
        {
            $choiceActionTwo += $choicesCSV[$i]
        }
        elseif($i -le 29)
        {
            $choiceNoun += $choicesCSV[$i]
        }
        elseif($i -le 35)
        {
            $choiceActionThree += $choicesCSV[$i]
        }
        elseif($i -le 42)
        {
            $choiceAdverb += $choicesCSV[$i]
        }
    }

    # for ($i = 7; $i -le 13; $i++)
    # {

    #     $choiceAnimal = @()


    # }


    # for ($i = 14; $i -le 20; $i++)
    # {

    #     $choiceActionOne = @()


    # }


    # for ($i = 0; $i -le 6; $i++)
    # {

    #     $choiceAdjective = @()


    # }


    # for ($i = 0; $i -le 6; $i++)
    # {
    #     $choiceActionedTwo = @()



    # }

    
    # for ($i = 0; $i -le 6; $i++)
    # {

    #     $choiceNoun = @()


    # }


    
    # for ($i = 0; $i -le 6; $i++)
    # {

    #     $choiceActionThree = @()


    # }


    
    # for ($i = 0; $i -le 6; $i++)
    # {

    #     $choiceAdverb = @()


    # }



    # for($i = 0; $i -lt $dataCSV.Length; $i++)
    # {
    #     $tempDataCSV[$i] = $dataCSV[$i] -split ","


    #     for($j = 0; $j -lt $dataCSV.Length; $j++)
    #     {
    #         $choicesCSV[$i][$j] = $tempDataCSV[$j] 
    #     }
    # }


    # for($i = 0; $i -lt $dataCSV.Length; $i++)
    #         {
    #         $choicesCSV += ""
    #         }

    # for($i = 0; $i -lt $dataCSV.Length; $i++)
    #         {
    #         $choicesCSV$i += $dataCSV[$i] -split ","
    #        }

    # FORLOOP CYCLING THOUGH EACH LINE IN THE ORIGIONAL TEXT ARRAY
    # for($i = 0; $i -lt $choicesCSV.Length; $i++)
    # {

    #     for($j = 0; $j -lt $choicesCSV[$i].Length; $j++)
    #     {
    #         # ADDING 1 TO THE CURRENT CYCLE TO BECOME THE NEW LINE NUMBER
    #         $choiceNumber = $j + 1
    #         # $choiceNumberOutput = [string]($choiceNumber) + ") "

    #         Write-Output ("{0}) {1}" -f $choiceNumber, $choicesCSV[$i][$j])
            
    #     }

    # }




    # for($i = 0; $i -lt $storyText.Length; $i++)
    # {
    #     ($choiceOne, $choiceTwo, $choiceThree, $choiceFour, $choiceFive, $choiceSix)

    # }

}

# DO NOT EDIT: Trigger our main function to launch the program
main