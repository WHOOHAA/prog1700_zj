#Author: Zachary Johnson
#Date: Sep. 16, 2019
#Description: Calculate the persentage of wins with input for team name, wins and losses

# DO NOT EDIT: The main function to house our program code 
function main {

    # 1. Input amd variables
    $teamName = Read-Host -Prompt "Enter your team name"
    $gamesWon = [int](Read-Host -Prompt "Enter the number of games won")
    $gamesLost = [int](Read-Host -Prompt "Enter number of games lost")

    # 2. Processing
    $gamePercent = $gamesWon / ($gamesWon + $gamesLost)
    $gamePercent = $gamePercent * 100

    # 3. Output
    Write-Output "The percentage of games won is $gamePercent %"
	
}

# DO NOT EDIT: Trigger our main function to launch the program
main