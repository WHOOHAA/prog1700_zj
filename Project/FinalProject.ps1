###################################################################
#    Author: Zachary Johnson                                      #
#    Date: Nov, 28, 2019                                          #
#    Description: Landscape Calculator Assignment 2 - Project 1   #
###################################################################




# DO NOT EDIT: The main function to house our program code 
function main {
   
    $searchSucces = $false

    do
    {
        
        # Read To Search
        $search = Read-Host -Prompt "Please enter what you would like to search"

        $searchGovCan = "http://open.canada.ca/data/en/api/3/action/package_search?q=" + "$search"

        # Allows secure cennection
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


        # accesss the API and retrieve all data
        try
        {


            $allData = Invoke-RestMethod -Uri $searchGovCan


            If($allData.result.results -eq $null)
            {
                $searchSuccess = $false
                Write-Output "Try Again"
            }
            elseIf($allData.success -eq $true)
            {
                $searchSuccess = $true
            }
        }
        catch
        {
            $searchSuccess = $false
            Write-Output "Try Again"

        }
    }
    While ($searchSuccess -eq $false)


    # Go over each row onw at a time for each park
    foreach($data in $allData)
    {
        Write-Output ("-" * 40)
        Write-Output ("1: {0} `t2: {1} `t3: {2}" -f $data.OBJECTID, $data.PARK_ID, $data.PARK_NAME)
    }
    
    # Progream finished message
    Write-Output "Program Done"
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main