###################################
#    Author: Zachary Johnson      #
#    Date: Dec, 4, 2019           #
#    Description: Final Project   #
###################################

# Function is called without being sent data
# Calls the API, retrieves data, handles errors and pages
# Returns all of the searched data as $OutSearchData
function Retreive-FilteredData
{
    # initilizes $rows to maxamum  able to be output per page
    $rows = 1000
    # initilizes $start to 0 will be upped by 1000 later 
    $start = 0
    # initilizes $OutSearchData as an array
    $OutSearchData = @()

    # Runs till $searchSuccess equals true AKA untill it runs successfully
    do
    {   
        # Try to accesss the API and retrieves all data within the search and catches errors
        try
        {
            
            # Allows a secure cennection
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

            # Reads host input to $search
            $search = Read-Host -Prompt "`nPlease enter what you would like to search"

            # Prevents the delay of a search if contains only a blank (enter) or a space
            if($search -eq $null -or $search -eq " ")
            {
                # Throws error
                throw "Blank is not accepted as an input."
            }

            # Adds $search to the API format as $searchGovCan
            $searchGovCan = ("https://open.canada.ca/data/en/api/3/action/package_search?q={0}" -f $search)

            # Gathers all uri $searchGovCan data and saves it as $allData as a try catch to see if error
            $allData = Invoke-RestMethod -Uri $searchGovCan

            # If search is uncucessfull $searchSuccess to false amd output try again message
            If($allData.result.results -eq $null)
            {
                $searchSuccess = $false
                Write-Output "Try Again"
            }
            # If successful then set $searchSuccess to true
            elseIf($allData.success -eq $true)
            {
                $searchSuccess = $true
            }
        }
        # If error caught then set $searchSuccess to false and output try again error
        catch
        {
            $searchSuccess = $false
            Write-Output "Try Again"

        }
    }
    While ($searchSuccess -eq $false)

    # Runs till $allData.result.results.length is 0
    do
    {
        # Gathers and saves gatthering data from api with paging to $allData
        $searchGovCan = ("https://open.canada.ca/data/en/api/3/action/package_search?q={0}&rows={1}&start={2}" -f $search, $rows, $start)
        $allData = Invoke-RestMethod -Uri $searchGovCan

        # Goes over each row one at a time for each page of search data
        foreach($data in $allData.result.results)
        {
            # Sends $data.title_translated.en, $data.org_title_at_publication.en, $data.id to custom class creation
            $OutSearchData += [SearchData]::new($data.title_translated.en, $data.org_title_at_publication.en, $data.id)
        }

        # If length of $allData.result.results.length in this run is less then 1000 then breaks the do loop 
        # This is becasue it has finished with gathering all information
        if($allData.result.results.length -lt 1000)
        {
            break;       
        }

        # adds 1000 to $start to page to the next 1000 resualts from the API 
        $start = $start + 1000

    }
    while ($allData.result.results.length -ne 0)

    # Retuens $OutSearchData the search information that has been created with the new array and paging
    Return $OutSearchData
}

# Function is sent $searchData and generates and returns the length of the number of objects are returned from the search
function Display-DataStatistics($InData)
{
    # Checks the length of $InData
    $OutData = $InData.length

    # Returns the number of the $OutData length
    return $OutData
}

# Function is sent $searchData to creat teh HTML file with formatting 
function Create-DataReport ($InSearchData)
{
    # Part one of pre message
    $preHTML = "<h1 align='left' > Generated HTML Search List From https://open.canada.ca "  #( : {0} </h1>" -f $search.ToUpper() )

    # Part 2 of pre message is a photo from google search of Canada Flag
    $preHTML += "<img src='https://dynamicmedia.zuza.com/zz/m/original_/5/d/5d475c5f-6dad-40e5-b6af-23b3343a1998/Canada_Flag_1_Super_Portrait.jpg' alt='Picture of Canada's Flag' width='100' height='50'>"

    # Try to conver to html and build file OpenCanadaSearch.html Catches if any error
    try
    {
        # Converts $searchData to $dataHTML, adds Css formatting, filters out all but  Title, Organization, ID and adds Pre and Post message, result.results.organization.title
        $dataHTML = $InSearchData | ConvertTo-Html -CssUri ".\css_styles.css" -Property Title,Organization,ID -PRE $preHTML -POST "THANKS FOR SEARCHING"

        # Saves file as Park-HTMP.html with utf8 encoding
        $dataHTML | Out-File -FilePath OpenCanadaSearch.html -Encoding utf8
    }
    # Cathes error and outputs error message and breaks from the function
    catch
    {
        Return "ERROR: HTML Report NOT Complete Try Again."
        break
    }

    # Returns a succsssful message if no error caught and no break
    Return "HTML Report 'OpenCanadaSearch.html' Complete."
}


# CLASS NAME Gets sent information to create its own class for proper output to HTML table in the future
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
   
    # Initilaize Array
    $searchData = @()

    # Program Intro Header
    Write-Output ("#" * 41)
    Write-Output "#                                       #"
    Write-Output "#  Welcome to the Government of Canada  #"
    Write-Output "#   Open API Search Powershell Client   #"
    Write-Output "#          By: Zachary Johnson          #"
    Write-Output "#                                       #"
    Write-Output ("#" * 41)

    # Runs function Retreive-FilteredData to get search input and invokes the api
    # Returns a new class with the search information needed for output wiht proper object names
    $searchData = Retreive-FilteredData

    # Goes through the $searchData and returns the total number of objects for statistics
    # Returns 
    $dataStatistics = Display-DataStatistics -InData $searchData

    # Sends the $searchData to Create-DataReport, Creats the HTML document, formats it with css and calculates if it passes or fails
    $outcomeHTML = Create-DataReport -InSearchData $searchData

    # Putputs the total number of search results
    Write-Output ("-" * 50)
    Write-Output "Your total number of search results found is: $dataStatistics."

    # Outputs the outcome of the HTML file creation
    Write-Output ("-" * 50)
    Write-Output $outcomeHTML

    # Outputs progream finished message
    Write-Output ("-" * 50)
    Write-Output "Program Done"
    
}

# DO NOT EDIT: Trigger our main function to launch the program
main