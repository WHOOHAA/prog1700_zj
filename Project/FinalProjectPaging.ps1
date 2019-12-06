###################################
#    Author: Zachary Johnson      #
#    Date: Dec, 4, 2019           #
#    Description: Final Project   #
###################################




# DO NOT EDIT: The main function to house our program code 
function main {
   
    # Initilaize variables
    $rows = 1000
    $start = 0
    $dataToConvert = @()

    do
    {   
        # accesss the API and retrieve all data
        try
        {
            
            # Allows secure cennection
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

            # Read To Search
            $search = Read-Host -Prompt "Please enter what you would like to search"

            # Prevents the delay of a dearch if contains only a blank (enter) or a space
            if($search -eq $null -or $search -eq " ")
            {
                throw "Blank is not accepted as an input."
            }

            $searchGovCan = ("https://open.canada.ca/data/en/api/3/action/package_search?q={0}&rows={1}&start={2}" -f $search, $rows, $start)


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





            
            #$allData = Invoke-RestMethod -Uri "https://open.canada.ca/data/en/api/3/action/package_search?q=parks&rows=100&start=1000"
            #.organization.title

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
        Write-Output ("en: {0} `nOrganization: {1}" -f $data.title_translated.en, $data.organization.title)
        $dataToConvert += $data.title_translated
        $dataToConvert += $data.organization
    }

    # $allData.result.results.title_translated.en | Out-GridView -Title $search -CssUri ".\css_styles.css"

        # Converts $allData to $dataHTML, adds Css formatting, filters out all but  information, adds Pre and Post message, result.results.organization.title
        $dataHTML = $dataToConvert | ConvertTo-Html -Property en, title -PRE ("<h1> Generated HTML List Search of {0} </h1>" -f $search ) -POST "THANKS FOR SEARCHING"
        #$dataHTML +=  | ConvertTo-Html  -Property  

        # Saves file as Park-HTMP.html with utf8 encoding
        $dataHTML | Out-File -FilePath OpenCanadaSearch.html -Encoding utf8
    
    # Progream finished message
    Write-Output "Program Done"
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main