###################################
#    Author: Zachary Johnson      #
#    Date: Nov, 28, 2019          #
#    Description: HRM Park Info   #
###################################




# DO NOT EDIT: The main function to house our program code 
function main {
    #OBJECT ID, PARK ID, PARK NAME
    # Allows secure cennection
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    # accesss the API and retrieve all data
    $allData = Invoke-RestMethod -Uri "https://opendata.arcgis.com/datasets/3df29a3d088a42d890f11d027ea1c0be_0.geojson"


    # Go over each row onw at a time for each park
    foreach($data in $allData.features.properties)
    {
        Write-Output ("-" * 40)
        Write-Output ("Object ID: {0} `tPark ID: {1} `tPark Name: {2}" -f $data.OBJECTID, $data.PARK_ID, $data.PARK_NAME)
    }
    
    # Progream finished message
    Write-Output "Program Done"
}

# DO NOT EDIT: Trigger our main function to launch the program
main