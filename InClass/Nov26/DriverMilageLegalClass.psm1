# CLASS NAME
class Car
{
    #INITIALIZATION
    [String] $driver
    [int32] $milage
    [bool] $streetLegal

    #CONSTRUCTOR PASS IN VARIABLES AND STORES IN ROPER PROPERTIES
    Car ([String]$InDriver, [int32]$InMileage, [bool]$InStreetLegal)
    {
        $this.driver = $InDriver
        $this.milage = $InMileage
        $this.streetLegal = $InStreetLegal
    }

    # FUNTION STEET LEGAL AND MILAGE 
    [String] driverMilageLegal([int32]$distance)
    {

        [String]$return = ""

        # CHECKING IF STREET LEGAL
        if($this.streetLegal)
        {       
            # ADDS TO MILAGE
            $this.milage += $distance

            $return = ("{0} drove {1} miles and the current mileage is {2}." -f $this.driver,$distance,$this.milage)
        }
        # NOT STREET LEGAL
        else 
        {
            $return = ("{0} could not drive because his/her car is not street legal." -f $this.driver)
        }
        #RETURNS IF STREAT LEGAL OR NOT WITH THE PROPERTY INFORMATION
        return $return
    }
}

