###################################
#    Author: Zachary Johnson      #
#    Date: Dec, 4, 2019           #
#    Description: Final Project   #
###################################

# function Count ($InCount)
# {
#     if ()
    
# }

# CLASS NAME
class SearchData
{
    #INITIALIZATION, NAMES ARE NOT CONVENTIONAL DUE TO SHOWING UP IN HTML TABLE OUTPUT
    [String] $Title
    [String] $Organization
    [String] $ID

    #CONSTRUCTOR PASS IN VARIABLES AND STORES IN PROPER PROPERTIES
    SearchData ([String]$InTitleTranslated, [String]$InOrganization, [String]$InID)
    {
        $this.Title = $InTitleTranslated
        $this.Organization = $InOrganization
        $this.ID =$InID
    }

}


# DO NOT EDIT: The main function to house our program code 
function main {
   
    # Initilaize variables
    $rows = 1000
    $start = 0
    $searchData = @()


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

            $searchGovCan = ("https://open.canada.ca/data/en/api/3/action/package_search?q={0}" -f $search)

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
    
    do
    {


        $searchGovCan = ("https://open.canada.ca/data/en/api/3/action/package_search?q={0}&rows={1}&start={2}" -f $search, $rows, $start)
        $allData = Invoke-RestMethod -Uri $searchGovCan

        # Go over each row onw at a time for each park
        foreach($data in $allData.result.results)
        {

            $searchData += [SearchData]::new($data.title_translated.en, $data.org_title_at_publication.en, $data.id)
    
            Write-Output ("-" * 40)
            Write-Output ("Title: {0} `nOrganization: {1} `nID: {2}" -f $data.title_translated.en, $data.organization.title, $data.id)

            $number = $number + 1
            Write-Output $number

        }

        if($allData.result.results.length -lt 1000)
        {
            break;       
        }

        # $rows = $rows + 1000
        $start = $start + 1000

    }
    while ($allData.result.results.length -ne 0)

    $preHTML = ("<h1> Generated HTML List Search of {0} </h1>" -f $search )

    $preHTML += "<img src='https://www.publicdomainpictures.net/pictures/50000/nahled/canadian-flag.jpg' alt='Grapefruit slice atop a pile of other slices'>"

    # Converts $allData to $dataHTML, adds Css formatting, filters out all but  information, adds Pre and Post message, result.results.organization.title
    $dataHTML = $searchData | ConvertTo-Html -CssUri ".\css_styles.css" -Property Title,Organization,ID -PRE $preHTML -POST "THANKS FOR SEARCHING"

    # Saves file as Park-HTMP.html with utf8 encoding
    $dataHTML | Out-File -FilePath OpenCanadaSearch.html -Encoding utf8

    # Progream finished message
    Write-Output "Program Done"
    
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main