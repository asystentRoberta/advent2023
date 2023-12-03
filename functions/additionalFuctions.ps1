function returnNumberFromArray {
    param (
        [array]$ArrayToCheck
    )

    foreach ($letter in $ArrayToCheck) {
        if ([char]::IsDigit($letter)) {
            $firstNumber = $letter
            break
        }
    }
    
}

function sumOfFirst100Numbers {

    $sum = 0
    for ($i=1; $i -lt 101; $i++) {
        $sum += $i
    }
    return $sum

}