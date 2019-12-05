# DO NOT EDIT: The main function to house our program code 
function main {

    # array to hold all jokes
    $retrievedJokes = @()
    $pagesRetreived = 1

    # get JSON Data from a public API that limits us to one page of 20 results at a time
    do {

        $pagedDataSet = Invoke-RestMethod -URI ("https://icanhazdadjoke.com/search?page={0}" -f $pagesRetreived) `
                                          -Headers @{"accept"="application/json"}

        if($pagedDataSet.results.length -ne 0)
        {
            $retrievedJokes += $pagedDataSet.results
            $pagesRetreived++
        }
        
    } while ($pagedDataSet.results.length -eq 20) # twenty is default limit, so if 20 there might be more pages

    # go over each object in the stored array
    foreach($dadJoke in $retrievedJokes)
    {
        # this works because each row from the collection of returned data becomes an object
        $dadJoke | Get-Member 

        # now we can try to output the result in nicer fashion
        # Write-Output $dadJoke.joke
        # Write-Output ""
    }

    
    Write-Output ("Done: {0} records retrieved" -f $retrievedJokes.length)
}

# DO NOT EDIT: Trigger our main function to launch the program
main
