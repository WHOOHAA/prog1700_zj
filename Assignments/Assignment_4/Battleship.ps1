#########################################################
#    Author: Zachary Johnson                            #
#    Date: Nov, 25, 2019                                #
#    Description: Battleship Assignment 4 - Project 3   #
#########################################################

# COMMENT ABOVE
function Catch-Error($InInputMapFile)
{
    # INITILIZE VARIABLE
    $letterRegEx = "^\D+$"

    # IF PASSED IN VARIABLE IS ININPUTFILE THEN CONTINUE
    
    if($InInputMapFile -match $letterRegEx)
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
    $misslesRemaining = [int](30)
    $error = $false
    $letterRegEx = "^[A-J]+$"
    $hits = 0
    $enemyCount = 0
    $mapView = @((" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "),
                 (" "," "," "," "," "," "," "," "," "," "))

    
    # SENDS INPUTFILE AS ININPUTFILE 
    # TO CATCH-ERROR FUNCTION
    $battleShipMap = Catch-Error -InInputMapFile $inputMapFile

    foreach($mapData in $battleShipMap)
    {
        $tempMapFormatted = $mapData -split ","
        $map += @(,($tempMapFormatted))
    }

    # COUNTS THE NUMER OF '1' AKA ENIMIES INEACH MAP
    # ALLOWS FOR CUSTOM 10X10 MAPS WITH MORE THEN 17 ENEMIES
    for($i = 0; $i -lt 10; $i++)
    {
        for ($j = 0; $j -lt 10; $j++)
        {
            if($map[$i][$j] -eq "1")
            {
                $enemyCount = $enemyCount + 1
            }
        }
    }

    # GAME ON
    Write-Output "Let's Play Battleship!"
    # TELLS YOU HOW MANY MISSLES YOU HAVE
    Write-Output "You have $misslesRemaining missiles to fire to sink All five ships.`n" 
    do
    {
        # FORLOOP THAT ALLOWS 30 CYCLES FOR THE 30 SHOTS
        for($i = 0; $i -lt 30; $i++)
        {   
            # SETS FOR NO ERROR AT START
            $error = $false

            # SHOWS THE MAP FOR HITS AND MISSES
            Write-Output "   A B C D E F G H I J"
            Write-Output ("1  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[0][0], $mapView[0][1], $mapView[0][2], $mapView[0][3], $mapView[0][4], $mapView[0][5], $mapView[0][6], $mapView[0][7], $mapView[0][8], $mapView[0][9])
            Write-Output ("2  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[1][0], $mapView[1][1], $mapView[1][2], $mapView[1][3], $mapView[1][4], $mapView[1][5], $mapView[1][6], $mapView[1][7], $mapView[1][8], $mapView[1][9])
            Write-Output ("3  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[2][0], $mapView[2][1], $mapView[2][2], $mapView[2][3], $mapView[2][4], $mapView[2][5], $mapView[2][6], $mapView[2][7], $mapView[2][8], $mapView[2][9])
            Write-Output ("4  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[3][0], $mapView[3][1], $mapView[3][2], $mapView[3][3], $mapView[3][4], $mapView[3][5], $mapView[3][6], $mapView[3][7], $mapView[3][8], $mapView[3][9])
            Write-Output ("5  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[4][0], $mapView[4][1], $mapView[4][2], $mapView[4][3], $mapView[4][4], $mapView[4][5], $mapView[4][6], $mapView[4][7], $mapView[4][8], $mapView[4][9])
            Write-Output ("6  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[5][0], $mapView[5][1], $mapView[5][2], $mapView[5][3], $mapView[5][4], $mapView[5][5], $mapView[5][6], $mapView[5][7], $mapView[5][8], $mapView[5][9])
            Write-Output ("7  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[6][0], $mapView[6][1], $mapView[6][2], $mapView[6][3], $mapView[6][4], $mapView[6][5], $mapView[6][6], $mapView[6][7], $mapView[6][8], $mapView[6][9])
            Write-Output ("8  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[7][0], $mapView[7][1], $mapView[7][2], $mapView[7][3], $mapView[7][4], $mapView[7][5], $mapView[7][6], $mapView[7][7], $mapView[7][8], $mapView[7][9])
            Write-Output ("9  {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}" -f $mapView[8][0], $mapView[8][1], $mapView[8][2], $mapView[8][3], $mapView[8][4], $mapView[8][5], $mapView[8][6], $mapView[8][7], $mapView[8][8], $mapView[8][9])
            Write-Output ("10 {0} {1} {2} {3} {4} {5} {6} {7} {8} {9}`n" -f $mapView[9][0], $mapView[9][1], $mapView[9][2], $mapView[9][3], $mapView[9][4], $mapView[9][5], $mapView[9][6], $mapView[9][7], $mapView[9][8], $mapView[9][9])

            #DO UNTILL NO ERROR
            do
            {
                #DO UNTILL NO ERROR
                do
                { 
                    #RESETS THE ATTACK MAP ARRAY
                    $attackMap = @()
                    
                    # CHECKS FOR ANY ERROR INCLUDING HITTING ENTER WITH NO INPUT
                    try
                    {   
                        # COLLECTS INPUT AND SETS LOWERCASE LETTERS AS UPPER IF NEEDED
                        $attack = Read-Host -Prompt "Choose your target (Ex. A1)"
                        $attack = $attack.ToUpper()
                        # RESETS ERROR TO FALSE FOR REPEATED RUNTHROUGH
                        $error = $false
                    }
                    Catch
                    {
                        #IF ERROR IS CAUGHT THEN SET ERROR TO TRUE
                        $error = $true
                    }
                }
                While($error -eq $true -and $hits -ne $enemyCount)
                
                # IF INPUT IS NT BETWEEN 2 AND 3 CHARACTERS IN LENGTH THEN SET ERROR TO TRUE
                if($attack.length -lt 2 -or $attack.length -gt 3)
                {
                    $error = $true
                }
                # IF ATTACK HAS MORE THEN ONE LETTER SET ERROR TO TRUE
                elseif($attack -match $letterRegEx)
                {
                    $error = $true
                }
                # IF INPPUT CONTAINS A
                elseif($attack.Contains("A"))
                {
                    # SET FIRST INDEX VALUE TO 0 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](0)
                    # REPLACES A WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "A","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS B
                elseif($attack.Contains("B"))
                {
                    # SET FIRST INDEX VALUE TO 1 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](1)
                    # REPLACES B WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "B","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS C
                elseif($attack.Contains("C"))
                {
                    # SET FIRST INDEX VALUE TO 2 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](2)
                    # REPLACES C WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "C","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS D
                elseif($attack.Contains("D"))
                {
                    # SET FIRST INDEX VALUE TO 3 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](3)
                    # REPLACES D WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "D","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS D
                elseif($attack.Contains("E"))
                {
                    # SET FIRST INDEX VALUE TO 4 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](4)
                    # REPLACES E WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "E","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS F
                elseif($attack.Contains("F"))
                {
                    # SET FIRST INDEX VALUE TO 5 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](5)
                    # REPLACES F WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "F","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS G
                elseif($attack.Contains("G"))
                {
                    # SET FIRST INDEX VALUE TO 6 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](6)
                    # REPLACES G WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "G","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS H
                elseif($attack.Contains("H"))
                {
                    # SET FIRST INDEX VALUE TO 7 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](7)
                    # REPLACES H WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "H","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS I
                elseif($attack.Contains("I"))
                {
                    # SET FIRST INDEX VALUE TO 8 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](8)
                    # REPLACES I WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "I","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                # IF INPPUT CONTAINS J
                elseif($attack.Contains("J"))
                {
                    # SET FIRST INDEX VALUE TO 9 WHICH IS THE EQUIVILANT PLACE ON THE MAP
                    $attackMap += [int](9)
                    # REPLACES J WITH A BLANK AND SETS THE VALUE REAMING AS AN IN AND SUBTRACTS 1 TO MATCH ITS EQUIVILANT PLACE ON THE MAP
                    $attack = [int]($attack -replace "J","") - 1
                    # SETS SECOND INDEX VALUE
                    $attackMap += $attack
                    # IF THE SECOND INDEX VALUE IS GREATER THEN 9 SET ERROR AS TRUE
                    if($attackMap[1] -gt 9)
                    {
                        $error = $true
                    }
                }
                else
                {
                    $error = $true
                }

                
            }
            While($error -eq $true -and $hits -ne $enemyCount)

            # IF HIT OUTPUT HIT!!!!!! AND X MARKS THE SPOT ON MAPVIEW
            if($map[$attackMap[1]][$attackMap[0]] -eq 1)
            {
                Write-Output "Hit!!!!!"
                $mapView[$attackMap[1]][$attackMap[0]] = "X"
                $hits = $hits + 1
            }
            # IF MISS OUTPUT MISS AND 0 MARKS THE PLOP ON MAPVIEW
            elseif($map[$attackMap[1]][$attackMap[0]] -eq 0)
            {
                Write-Output "Miss"
                $mapView[$attackMap[1]][$attackMap[0]] = "0"
            }

            # THIS IF STATMENT IS USED TO MATCH FORMATTING
            # IT DOES NOT SHOW THE REMAINING MISSISLES IF YOU SINK ALL THE SHIPS
            if($hits -ne $enemyCount)
            {
                # REDUCING MISSISLES BY 1
                $misslesRemaining = $misslesRemaining - 1
                # TELLS YOU HOW MANY MISSLES YOU HAVE REMAINING
                Write-Output "You have $misslesRemaining missiles remaining." 
            }
            
        }
        
    }
    While($misslesRemaining -ne 0 -and $hits -ne $enemyCount)
    
    # FINAL OUTPUT WIN
    if($hits -eq $enemyCount)
    {
        Write-Output "YOU SANK MY ENTIRE FLEET!"
        Write-Output ("You had {0} of {1} hits, which sank all the ships." -f $hits, $enemyCount)
        Write-Output "You won, Congratulations!"
    }
    #FINAL OUTPUT LOOSE
    elseif($hits -ne $enemyCount)
    {
        Write-Output "GAME OVER"
        Write-Output ("You had {0} of {1} hits, but didn'T sink all the ships." -f $hits, $enemyCount)
        Write-Output "Better luck next time"
    }



}

# DO NOT EDIT: Trigger our main function to launch the program
main