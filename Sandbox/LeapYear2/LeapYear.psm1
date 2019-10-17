################################################
#    Author: Zachary Johnson                   #
#    Date: Oct. 15, 2019                       #
#    Description: Leap Year Checker Function   #
################################################

function Check-LeapYear($InCurrentYear)
{
   
   $isLeapYear = $false

    if($InCurrentYear % 4 -eq 0 -and $InCurrentYear % 100 -ne 0)
   {
        $isLeapYear = $true
   }
   elseif($InCurrentYear % 400 -eq 0)
   {
        $isLeapYear = $true
   }
    
   return $isLeapYear
    
}

Export-ModuleMember -function Check-LeapYear
