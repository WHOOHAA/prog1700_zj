################################
#    Author: Zachary Johnson   #
#    Date: Oct. 19, 2019       #
#    Description: The Matrix   #
################################




# DO NOT EDIT: The main function to house our program code 
function main {

    # CREAT AN EMPTY ARRAY FOR THE MATRIX
    $matrix = @()

    # ADD FIVE ROWS OF 1-D ARRYS TO THE ARRAY
    for($i = 0; $i -lt 5; $i++)
    {
        $row = @()

        # ADD FIVE ELEMEBTS TO A NEW 1-D ARRAY
        for($j = 0; $j -lt 5; $j++)
        {
        $row += Get-Random -Minimum 1 -Maximum 101
        }

        $matrix += ,$row
    }

    
    Write-Output "The MATRIX is REAL `n"
    # OUTPUT THE WHOLE OUTPUT ARRAY NICELY ONE ROW AT A TIME
    for($i = 0; $i -lt $matrix.Length; $i++)
    {
        $outputLine = ""
        # THIS GOES OVER EACH ELEMENT IN THE CURRENT ROW
        for($j = 0; $j -lt $matrix[$i].Length; $j++)
        {
            $outputLine += $matrix[$i][$j] 
            $outputLine += " "
        }
        Write-Output $outputLine
        #Write-Output ("=" * 40)
    }
    
    
}

# DO NOT EDIT: Trigger our main function to launch the program
main