[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")
[reflection.assembly]::LoadWithPartialName( "System.Drawing")

class Stroke {
    [int]$StartX
    [int]$StartY
    [int]$Angle
    [int]$Distance
    [string]$Color

    [int]$EndX
    [int]$EndY
    
    # Constructor
    Stroke(
        [int]$x,
        [string]$y,
        [string]$a,
        [string]$d,
        [string]$c
    ){
        $this.StartX = $x
        $this.StartY = $y
        $this.Angle = $a
        $this.Distance = $d
        $this.Color = $c

        # OKAY NEED TO DETERMINE END POSITION FROM ANGLE 
        # Formulas Needed x= distance * cosθ, y=distance * sinθ,  convert degrees to radians degrees / 180 * [math]::pi()
        $radians = $this.Angle / 180 * [math]::pi
        $this.EndX = [int]($this.Distance * [math]::cos($radians)) + $this.StartX
        $this.EndY = [int]($this.Distance * [math]::sin($radians)) + $this.StartY
    }

} # end of Stroke class

class Turtle {
    # static variables
    # static [int]$STARTING_X = 50
    # static [int]$STARTING_Y = 50
    static $MyForm
    static $MyGraphics
    static $MyPen
    static [Stroke[]]$LinesToDraw = @()

    # instance variables
    [string]$MyColor
    [int]$CursorXPos
    [int]$CursorYPos
    [int]$CursorDirection
    
    # Constructor
    Turtle([int]$width, [int]$height, [int]$startX, [int]$startY)
    {
        [Turtle]::MyForm = New-Object Windows.Forms.Form
        [Turtle]::MyGraphics = [Turtle]::MyForm.createGraphics()
        [Turtle]::MyPen = New-Object Drawing.Pen black
        $this.MyColor = "black"

        # Set the form size
        [Turtle]::MyForm.Width = $width
        [Turtle]::MyForm.Height = $height

        # Start cursor at beginning co-ordinates
        $this.CursorXPos = $startX
        $this.CursorYPos = $startY

        # Start cursor going right (0 degrees)
        $this.CursorDirection = 0
    }

    # Move the turtle forward - actually just queue up the Stroke
    [void]Forward([int]$distance){

        $stroke = [Stroke]::new($this.CursorXPos, $this.CursorYPos, $this.CursorDirection, $distance, $this.MyColor)

        [Turtle]::LinesToDraw +=  $stroke

        # Now move the cursor to the end position of that Stroke
        $this.CursorXPos = $stroke.EndX
        $this.CursorYPos = $stroke.EndY

    }

    # Move the turtle backward - actually just queue up the Stroke
    [void]Backward([int]$distance){

        $stroke = [Stroke]::new($this.CursorXPos, $this.CursorYPos, $this.CursorDirection, -1 * $distance, $this.MyColor)

        [Turtle]::LinesToDraw +=  $stroke

        # Now move the cursor to the end position of that Stroke
        $this.CursorXPos = $stroke.EndX
        $this.CursorYPos = $stroke.EndY

    }

    # Turn right
    [void]Right([int]$degrees){

        # can't go above 360 degrees
        $this.CursorDirection = ($this.CursorDirection + $degrees) % 360

    }

    # Turn left
    [void]Left([int]$degrees){

        # can't go below 0 degrees
        if($degrees -gt $this.CursorDirection)
        {
            $this.CursorDirection = (360 - ($degrees - $this.CursorDirection))
        }
        else 
        {
            $this.CursorDirection -= $degrees
        }

    }

    # Set the current Stroke color
    [void]Color([string]$col){
        $this.MyColor = $col
    }

    # Draw the form with the current graphics state
    [void]Stroke(){

        [Turtle]::MyForm.add_paint(
            {
                # draw each line in the queue
                foreach ($stroke in [Turtle]::LinesToDraw) {
                    # Write-Warning ("Turning off rack: " + ($rack.AssetId))
                    [Turtle]::MyPen.color = $stroke.Color
                    [Turtle]::MyGraphics.DrawLine([Turtle]::MyPen, $stroke.StartX, $stroke.StartY, $stroke.EndX, $stroke.EndY)
                }
            }
        )

        # display to finished form
        [Turtle]::MyForm.ShowDialog() 
    }
} # end of Turtle class