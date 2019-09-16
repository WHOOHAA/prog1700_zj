#Author: Zachary Johnson
#Date: Sep. 16, 2019
#Description: Calculate earnings of stock per share

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input amd variables
    $companyName = Read-Host -Prompt "Enter your company name"
    $boughtShare = [float](Read-Host -Prompt "Enter the bought share price")
    $soldShare = [float](Read-Host -Prompt "Enter your share sold price")
    
    # 2. Processing
    $earningsShare = ($soldShare / $boughtShare) -1
    $earningsShare = $earningsShare * 100

    # 3. Output
    Write-Output "$companyName 's persentage of earning per share for the year is $earningsShare %"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main