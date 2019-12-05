###################################
#    Author: Zachary Johnson      #
#    Date: Dec, 4, 2019           #
#    Description: Final Project   #
###################################




# DO NOT EDIT: The main function to house our program code 
function main {
   

    do
    {
        
        # Read To Search
        $search = Read-Host -Prompt "Please enter what you would like to search"

        $searchGovCan = ("http://open.canada.ca/data/en/api/3/action/package_search?q={0}" -f $search)


        # Allows secure cennection
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


        # accesss the API and retrieve all data
        try
        {


            $allData = Invoke-RestMethod -Uri $searchGovCan
            #$allData = Invoke-RestMethod -Uri "https://open.canada.ca/data/en/api/3/action/package_search?q=parks&rows=100&start=1000"
            #.organization.title

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



        # # get JSON Data from a public API that limits us to one page of 10 results at a time
        # do {

        #     $pagedSearchGovCan = Invoke-RestMethod -URI ("http://open.canada.ca/data/en/api/3/action/package_search?q{0}/page={1}" -f $search, $pagesRetreived) `
        #                                       #-Headers @{"accept"="application/json"}
    
        #     if($pagedSearchGovCan.results.length -ne 0)
        #     {
        #         $retrievedSearchGovCan += $pagedSearchGovCan.results
        #         $pagesRetreived++
        #     }
            
        # } while ($pagedSearchGovCan.results.length -eq 10) # ten is default limit, so if 10 there might be more pages
    
    # Go over each row onw at a time for each park
    foreach($data in $allData.result.results)
    {
        Write-Output ("-" * 40)
        Write-Output ("en: {0}" -f $data.title_translated.en)
    }

    # $allData.result.results.title_translated.en | Out-GridView -Title $search

        # Converts $allData to $dataHTML, adds Css formatting, filters out all but OBJECT ID, PARK ID, PARK NAME information, adds Pre and Post message
        $dataHTML = $allData.result.results | ConvertTo-Html -CssUri ".\css_styles.css" -Property title_translated.en, .organization.title -PRE ("<h1> Generated HTML List Search of {0} </h1>" -f $search ) -POST "THANKS FOR SEARCHING"
        
        # Saves file as Park-HTMP.html with utf8 encoding
        $dataHTML | Out-File -FilePath OpenCanadaSearch.html -Encoding utf8
    
    # Progream finished message
    Write-Output "Program Done"
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main