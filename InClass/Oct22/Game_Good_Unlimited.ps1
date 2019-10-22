#######################################
#    Author: Zachary Johnson          #
#    Date: Oct. 22, 2019              #
#    Description:Game Good Unlimited  #
#######################################


# DO NOT EDIT: The main function to house our program code 
function main{

	Write-Output "Welcome to my game!"

	$randomNumber = Get-Random -Minimum 1 -Maximum 101 # Sets random number between 1 and 100

	do # Runs untill you guess the rendom number
	{
		$guess = [int](Read-Host -Prompt "Enter a number") # Enter your guess
		
		if ($guess -lt $randomNumber) # Guess is less then random number
		{
			Write-Output "Higher"
		} 
		elseif ($guess -gt $randomNumber) # Guess is larger then random number
		{
			Write-Output "Lower"
		} 
		elseif ($guess -eq $randomNumber) # Guess equeles the random number
		{
			Write-Output "You got it!"
		}
    }
    while ($guess -ne $randomNumber) # Reruns the do loop untill the guess equals the random number
    Write-Output "Game Over"
}



# DO NOT EDIT: Trigger our main function to launch the program
main