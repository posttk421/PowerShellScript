. PSUnit.ps1                                        #Load PSUnit frame work (Accessible via PATH environment variable set in the profile)

#cd C:\SCHREIBTISCH\SVN\PS\DownloadWeatherHistory    #Change the directory to point to the scripts under test
#. .\Interpolate-Records.ps1                         #Load Functions under test


function Test.Get-StatusField_ThrowsError_IfRecordsStringArrayIsToShort()
{
    "Hello First Test"
}

function Test.Get-StatusField_ThrowsError_IfRecordsStringArrayIsEmpty()
{
    "Hello Second Test"
    Assert-That -ActualValue $(2 + 2) -Constraint {$ActualValue -eq 4}
    Assert-That $(2 + 2) {$ActualValue -eq 4}

}

function Test.Merge-Table_DoesntBlowUp_IfExecuted()
{
    Merge-Table
}

function Test.Is-RecordAtDesiredSampleTimeStamp_ReturnsTrue_IFLogicIsNotImplementedYet()
{
    $Result = Is-RecordAtDesiredSampleTimeStamp -Record "0,0,0,0,0,0,0" -SampleInterval 10 
    Assert-That $Result {$ActualValue -eq $false}

}

function Merge-Table()
{
    "Merging Tables"
}

function Throw-Error()
{
    $Exception = New-Object -TypeName "System.InvalidOperationException"
    Throw $Exception
}

function Test.Throw-Error_ThrowsError([System.InvalidOperationException] $ExpectedException = $(new-object -TypeName "System.InvalidOperationException") )
{
    "Throwing Error"
    Throw-Error
}

function Test.ThisFunctionHasAllMetaData([System.InvalidOperationException] $ExpectedException = $(new-object -TypeName "System.InvalidOperationException"), [switch] $Skip, [switch] $Category_FastTests)
{
    "All Meta data"
}

function Test.ThisFunctionHasAllMetaExceptSkip([System.InvalidOperationException] $ExpectedException = $(new-object -TypeName "System.InvalidOperationException"), [switch] $Category_FastTests)
{
    "All Meta data"
}

function Test.ThisFunctionHasCategoryFastTests([switch] $Category_FastTests)
{
    "Category Fast Tests"
    Assert-That $(2 + 2) {$ActualValue -eq 4}
}


function Test.ThisFunctionHasCategoryFastTestsAndUsesTheDefaultException([switch] $Category_FastTests, [System.InvalidOperationException] $ExpectedException = $(DefaultException))
{
    "Category Fast Tests"
    Throw $(DefaultException)
    Assert-That $(2 + 2) {[System.InvalidOperationException] $ExpectedException = $(DefaultException)}
}

function Test.ThisFunctionCausesAnAssertToANonBoolean()
{
    Assert-That $(2 + 2) {"NonBooleanContraintEvaluation"}
}

function Test.ThisFunctionThrowsAnUnexpectedInvalidOperationException()
{
    Throw New-Object -TypeName "System.InvalidOperationException" -ArgumentList "Unexpected Exception!"
}

function Test.ThisFunctionThrowsSomeUnforeseenException()
{
    & (blabla.exe)   
}


function Test.ThisFunctionCausesAnAssertToANull()
{
    Assert-That $(2 + 2) {$Null}
}

function Test.ThisFunctionCausesAnAssertToThrowAnException()
{
    Assert-That $(2 + 2) {& (blabla.exe)}
}

function Test.ThisFunctionUsesAnUnknownExceptionTypeInTheExpectedExceptionParameter([System.InvalidOperationException] $ExpectedException = $(New-Object -TypeName "System.CPUOverclockedExcpetion"))
{
    Assert-That $(2 + 2) {$ActualValue -eq 4}
}

function Test.ThisFunctionUsesTheAssignmentOperatorWithAnIntegerAsAssertConstraint()
{
    Assert-That $(2 + 2) {$ActualValue = 4}
}

function Test.ThisFunctionUsesTheAssignmentOperatorWithAnBooleanAsAssertConstraint()
{
    Assert-That $True {$ActualValue = $True}
}

function Test.ThisFunctionComparesTrueWithTrue()
{
    Assert-That $True {$ActualValue -eq $True}
}

#Assertions +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Equality Asserts =============================================================

#Assert.AreEqual( int expected, int actual );
#Assert.AreNotEqual( uint expected, uint actual );
#Assert.AreNotEqual( uint expected, uint actual );

#Special Cases
#GlobalSettings.DefaultFloatingPointTolerance 
#Assert.AreEqual( double.PositiveInfinity, double.PositiveInfinity );
#Assert.AreEqual( double.NegativeInfinity, double.NegativeInfinity );
#Assert.AreEqual( double.NaN, double.NaN );

#Identity Asserts =============================================================

#Assert.AreSame and Assert.AreNotSame test whether the same objects are referenced by the two arguments.
#Assert.AreSame( object expected, object actual );
#Assert.AreNotSame( object expected, object actual );

#Assert.Contains is used to test whether an object is contained in an array or list.
#Assert.Contains( object anObject, IList collection );

#Condition Tests ==============================================================

#Assert.IsTrue( bool condition );
#Assert.IsFalse( bool condition);
#Assert.IsNull( object anObject );
#Assert.IsNotNull( object anObject );
#Assert.IsNaN( double aDouble );
#Assert.IsEmpty( string aString );
#Assert.IsNotEmpty( string aString );
#Assert.IsEmpty( ICollection collection );
#Assert.IsNotEmpty( ICollection collection );

#Comparisons ==================================================================

#Assert.Greater( int arg1, int arg2 );
#Assert.GreaterOrEqual( int arg1, int arg2 );
#Assert.Less( int arg1, int arg2 );
#Assert.LessOrEqual( int arg1, int arg2 );

#Special cases are DateTime

#Type Asserts =================================================================

#Assert.IsInstanceOfType( Type expected, object actual );			
#Assert.IsNotInstanceOfType( Type expected, object actual );		
#Assert.IsAssignableFrom( Type expected, object actual );				
#Assert.IsNotAssignableFrom( Type expected, object actual );

#Utility Methods ==============================================================

#Assert.Fail()
#Assert.Ignore()

#Exception Assert =============================================================

#Provided with test parameter

#String Asserts

#StringAssert.Contains( string expected, string actual );
#StringAssert.StartsWith( string expected, string actual );
#StringAssert.EndsWith( string expected, string actual );
#StringAssert.AreEqualIgnoringCase( string expected, string actual );				
#StringAssert.IsMatch( string regexPattern, string actual );

#Collection Asserts ===========================================================

#CollectionAssert.AllItemsAreInstancesOfType( IEnumerable collection, Type expectedType );
#CollectionAssert.AllItemsAreNotNull( IEnumerable collection );
#CollectionAssert.AllItemsAreUnique( IEnumerable collection );
#CollectionAssert.AreEqual( IEnumerable expected, IEnumerable actual );
#CollectionAssert.AreEquivalent( IEnumerable expected, IEnumerable actual);
#CollectionAssert.AreNotEqual( IEnumerable expected, IEnumerable actual );
#CollectionAssert.AreNotEquivalent( IEnumerable expected, IEnumerable actual );
#CollectionAssert.Contains( IEnumerable expected, object actual );
#CollectionAssert.DoesNotContain( IEnumerable expected, object actual );
#CollectionAssert.IsSubsetOf( IEnumerable subset, IEnumerable superset );
#CollectionAssert.IsNotSubsetOf( IEnumerable subset, IEnumerable superset);
#CollectionAssert.IsEmpty( IEnumerable collection );
#CollectionAssert.IsNotEmpty( IEnumerable collection );
#CollectionAssert.IsOrdered( IEnumerable collection );
#CollectionAssert.IsOrdered( IEnumerable collection, IComparer comparer );

#File Asserts

#FileAssert.AreEqual( Stream expected, Stream actual );
#FileAssert.AreEqual( FileInfo expected, FileInfo actual );
#FileAssert.AreEqual( string expected, string actual );
#FileAssert.AreNotEqual( Stream expected, Stream actual );
#FileAssert.AreNotEqual( FileInfo expected, FileInfo actual );
#FileAssert.AreNotEqual( string expected, string actual );

#Directory Assert

#DirectoryAssert.AreEqual( DirectoryInfo expected, DirectoryInfo actual );
#DirectoryAssert.AreEqual( string expected, string actual );
#DirectoryAssert.AreNotEqual( DirectoryInfo expected, DirectoryInfo actual );
#DirectoryAssert.AreNotEqual( string expected, string actual );
#DirectoryAssert.IsEmpty( DirectoryInfo directory );
#DirectoryAssert.IsEmpty( string directory );
#DirectoryAssert.IsNotEmpty( DirectoryInfo directory );
#DirectoryAssert.IsNotEmpty( string directory );
#DirectoryAssert.IsWithin( DirectoryInfo expected, DirectoryInfo actual );
#DirectoryAssert.IsWithin( string expected, string actual );
#DirectoryAssert.IsNotWithin( DirectoryInfo expected, DirectoryInfo actual );
#DirectoryAssert.IsNotWithin( string expected, string actual );


#See also Propety and Delay Constraints