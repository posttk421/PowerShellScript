$DebugPreference = "Continue"
set-strictmode -version "Latest"

function Validate-TimeStampAndSampleIntervalParameters()
{
    [CmdletBinding(DefaultParameterSetName="OneHour")]
    PARAM(
        
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$false, ParameterSetName="OneHour")]
        [ValidateScript({($_) -le [DateTime]::Now -and ($_) -ge [DateTime]::Now.AddYears(-5)})
        [DateTime] $Time,
        
        [Parameter(Position=1, Mandatory=$True, ValueFromPipeline=$false, ParameterSetName="OneHour")]
        [ValidateSet(1,2,3,4,5,6,10,12,15,30,60)] 
        [int] $SampleInterval
    )
    Process
    {
        return $true
    }
}

function Is-RecordAtDesiredSampleTimeStamp()
{
    
    [CmdletBinding(DefaultParameterSetName="OneHour")]
    PARAM(
        
        [Parameter(Position=0, Mandatory=$True, ValueFromPipeline=$True, ParameterSetName="OneHour")]
        [DateTime] $Time,
        
        [Parameter(Position=1, Mandatory=$True, ValueFromPipeline=$True, ParameterSetName="OneHour")]
        [int] $SampleInterval=10
    )
    Process
    {
        
        #Parameter Validation
        try
        {
            #These validations throw an exception of type System.Manamgent.Automation.ParameterBindingValidationException which is defined internal
            #To work around this issue, I use the parameter validation attributes in a helper function and call this helper in a try catch block.
            #In the catch block I throw an exception that is public.
            $Result = Validate-TimeStampAndSampleIntervalParameters -Time $Time -SampleInterval $SampleInterval
        }
        catch
        {
            $ArgumentOutOfRangeException = New-Object -TypeName "System.ArgumentOutOfRangeException" -ArgumentList $_.Exception, $_.Exception.Message
            throw $ArgumentOutOfRangeException
        }
         
        if( $Time.Minute -eq 0)
        {
            $Minutes = 60
        }
        else
        {
            $Minutes = $Time.Minute
        }
    
        if(($Minutes % $SampleInterval) -eq 0)
        {
            if($Time.Second -eq 0)
            {
                return $true
            }
        }
        return $false
    }# End Process
}

