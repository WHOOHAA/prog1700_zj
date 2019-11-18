###################################################################
#    Author: Zachary Johnson                                      #
#    Date: Nov, 18, 2019                                          #
#    Description: Landscape Calculator Assignment 2 - Project 1   #
###################################################################




# DO NOT EDIT: The main function to house our program code 
function main {

    # FILE NAME TO READ
    $inputFile = "C:\windows\system32\airline-safety.csv"

    # CATCHES ERRORS FOR DIRECTORY/FILE NOT EXISTING AND OTHER ERRORS 
    try
    {    
        # READ IN A CSV FILE WITH HEADINGS
        $csvData = Import-Csv $inputFile
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


    # INITILIZATION OF $highestRatio
    $highestRatio = 0

    # ADDS BOTH FATALITIS DATA TOGETHER AND DEVIDES IT BY THE   85_99 AND AVERAGE NUMBER OF LM TRAVELED PER AVAILABLE SEAT
    foreach($data in $csvData)
    {
        [float]($totalFatalitiesRatio) = ([int]($data.fatalities_85_99) + [int]($data.fatalities_00_14)) / [float]($data.avail_seat_km_per_week)

        # CHECKS THE HIGHEST RATIO WITH THE CURRENT ONE
        # WHEN THE CIRRENT RATIO IS HIGHER IT SETS THE NEW HIGHEST RATIO AND THE AIRLINE IT IS CORISPONDING WITH AS VARIABLES FOR OUTPUT LATER 
        if($totalFatalitiesRatio -gt $highestRatio)
        {
            $highestRatio = $totalFatalitiesRatio
            $airlineHighestRatio = $data.airline
        }
    }
    
    # OUTPUTS THE HIGHEST RATIO AND THE AIRLINE IS CORISPONDS WITH
    Write-Output ("{0} has {1} fatalities per km traveled." -f $airlineHighestRatio, $highestRatio)
}

# DO NOT EDIT: Trigger our main function to launch the program
main