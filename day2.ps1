[CmdletBinding()]
param()
$Host.PrivateData.VerboseForegroundColor = 'red'

# =============== Load function =================== #
$startDirectory = Get-Location
$functionDirectory = "$startDirectory\functions"
$functionsFile = Get-ChildItem -Path $functionDirectory -Filter *.ps1

foreach ($file in $functionsFile) {
    . $file
}
# ================================================== #

$puzzleAsArray = getInputPuzzleFromLinkAsArray -urlOfInputPuzzles "https://adventofcode.com/2023/day/2/input"
# $puzzleAsArray = readLinesFromFileAndAddToArray -pathToFile .\inputs\day2.txt
$arrayOfPots = @()
$sumOfBadGames = 0
$sumOfGoodGames = 0   
$goodGame = $true

$redCubes = 12
$greenCubes = 13
$blueCubes = 14

foreach ($item in $puzzleAsArray) {
    
    $goodGame = $true
    $arrayOfRealPots = @()
    $actualGame = [regex]::Match($item, "[\d]+(?=:)")
    
   
    $arrayOfPots = $item.split(",").Split(";").Split(":")
    foreach ($obj in $arrayOfPots) {
        if (!($obj.Contains("Game"))) {
            $arrayOfRealPots += $obj
        }
    }
    
    foreach ($colorSet in $arrayOfRealPots) {
        if ($colorSet.Contains("red")) {
            
            $valueOfCube = [regex]::Match($colorSet, "\d+")
            if ([int][string]$valueOfCube -gt $redCubes) {
                
                write-debug ("RED Value of Cube is $valueOfCube")
                $sumOfBadGames += $actualGame.Value
                $goodGame = $FALSE
                break
            }

        }
        if ($colorSet.Contains("green")) {
            $valueOfCube = [regex]::Match($colorSet, "\d+")
            if ([int][string]$valueOfCube -gt $greenCubes) {
                
                write-debug("GREEN Value of Cube is $valueOfCube")
                $sumOfBadGames += $actualGame.Value
                $goodGame = $FALSE
                break
            }

        }
        if ($colorSet.Contains("blue")) {
            $valueOfCube = [regex]::Match($colorSet, "\d+")
            if ([int][string]$valueOfCube -gt $blueCubes) {
                
                write-debug("BLUE Value of Cube is $valueOfCube")
                $sumOfBadGames += $actualGame.Value
                $goodGame = $FALSE
                break
            }
        }
    }
    if($goodGame -eq $true){
        Write-Verbose ("Good game: $actualGame")
        $sumOfGoodGames += $actualGame.Value
    }
    
}
write-debug ("Sum of badGames $sumOfBadGames")
$sumOfFirst100Numbers = sumOfFirst100Numbers 
write-debug ("Sum of 100 $sumOfFirst100Numbers")
    
$answer = $sumOfFirst100Numbers - $sumOfBadGames
write-debug("Najbrzydszy wnynik świata to: $answer")
Write-Host -ForegroundColor Green "Wynik: $sumOfGoodGames"






    
