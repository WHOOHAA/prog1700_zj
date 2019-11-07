##############################################
#    Author: Zachary Johnson                 #
#    Date: Oct. 19, 2019                     #
#    Description: Cryptic Output form file   #
##############################################




# DO NOT EDIT: The main function to house our program code 
function main {
	$randomeNumber = Get-Random -Minimum 1 -Maximum 26

	# ARRAY TO HOLD ALL LETTERS IN THE ALPHABET IN LOWER CASE
	$letterArray = 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
			't','u','v','w','x','y','z'
	# ARRAY TO HOLD ALL PUNTUATION DELT WITH
	$punctuationArray = ' ', '.',','
	# FILE READ
	$fileRead = "test_file.txt"
	# FILE WRITE OUTPUT TO
	$fileWrite = "processed.txt"
	
	# ENCRYPTED MESSAGE WE WILL DISPLAY
	$outputMessage = ""

	#GETS THE CONTENT OF INPUT FILE AND STORES IT IN INPUTMESSAGE
	$inputMessage = Get-Content -Path $fileRead

	# GOING OVER EACH INPUTMESSAGE ONE LETTER ONE AT A TIME FROM LETTERARAY
	for($i = 0; $i -lt $inputMessage.Length; $i++)
	{	
		# IF INPUTMESSAGE CHARACTER IS A PUNCUATION CHARACTER
		if($punctuationArray.Contains([string]$inputMessage[$i]))
		{	
			# ADD CHARACTER TO OUTPUT MESSAGE WITHOUT CHANGING IT
			$outputMessage += $inputMessage[$i]
		}
		else 
		{
			# FINDS CURRENT INDEX OF LOWERCASE LETTER IN THE ALPHABET ARRAY
			$arrayIndex = $letterArray.IndexOf(([string]$inputMessage[$i]).ToLower())
			
			# ADDS CURRENT ARRAYINDEX AND RENDOM NUMBER TO GET NEW LETTER FROM ARRAY
			# GET MUODULUS 26 SO IT CAN WRAP AROUND IF TOGETHER THEY GO PAST Z
			$newIndex = ($arrayIndex + $randomeNumber) % 26
			
			# CASE SENSITIVE COMPARISON WITH REGEX TO SEE IF UPPERCASE LETTER
			if($inputMessage[$i] -cmatch '[A-Z]')
			{
				# ADD TO OUTPUT STING AS UPPERCASE
				# BASED AT LETTER AT NEW INDEXED POSITION
				$outputMessage += $letterArray[$newIndex].ToUpper()
			}
			else
			{
				# ADD LETTER AT NEW INDEX POSITION ASIS IN LOWERCASE
				$outputMessage += $letterArray[$newIndex]
			}
		}	
	}

	# WRITE OUTPUT MESSAGE TO TEMINAL - LATER OUTPUT FILE
    Write-Output $outputMessage
    $outputMessage | Out-File ./$fileWrite
}
# DO NOT EDIT: Trigger our main function to launch the program
main