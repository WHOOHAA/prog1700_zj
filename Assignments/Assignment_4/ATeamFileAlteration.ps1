#####################################################################
#    Author: Zachary Johnson                                        #
#    Date: Nov, 18, 2019                                            #
#    Description: A Team File Alteration Assignment 4 - Project 1   #
#####################################################################

function Catch-Error($InInputFile, $InOutputFile, $OutFileDataToAlter)
{
    $numberRegEx = "^\D+$"
    if($InInputFile -match $numberRegEx)
    {
        # IF ERROR THEN OUTPUT TEXT ONLY AND EXIT PROGRAM
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

        RETURN $OutFileDataToAlter
    }
    elseif($InOutputFile -match $numberRegEx)
    {
        try
        {
            Clear-Content -Path $outputFile -ErrorAction Stop
        } 
        catch
        {
            
        }
        try
        {
            # Clear-Content -Path $outputFile
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

    $inputFile = "ateam_Original.txt"
    $outputFile =  "ateam_Altered.txt"
    $lineOmit = 0
    $alteredData = @()
    
    $fileDataToAlter = Catch-Error -InInputFile $inputFile

    Write-Output ("-" * 40)
    Write-Output "Origional Text"
    Write-Output ("-" * 40)
    Write-Output $fileDataToAlter
    Write-Output ""
    
    $lineOmit = Get-Random -Minimum 1 -Maximum ($fileDataToAlter.Length + 1)

    Write-Output ("-" * 40)
    Write-Output "Altered Text"
    Write-Output ("-" * 40)
    
    for($i = 0; $i -lt $fileDataToAlter.Length; $i++)
    {
        $lineNumber = $i + 1
        $lineNumberOutput = [string]($lineNumber) + ": "

        if($lineNumber -match $lineOmit)
        {
            $lineNumberOutput = ""
            $fileDataToAlter[$i] = ""
            $alteredLine = $lineNumberOutput + $fileDataToAlter[$i]
        }
        elseif ($fileDataToAlter[$i].Length -le 20) 
        {
            $alteredLine = $lineNumberOutput + $fileDataToAlter[$i].ToUpper()
        }
        elseif ($fileDataToAlter[$i].Length -gt 20) 
        {
            $alteredLine = $lineNumberOutput + $fileDataToAlter[$i].ToLower()
        }
        $alteredData += $alteredLine
    }

    Write-Output $alteredData

    Catch-Error -InOutputFile $outputFile -OutFileDataToAlter $alteredData
}

# DO NOT EDIT: Trigger our main function to launch the program
main