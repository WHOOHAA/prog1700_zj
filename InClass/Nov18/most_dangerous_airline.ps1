###################################################################
#    Author: Zachary Johnson                                      #
#    Date: Nov, 18, 2019                                          #
#    Description: Landscape Calculator Assignment 2 - Project 1   #
###################################################################




# DO NOT EDIT: The main function to house our program code 
function main {

    # FILE NAME TO READ
    $inputFile = "airline-safety.csv"

    #read in a csv file with headings
    $csvData = Import-Csv $inputFile

    $highestRatio = 0

    Write-Output "Airline `t Total Fatalities 1985 to 2014 per (average km flown per week)"
    foreach($data in $csvData)
    {
        $totalFatalitiesRatio = ([int]($data.fatalities_85_99) + [int]($data.fatalities_00_14)/$data.avail_seat_km_per_week)
        Write-Output ("{0}`t{1}" -f $data.airline, $totalFatalities) 

        if($totalFatalitiesRatio -gt $highestRatio)
        {
            $highestRatio = $totalFatalities
        }
    }


    foreach($data in $csvData)
    {
        if($data -eq $highestRatio)
        Write-Output ("{0}`t{1}" -f $data.airline, $highestRatio) 
    }
    Write-Output $highestRatio
}

# DO NOT EDIT: Trigger our main function to launch the program
main