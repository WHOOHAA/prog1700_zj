######################################
#    Author: Zachary Johnson         #
#    Date: Nov, 18, 2019             #
#    Description: BallFieldSearcher  #
######################################




# DO NOT EDIT: The main function to house our program code 
function main {

    #input file variable
    $inputFile = "Ottawa_Ball_Diamonds_With_Headings.csv"

    #read data and save as raw data as a ext tile
    #$rawData = Get-Content $inputFile

    #read in a csv file with headings
    $csvData = Import-Csv $inputFile

    do
    {
        try 
        {
            $fieldType = Read-Host -Prompt "Enter field type (Softball, Baseball, T-Ball)"
            if($fieldType -ne "Softball" -and $fieldType -ne "Baseball" -and $fieldType -ne "T-Ball")
            {
                throw "Error!"
            }
        }
        catch 
        {
            Write-Output "Error!"
        }
    }while ($fieldType -ne "Softball" -and $fieldType -ne "Baseball" -and $fieldType -ne "T-Ball")

    #ask the user what type of ballfield to display
    #$fieldType = Read-Host -Prompt "Enter field type (Softball, Baseball, T-Ball)"

    #probably output the headers
    Write-Output "ID`tFIELD_NAME" 
    Write-Output ("=" * 40)

    #output raw data
    #Write-Output $rawData

    #first madeup variuable second the fariable you want printed
    foreach ($row in $csvData)
    {
        # Write-Output $row
        # Write-Output ("=" * 40)

        #output the facility id and field name only
        #Write-Output ("{0}`t{1}" -f $row.FACILITYID, $row.FIELD_NAME)

        #to search or filter we ned an if statement
        if($fieldType -eq $row.DIAMOND_TYPE)
        {
        #output the facility id and field name only
        Write-Output ("{0}`t{1}" -f $row.FACILITYID, $row.FIELD_NAME)
        }
    }

    #output csv data
    #Write-Output $csvData
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main