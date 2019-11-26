#########################################################
#    Author: Zachary Johnson                            #
#    Date: Nov, 25, 2019                                #
#    Description: Battleship Assignment 4 - Project 3   #
#########################################################

# COMMENT ABOVE
function Catch-Error($InInputMapFile)
{
    # INITILIZE VARIABLE
    $numberRegEx = "^\D+$"

    # IF PASSED IN VARIABLE IS ININPUTFILE THEN CONTINUE
    
    if($InInputMapFile -match $numberRegEx)
    {
        # IF ERROR CATCH THEN OUTPUT TEXT ONLY AND EXIT PROGRAM
        try
        {
            $OutBattleShipMap = Get-Content $InInputMapFile #-split ","
        }
        catch [System.IO.DirectoryNotFoundException]
        {
            Write-Output "That directory does not exist"
            EXIT
        }
        catch
        {
            Write-Output "Unspecified Error"
            # EXIT
        }    
        # IF RUNS THROUGH THEN RETURN THE TXT FILE DATA TO THE MAIN FUNCTION
        RETURN $OutBattleShipMap
    }
   
}

# DO NOT EDIT: The main function to house our program code 
function main {

    # INITILIZING VARIABLES
    $inputMapFile = "map.txt"
    [int]($misslesRemaining) = 30
    $error = $false

    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $battleShipMap = Catch-Error -InInputMapFile $inputMapFile

    foreach($mapData in $battleShipMap)
    {
        $tempMapFormatted = $mapData -split ","
        $map += @(,($tempMapFormatted))
    }

    Write-Output "Let's Play Battleship!"
    do
    {
        for($i = 0; $i -lt 30; $i++)
        {
            Write-Output "You have $misslesRemaining missles to fire to sink All five ships.`n"      
            Write-Output "   A B C D E F G H I J`n"
            Write-Output ("1  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[0][0], $map[0][1], $map[0][2], $map[0][3], $map[0][4], $map[0][5], $map[0][6], $map[0][7], $map[0][8], $map[0][9])
            Write-Output ("2  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[1][0], $map[1][1], $map[1][2], $map[1][3], $map[1][4], $map[1][5], $map[1][6], $map[1][7], $map[1][8], $map[1][9])
            Write-Output ("3  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[2][0], $map[2][1], $map[2][2], $map[2][3], $map[2][4], $map[2][5], $map[2][6], $map[2][7], $map[2][8], $map[2][9])
            Write-Output ("4  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[3][0], $map[3][1], $map[3][2], $map[3][3], $map[3][4], $map[3][5], $map[3][6], $map[3][7], $map[3][8], $map[3][9])
            Write-Output ("5  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[4][0], $map[4][1], $map[4][2], $map[4][3], $map[4][4], $map[4][5], $map[4][6], $map[4][7], $map[4][8], $map[4][9])
            Write-Output ("6  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[5][0], $map[5][1], $map[5][2], $map[5][3], $map[5][4], $map[5][5], $map[5][6], $map[5][7], $map[5][8], $map[5][9])
            Write-Output ("7  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[6][0], $map[6][1], $map[6][2], $map[6][3], $map[6][4], $map[6][5], $map[6][6], $map[6][7], $map[6][8], $map[6][9])
            Write-Output ("8  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[7][0], $map[7][1], $map[7][2], $map[7][3], $map[7][4], $map[7][5], $map[7][6], $map[7][7], $map[7][8], $map[7][9])
            Write-Output ("9  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[8][0], $map[8][1], $map[8][2], $map[8][3], $map[8][4], $map[8][5], $map[8][6], $map[8][7], $map[8][8], $map[8][9])
            Write-Output ("10 {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $map[9][0], $map[9][1], $map[9][2], $map[9][3], $map[9][4], $map[9][5], $map[9][6], $map[9][7], $map[9][8], $map[9][9])
            
        #     do
        #     { 
        #         $decision = Read-Host -Prompt "Enter Choice (a-e)"
        #         if($decision -eq "a")
        #         {
        #             $chosen += $data.ChoiceOne
        #             $error = $false
        #         }
        #         elseif($decision -eq "b")
        #         {
        #             $chosen += $data.ChoiceTwo
        #             $error = $false
        #         }
        #         elseif($decision -eq "c")
        #         {
        #             $chosen += $data.ChoiceThree
        #             $error = $false
        #         }
        #         elseif($decision -eq "d")
        #         {
        #             $chosen += $data.ChoiceFour
        #             $error = $false
        #         }
        #         elseif($decision -eq "e")
        #         {
        #             $chosen += $data.ChoiceFive
        #             $error = $false
        #         }
        #         else 
        #         {
        #             $error = $true     
        #         }
        #     }
        #     while($error -eq $true)
        $misslesRemaining = $misslesRemaining - 1
    }
        
    }
    While($misslesRemaining -eq 0)
    
    
    # for($i = 0; $i -lt $chosen.length; $i++)
    # {
    #     $replace = "_"+($i + 1)+"_"
        
    #     $storyText = $storyText -replace $replace, $chosen[$i].ToUpper()
    # }

    Write-Output "`nYour Completed Story:`n"
    # $storyText


}

# DO NOT EDIT: Trigger our main function to launch the program
main