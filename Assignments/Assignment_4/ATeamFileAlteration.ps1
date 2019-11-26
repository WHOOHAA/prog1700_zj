#####################################################################
#    Author: Zachary Johnson                                        #
#    Date: Nov, 18, 2019                                            #
#    Description: A Team File Alteration Assignment 4 - Project 1   #
#####################################################################

# ERROR CHECKING USING TRY AND CATCH WHEN GATHERING INFORMATION FROM FILES THERE IS MORE DETAILS BELOW
function Catch-Error($InInputFile, $InOutputFile, $OutFileDataToAlter)
{
    # INITILIZE VARIABLE
    $numberRegEx = "^\D+$"

    # IF PASSED IN VARIABLE IS ININPUTFILE THEN CONTINUE
    # IF NOT THEN ELSEIF
    if($InInputFile -match $numberRegEx)
    {
        # IF ERROR CATCH THEN OUTPUT TEXT ONLY AND EXIT PROGRAM
        try
        {
            $OutFileDataToAlter = Get-Content $InInputFile
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
        # IF RUNS THROUGH THEN RETURN THE TXT FILE DATA TO THE MAIN FUNCTION
        RETURN $OutFileDataToAlter
    }
    # IF PASSED IN VARIABLE IS INOUTPUTFILE THEN CONTINUE
    elseif($InOutputFile -match $numberRegEx)
    {
        # TRYS TO CLEAR CONTENT FORM ALTERED TEXT FILE
        # IF FILE DOESNT EXISTING CATCH AND OUTPUT NOTHING
        try
        {
            Clear-Content -Path $outputFile -ErrorAction Stop
        } 
        catch
        {
            
        }
        
        # SAVES THE ALTERED TEXT TO THE NEW ALTERD FILE
        # IF ERROR CATCH AND OUTPUT TEXT ONLY AND EXIT
        try
        {
            $alteredData -join "`n" | Add-Content -Path $outputFile -ErrorAction Stop
        }
        catch [System.UnauthorizedAccessException]
        {
            Write-Output "You dont have access to that folder"
            EXIT
        }    
        catch [System.IO.DirectoryNotFoundException]
        {
            Write-Output "That directory does not exist"
            EXIT
        }
        catch
        {
            Write-Output "Unspecified Error writing file"
            EXIT
        }
    }
}

# DO NOT EDIT: The main function to house our program code 
function main {

    # INITILIZING VARIABLES
    $inputFile = "new_test_input.txt"
    $outputFile =  "ateam_Altered.txt"
    $lineOmit = 0
    $alteredData = @()
    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $fileDataToAlter = Catch-Error -InInputFile $inputFile

    # HEADER STATING THE BELOW TEXT IS THE ORIGIONAL FORM THE TXT FILE
    Write-Output ("-" * 40)
    Write-Output "Origional Text"
    Write-Output ("-" * 40)
    
    # OUTPUT THE ORIGIONAL TEXT
    Write-Output $fileDataToAlter
    Write-Output ""
    
    # RANDOM NUMBER IS GENERATED BETWEEN 1 AND THE LAST ARRAY LINE NUMBER TO OMIT
    $lineOmit = Get-Random -Minimum 1 -Maximum ($fileDataToAlter.Length + 1)

    # HEADER STATING THE BELOW TEXT IS ALTERED
    Write-Output ("-" * 40)
    Write-Output "Altered Text"
    Write-Output ("-" * 40)
    
    # FORLOOP CYCLING THOUGH EACH LINE IN THE ORIGIONAL TEXT ARRAY
    for($i = 0; $i -lt $fileDataToAlter.Length; $i++)
    {
        # ADDING 1 TO THE CURRENT CYCLE TO BECOME THE NEW LINE NUMBER
        $lineNumber = $i + 1
        # SETS LINE NUMBER WITH FORMATTING AS A STING FOR OUTPUT FOR LATER AS LINENUMBEROUTPUT
        $lineNumberOutput = [string]($lineNumber) + ": "

        # IF LINENUMER MATCHES LINEOMIT
        # SET LINENUMBEROUTUT AND FILEDATA THIS CYCLE AS ALTEREDLINE
        if($lineNumber -match $lineOmit)
        {
            $lineNumberOutput = ""
            $fileDataToAlter[$i] = ""
            $alteredLine = $lineNumberOutput + $fileDataToAlter[$i]
        }
        # IF FILEDATATOALTER THIS CYCLES LENGTH IS LESS OR EQUAL TO 20
        # ADD LINENUMBEROUTPUT AND AND FILEDATATOALTER THIS CYCLE AS UPPER TO ALTEREDLINE
        elseif ($fileDataToAlter[$i].Length -le 20) 
        {
            $alteredLine = $lineNumberOutput + $fileDataToAlter[$i].ToUpper()
        }
        # IF FILEDATATOALTER THIS CYCLES LENGTH IS GREATER THEN 20
        # ADD LINENUMBEROUTPUT AND AND FILEDATATOALTER THIS CYCLE AS LOWER TO ALTEREDLINE
        elseif ($fileDataToAlter[$i].Length -gt 20) 
        {
            $alteredLine = $lineNumberOutput + $fileDataToAlter[$i].ToLower()
        }

        # ADD ALTEREDLINE TO ALTEREDS DATA ARRAY
        $alteredData += $alteredLine
    }

    # OUTPUT THE ALTEREDDATA ARRAY
    Write-Output $alteredData

    # SENDS OUTPUTFILE AS INOUTPUTFILE 
    # AND SENDS ALTEREDDATA AS OUTFILEDATATOALTER TO CATCH-ERROR FUNCTION
    Catch-Error -InOutputFile $outputFile -OutFileDataToAlter $alteredData
}

# DO NOT EDIT: Trigger our main function to launch the program
main