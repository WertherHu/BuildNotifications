param (
    [string]$targetPath = "BuildNotifications\Resources\Global\Sizes.xaml",
    [Parameter(Mandatory=$true)][double]$blockSize
 )

$sb = [System.Text.StringBuilder]::new()
[void]$sb.AppendLine("<ResourceDictionary xmlns=`"http://schemas.microsoft.com/winfx/2006/xaml/presentation`"")
[void]$sb.AppendLine("                    xmlns:x=`"http://schemas.microsoft.com/winfx/2006/xaml`"")
[void]$sb.AppendLine("                    xmlns:system=`"clr-namespace:System;assembly=System.Runtime`">")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <!--AUTO GENERATED FILE-->")
[void]$sb.AppendLine("    <!--Use `" .\Scripts\WriteSizeXaml.ps1 -blockSize $($blockSize)`" in Package Manager Console to generate this file-->")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockSixth`">$($blockSize/6)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockQuarter`">$($blockSize/4)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockHalf`">$($blockSize/2)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockThreeQuarters`">$($blockSize*0.75)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockFiveSixths`">$($blockSize/6*5)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockElevenTwelfths`">$($blockSize/12*11)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"Block`">$($blockSize)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockOneAndQuarter`">$($blockSize*1.25)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockOneAndHalf`">$($blockSize*1.5)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockDouble`">$($blockSize*2)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockDoubleAndHalf`">$($blockSize*2.5)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockTriple`">$($blockSize*3)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockFourTimes`">$($blockSize*4)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockTwelveTimes`">$($blockSize*12)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockFourteenTimes`">$($blockSize*14)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockTwentyFive`">$($blockSize*25)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockThirty`">$($blockSize*30)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockTwentyEight`">$($blockSize*28)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockNineteenTimes`">$($blockSize*19)</system:Double>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <GridLength x:Key=`"BlockSixthRowLength`">$($blockSize/6)</GridLength>")
[void]$sb.AppendLine("    <GridLength x:Key=`"BlockQuarterRowLength`">$($blockSize/4)</GridLength>")
[void]$sb.AppendLine("    <GridLength x:Key=`"BlockHalfRowLength`">$($blockSize/2)</GridLength>")
[void]$sb.AppendLine("    <GridLength x:Key=`"BlockRowLength`">$($blockSize)</GridLength>")
[void]$sb.AppendLine("    <GridLength x:Key=`"BlockDoubleRowLength`">$($blockSize*2)</GridLength>")
[void]$sb.AppendLine("    <GridLength x:Key=`"BlockTripleRowLength`">$($blockSize*3)</GridLength>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <system:Double x:Key=`"NegativeBlockThreeQuarters`">$($blockSize*-0.75)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"NegativeBlockQuarter`">$($blockSize/-4)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"NegativeBlockHalf`">$($blockSize/-2)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"NegativeBlock`">$($blockSize*-1)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"NegativeBlockOneAndHalf`">$($blockSize*-1.5)</system:Double>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockFont`">$($blockSize)</system:Double>")
[void]$sb.AppendLine("    <system:Double x:Key=`"BlockTripleFont`">$(($blockSize)*2)</system:Double>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockSixth}`" Right=`"{StaticResource BlockSixth}`" Top=`"{StaticResource BlockSixth}`" Bottom=`"{StaticResource BlockSixth}`" x:Key=`"BlockSixthThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockQuarter}`" Right=`"{StaticResource BlockQuarter}`" Top=`"{StaticResource BlockQuarter}`" Bottom=`"{StaticResource BlockQuarter}`" x:Key=`"BlockQuarterThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockHalf}`" Right=`"{StaticResource BlockHalf}`" Top=`"{StaticResource BlockHalf}`" Bottom=`"{StaticResource BlockHalf}`" x:Key=`"BlockHalfThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockThreeQuarters}`" Right=`"{StaticResource BlockThreeQuarters}`" Top=`"{StaticResource BlockThreeQuarters}`" Bottom=`"{StaticResource BlockThreeQuarters}`" x:Key=`"BlockThreeQuartersThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource Block}`" Right=`"{StaticResource Block}`" Top=`"{StaticResource Block}`" Bottom=`"{StaticResource Block}`" x:Key=`"BlockThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockHalf}`" Right=`"{StaticResource BlockHalf}`" Top=`"{StaticResource Block}`" Bottom=`"{StaticResource Block}`" x:Key=`"BlockThicknessOnYHalfOnX`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource Block}`" Right=`"{StaticResource Block}`" Top=`"{StaticResource BlockHalf}`" Bottom=`"{StaticResource BlockHalf}`" x:Key=`"BlockThicknessOnXHalfOnY`"/>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize*0.5)`" Right=`"$($blockSize*0.5)`" Top=`"{StaticResource Block}`" Bottom=`"{StaticResource Block}`" x:Key=`"BlockThicknessOnYQuartersOnX`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockHalf}`" Right=`"{StaticResource BlockHalf}`" Top=`"{StaticResource BlockQuarter}`" Bottom=`"{StaticResource BlockQuarter}`" x:Key=`"BlockQuarterThicknessOnYHalfOnX`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockDouble}`" Right=`"{StaticResource BlockDouble}`" Top=`"{StaticResource BlockDouble}`" Bottom=`"{StaticResource BlockDouble}`" x:Key=`"BlockDoubleThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockOneAndHalf}`" Right=`"{StaticResource BlockOneAndHalf}`" Top=`"{StaticResource BlockOneAndHalf}`" Bottom=`"{StaticResource BlockOneAndHalf}`" x:Key=`"BlockOneAndHalfThickness`"/>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource Block}`" Right=`"0`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockLeft`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource Block}`" Right=`"{StaticResource NegativeBlock}`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockLeftNegativeBlockRight`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource NegativeBlockQuarter}`" Right=`"{StaticResource NegativeBlock}`" Top=`"0`" Bottom=`"0`" x:Key=`"NegativeBlockQuarterLeftNegativeBlockRight`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockOneAndQuarter}`" Right=`"{StaticResource BlockThreeQuarters}`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockOneAndQuarterLeftAndThreeQuartersRight`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource BlockQuarter}`" Right=`"{StaticResource BlockQuarter}`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockLeftAndRight`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"{StaticResource BlockQuarter}`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockQuarterRight`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"{StaticResource BlockHalf}`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockHalfRight`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"{StaticResource NegativeBlockHalf}`" Right=`"{StaticResource NegativeBlockHalf}`" Top=`"{StaticResource NegativeBlockHalf}`" Bottom=`"{StaticResource NegativeBlockHalf}`" x:Key=`"NegativeBlockHalfThickness`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize*-0.5 - 0.5)`" Right=`"$($blockSize*-0.5 - 0.5)`" Top=`"$($blockSize*-0.33 - 0.5)`" Bottom=`"$($blockSize*-0.33 - 0.5)`" x:Key=`"NegativeBlockHalfThicknessAndABit`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"0`" Top=`"$($blockSize*0.25)`" Bottom=`"$($blockSize*0.25)`" x:Key=`"BlockQuarterYOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"0`" Top=`"$($blockSize*0.5)`" Bottom=`"$($blockSize*0.5)`" x:Key=`"BlockHalfYOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize*0.5)`" Right=`"$($blockSize*0.5)`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockHalfXOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize*2)`" Right=`"$($blockSize*2)`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockDoubleXOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"0`" Top=`"$($blockSize)`" Bottom=`"$($blockSize)`" x:Key=`"BlockYOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize)`" Right=`"$($blockSize)`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockXOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize*0.25)`" Right=`"$($blockSize*0.25)`" Top=`"0`" Bottom=`"0`" x:Key=`"BlockQuarterXOnlyMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize/3*-2)`" Right=`"0`" Top=`"0`" Bottom=`"0`" x:Key=`"NegativeTwoThirdsBlockToTheLeftMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"$($blockSize/-3)`" Top=`"$($blockSize/6)`" Bottom=`"0`" x:Key=`"NegativeQuarterRightSixthBlockTopMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"0`" Top=`"$($blockSize/-4)`" Bottom=`"0`" x:Key=`"NegativeQuarterTopMargin`"/>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("    <Thickness Left=`"$($blockSize*0.75+1)`" Right=`"$($blockSize*0.75+1)`" Top=`"{StaticResource BlockSixth}`" Bottom=`"{StaticResource BlockSixth}`" x:Key=`"BlockThreeQuartersPlusOneXSixthBlockOneYMargin`"/>")
[void]$sb.AppendLine("    <Thickness Left=`"0`" Right=`"$($blockSize*-2)`" Top=`"0`" Bottom=`"0`" x:Key=`"NegativeBlockDoubleThicknessFromRight`"/>")
[void]$sb.AppendLine("    <Rect Location=`"$($blockSize*-1), $($blockSize*1.5)`" x:Key=`"NegativeBlockLeftOneAndHalfBlockTopRectangle`"/>")
[void]$sb.AppendLine("")
[void]$sb.AppendLine("</ResourceDictionary>")

Set-Content $targetPath $sb.ToString()

return 'Created' + $targetPath
