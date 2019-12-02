#################################
#    Author: Zachary Johnson    #
#    Date: Dec, 2, 2019         #
#    Description: TechCheck 7   #
#################################




# DO NOT EDIT: The main function to house our program code 
function main {
   
    # Website for api data collection
    $dataNHL = "https://statsapi.web.nhl.com/api/v1/teams" 

    # Inputting api as objects
    $allData = Invoke-RestMethod -Uri $dataNHL

    Write-Output "The Origional Six NHL Teams are:"
    Write-Output ("+" * 60)

    # Go over each row one at a time
    foreach($data in $allData.teams)
    {
        # If first year of play is before 1967 output taam name, venue name and first year of play
        if($data.firstYearOfPlay -lt 1967)
        {            
            Write-Output ("Name: {0} `nVenue: {1} `nDate: {2}" -f $data.name, $data.venue.name, $data.firstYearOfPlay)
            Write-Output ("-" * 60)
        }    
    }

    # Progream finished message
    Write-Output "Program Done"
 
}

# DO NOT EDIT: Trigger our main function to launch the program
main