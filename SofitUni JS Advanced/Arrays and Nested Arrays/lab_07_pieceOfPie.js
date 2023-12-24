function pieceOfPie(inputArray, firstTarget, secondTarget) {
    const startIndex = inputArray.indexOf(firstTarget)
    const endIndex = inputArray.indexOf(secondTarget) + 1

    return inputArray.slice(startIndex, endIndex)
}