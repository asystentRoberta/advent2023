function getInputPuzzleFromLinkAsString {
    param (
        [string]$urlOfInputPuzzles
    )
    $cookie = "session=53616c7465645f5f687a782cd7562f725efb6789d2bdf02c0c95c397b39a3e3dc133af1a6dfb6d9e798f7c384aaf990c7a13792ed66871058278a235c1944341"

    $response = Invoke-WebRequest -Uri $urlOfInputPuzzles -Headers @{"Cookie" = $cookie}

    return $response.Content
    
}

function getInputPuzzleFromLinkAsArray {
    param (
        [string]$urlOfInputPuzzles
    )
    [string]$response = getInputPuzzleFromLinkAsString -urlOfInputPuzzles  $urlOfInputPuzzles

    $puzzleAsArray = $response.Split("`n")
    return $puzzleAsArray
}

