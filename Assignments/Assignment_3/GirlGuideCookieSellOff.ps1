#########################################################################
#    Author: Zachary Johnson                                            #
#    Date: Nov. 03, 2019                                                #
#    Description: Girl Guide Cookie Sell-off Assignment 3 - Project 3   #
#########################################################################

# TAKES $IINCHECKLETTER from $girlGuide AND CHECKS FOR LETTERD. 
# TAKES $INCHECKNUMBER $numberGirlGuides, $numberBoxesSold AND CHECKS FOR DIGITS. 
# IF NON LETTERS AND/OR NON DIGITS IT WILL RETURN $OUTERROR AS $true
# IF CONTAINS ONLY LETTERS AND/OR DIGITS IT WILL RETURN $OUTERROR AS $false
function Check-InputError ($INCHECKLETTER, $INCHECKNUMBER)
{
    $numberRegEx = "^\d+$"
    $letterRegEx = "^\D+$"
    $OUTERROR = $true
    
    if($INCHECKLETTER -Match $letterRegEx)
    {
        $OUTERROR = $false
    }
    elseif($INCHECKNUMBER -Match $numberRegEx)
    {
        $OUTERROR = $false
    }
    
    return $OUTERROR
}


# DO NOT EDIT: The main function to house our program code 
function main {

    # SET VARIABLES AND ARRAYS
    $totalBoxesSold = 0
    $girlGuidesArray = @()
    $boxesSoldArray = @()
    $wonPrizesArray = @()

    # PROMPTS FOR NUMBER OF GUIDES UNTILL REQUIRMENT IS MET -EQ "^\d+$"
    do
    {
    $numberGirlGuides = Read-Host -Prompt "Enter the number of guides selling cookies"
    $error = Check-InputError -INCHECKNUMBER $numberGirlGuides
    }
    while($error -ne $false)
   
    # SETS NUMBER OF GUIDES AS A INT
    $numberGirlGuides = [int]($numberGirlGuides)
    Write-Output ""

    # RUNS FOR THE NUMBER OF GUIDES
    for($i = 1; $i -le $numberGirlGuides; $i++)
    {   
        # PROMPTS FOR THE NAME OF EACH GUIDE UNTILL REQUIRMENT IS MET -EQ "^\D+$"
        do
        {
            $girlGuide = Read-Host -Prompt ("Enter the name of guide #{0}" -f $i)
            $error = Check-InputError -INCHECKLETTER $girlGuide
        }
        while($error -ne $false)

        # PROMPTS FOR NUMBER OF BOXES SOLD UNTILL REQUIRMENT IS MET -EQ "^\d+$"
        do
        {
            $numberBoxesSold = Read-Host -Prompt ("Enter the number of boxes sold by {0}" -f $girlGuide)
            $error = Check-InputError -INCHECKNUMBER $numberBoxesSold
        }
        while($error -ne $false)

        # SETS NUMBER OF BOXES AS AN INT
        $numberBoxesSold = [int]($numberBoxesSold)
        Write-Output ""

        # ADDS GIRL GUIDE NAME TO ARRAY
        $girlGuidesArray += $girlGuide
        # ADDS NUMBER OF BOXES SOLD TO ARRAY WITH SAME INDEX AS GIRL GUIDE NAME
        $boxesSoldArray += $numberBoxesSold
    }

    # CALCULATING THE TOTAL BOXES SOLD BY ADDING ALL OF THE BOXES SOLD TOGETHER
    for($i = 0; $i -lt $numberGirlGuides; $i++)
    {
        [int]($totalBoxesSold) = $totalBoxesSold + $boxesSoldArray[$i]
    }
    
    # CALCULATING THE AVERAGE BOXES SOLD BY DIVIDING THE TOTAL OXES SOLD BY THE NUMBER OF GUIDES
    $AverageBoxesSold = $totalBoxesSold / $numberGirlGuides
    
    # OUTPUTTING THE AVERAGE NUMBER OF BOXES SOLD AND STARTING THE TABLE/LIST OUTPUT
    Write-Output ("The average number of boxes sold by each guide was {0:N1}`n" -f $AverageBoxesSold)
    Write-Output "Guide             Prizes Won:"
    Write-Output ("-" * 80)
    
    # SORTING THE BOXES SOLD ARRAY IN DECENDING ORDER AND SAVING IT IN A SORTED BOX ARRAY
    $sortedBoxesSoldArray = $boxesSoldArray | Sort-Object -Descending

    # CHECKING EACH GUIDE FOR THEIR PRIZE AND CREATING AN ARRAY OF PRIZES WON WITH THE MATCHING INDEX AS THE GUIDE THAT WON
    for($i = 0; $i -lt $numberGirlGuides; $i++)
    {
            if($sortedBoxesSoldArray[0] -Contains $boxesSoldArray[$i])
            {
                $wonPrizesArray += $boxesSoldArray[$i] -Replace($boxesSoldArray[$i], "Trip to Girl Guide Jamboree in Aruba!")
            }
            elseif($boxesSoldArray[$i] -gt $AverageBoxesSold)
            {
                $wonPrizesArray += $boxesSoldArray[$i] -Replace($boxesSoldArray[$i], "Super Seller Badge")
            }
            elseif($boxesSoldArray[$i] -gt 0)
            {
                $wonPrizesArray += $boxesSoldArray[$i] -Replace($boxesSoldArray[$i], "Left over cookies")
            }

            elseif($boxesSoldArray[$i] -eq 0)
            {
                $wonPrizesArray += $boxesSoldArray[$i] -Replace($boxesSoldArray[$i], " ")
            }
    }
    
    # FORMATTING PADDING RIGHT FOR TABLE/LIST
    for($i = 0; $i -lt $numberGirlGuides; $i++)
    {
        $girlGuidesArray[$i] = $girlGuidesArray[$i].padright(18, ' ')
    }

    # OUTPUTTING THE GUIDES AND THEIR PRIZES
    for($i = 0; $i -lt $numberGirlGuides; $i++)
    {
        Write-Output ("{0}- {1}"-f $girlGuidesArray[$i], $wonPrizesArray[$i])
    }
}

# DO NOT EDIT: Trigger our main function to launch the program
main