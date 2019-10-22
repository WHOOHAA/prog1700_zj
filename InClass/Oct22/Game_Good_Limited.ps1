#######################################
#    Author: Zachary Johnson          #
#    Date: Oct. 22, 2019              #
#    Description:Game Good Limited    #
#######################################


# DO NOT EDIT: The main function to house our program code 
function main{

	Write-Output "Welcome to my game!"

	$numberGuesses = 10 # Amount of times you can guess
	$randomNumber = Get-Random -Minimum 1 -Maximum 101 # Sets random number between 1 and 100

	for($i = 0; $i -lt $numberGuesses; $i++) # Runs untill you gues the rendom number
	{
		$guess = [int](Read-Host -Prompt "Enter a number") #Enter your guess
		
		if ($guess -lt $randomNumber) # Guess is less then random number
		{
			Write-Output "Higher"
		} 
		elseif ($guess -gt $randomNumber) # Guess is larger then random number
		{
			Write-Output "Lower"
		} 
		elseif ($guess -eq $randomNumber) # Guess equeles random number
		{
			Write-Output "You got it!"
			break;
		}
	}
	Write-Output "Game Over"
}


# DO NOT EDIT: Trigger our main function to launch the program
main