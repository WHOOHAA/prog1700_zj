###################################
#    Author: Zachary Johnson      #
#    Date: Dec, 4, 2019           #
#    Description: Final Project   #
###################################

function Retreive-FilteredData
{
    $rows = 1000
    $start = 0
    $OutSearchData = @()

    do
    {   
        # accesss the API and retrieve all data
        try
        {
            
            # Allows secure cennection
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

            # Read To Search
            $search = Read-Host -Prompt "`nPlease enter what you would like to search"

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

            $OutSearchData += [SearchData]::new($data.title_translated.en, $data.org_title_at_publication.en, $data.id)
        }

        # 
        if($allData.result.results.length -lt 1000)
        {
            break;       
        }

        # adds the 
        $start = $start + 1000

    }
    while ($allData.result.results.length -ne 0)

    Return $OutSearchData
}


function Display-DataStatistics($InData)
{
    $OutData = $InData.length

    return $OutData
}

function Create-DataReport ($InSearchData)
{
    
    $preHTML = "<h1> Generated HTML Search List"  #( : {0} </h1>" -f $search.ToUpper() )

    $preHTML += "<img src='https://dynamicmedia.zuza.com/zz/m/original_/5/d/5d475c5f-6dad-40e5-b6af-23b3343a1998/Canada_Flag_1_Super_Portrait.jpg' alt='Picture of Canada's Flag' width='200' height='100'>"

    try
    {
        # Converts $allData to $dataHTML, adds Css formatting, filters out all but  information, adds Pre and Post message, result.results.organization.title
        $dataHTML = $searchData | ConvertTo-Html -CssUri ".\css_styles.css" -Property Title,Organization,ID -PRE $preHTML -POST "THANKS FOR SEARCHING"

        # Saves file as Park-HTMP.html with utf8 encoding
        $dataHTML | Out-File -FilePath OpenCanadaSearch.html -Encoding utf8
    }
    catch
    {
        Return "ERROR: HTML Report NOT Complete Try Again."
        break
    }
    Return "HTML Report 'OpenCanadaSearch.html' Complete."
}


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
    $searchData = @()

    Write-Output ("#" * 41)
    Write-Output "#                                       #"
    Write-Output "#  Welcome to the Government of Canada  #"
    Write-Output "#   Open API Search Powershell Client   #"
    Write-Output "#          By: Zachary Johnson          #"
    Write-Output "#                                       #"
    Write-Output ("#" * 41)

    $searchData = Retreive-FilteredData

    $dataStatistics = Display-DataStatistics -InData $searchData

    $outcomeHTML = Create-DataReport -InSearchData $searchData

    # Total number of search results outout
    Write-Output ("-" * 50)
    Write-Output "Your total number of search results found is: $dataStatistics."

    #
    Write-Output ("-" * 50)
    Write-Output $outcomeHTML

    # Progream finished message
    Write-Output ("-" * 50)
    Write-Output "Program Done"
    
}

# DO NOT EDIT: Trigger our main function to launch the program
main