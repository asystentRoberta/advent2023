function readLinesFromFileAndAddToArray {
    param (
     [string]$pathToFile
    )

    [string[]]$arrayWithLinesFromFile = Get-Content -Path $pathToFile

    return $arrayWithLinesFromFile
    
}