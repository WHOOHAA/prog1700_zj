# DO NOT EDIT: The main function to house our program code 
function main {

    # get JSON Data from a public API and convert it to PowerShell Objects - may need to specify JSON with some API's
    $dataSet = Invoke-RestMethod -URI 'https://icanhazdadjoke.com/search' -Headers @{"accept"="application/json"}

    # go over each object in the collection - need to figure out the name of the collection
    foreach($dadJoke in $dataSet.results)
    {
        # this works because each row from the collection of returned data becomes an object
        $dadJoke | Get-Member 

        # now we can try to output the result in nicer fashion
        # Write-Output $dadJoke.joke
        # Write-Output ""
    }

    
    Write-Output "Done"
}

# DO NOT EDIT: Trigger our main function to launch the program
main
