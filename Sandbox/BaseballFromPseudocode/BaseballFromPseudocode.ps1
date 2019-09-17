#Author: Zachary Johnson
#Date: Sep. 17, 2019
#Description: Bassball program from psuedocode

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input amd variables
    $teamName = Read-Host -Prompt "Enter your team name"
    $gamesWon = [int](Read-Host -Prompt "Enter the numbers of games won")
    $totalGames = [int](Read-Host -Prompt "Enter the number of games played")
    
    # 2. Processing
    $winningPercentage = ($gamesWon / $totalGames) * 100
    
    # 3. Output
    Write-Output "$winningPercentage %"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main