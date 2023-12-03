# =============== Load function =================== #
$startDirectory = Get-Location
$functionDirectory = "$startDirectory\functions"
$functionsFile = Get-ChildItem -Path $functionDirectory -Filter *.ps1

foreach ($file in $functionsFile) {
    . $file
}
# ================================================== #

[string[]]$arrayWithLinesFromFile = readLinesFromFileAndAddToArray .\inputs\day1.txt

$charArray = @()
$answer = 0

foreach ($line in $arrayWithLinesFromFile) {
    
    $chars = $line.ToCharArray()
    foreach ($letter in $chars) {
        if ([char]::IsDigit($letter)) {
            $firstNumber = $letter
            break
        }
    }
    
    $reverseChar = $line.ToCharArray()
    [array]::Reverse($reverseChar)
    foreach ($letter in $reverseChar) {
        if ([char]::IsDigit($letter)) {
            $secondNumber = $letter
            break
        }
    }
    $decodedValue = $firstNumber + $secondNumber 

    $charArray += $decodedValue 
}

foreach ($item in $charArray){
    $answer += [int]$item
}
Write-host $answer
    