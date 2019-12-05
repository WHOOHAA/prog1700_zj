# DO NOT EDIT: The main function to house our program code 
function main {

    # get JSON Data from a public API and convert it to PowerShell Objects
    $dataSet = Invoke-RestMethod -URI 'https://cat-fact.herokuapp.com/facts'

    # go over each object in the collection - need to figure out the name of the collection
    foreach($catFact in $dataSet.all)
    {
        # this works because each row from the collection of returned data becomes an object
        $catFact | Get-Member 

        # now we can try to output the result in nicer fashion
        # Write-Output $catFact.text
        # Write-Output ""
    }

    
    Write-Output "Done"
}

# DO NOT EDIT: Trigger our main function to launch the program
main
