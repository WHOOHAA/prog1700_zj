###################################
#    Author: Zachary Johnson      #
#    Date: Dec, 03, 2019          #
#    Description: HRM Park HTML   #
###################################




# DO NOT EDIT: The main function to house our program code 
function main {
    
    # Allows secure cennection
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # accesss the API and retrieve all data
    $allData = Invoke-RestMethod -Uri "https://opendata.arcgis.com/datasets/3df29a3d088a42d890f11d027ea1c0be_0.geojson"

    # Converts $allData to $dataHTML, adds Css formatting, filters out all but OBJECT ID, PARK ID, PARK NAME information, adds Pre and Post message
    $dataHTML = $allData.features.properties | ConvertTo-Html `
    -CssUri ".\css_styles.css" `
    -Property OBJECTID, PARK_ID, PARK_NAME `
    -PRE "<h1> Generated HTML List HRM of Parks </h1>" `
    -POST "THE MATRIX OF HRM PARKS ARE REAL"
    
    # Saves file as Park-HTMP.html with utf8 encoding
    $dataHTML | Out-File -FilePath Park-HTML.html -Encoding utf8

    # Progream finished message
    Write-Output "Program Done"
}

# DO NOT EDIT: Trigger our main function to launch the program
main