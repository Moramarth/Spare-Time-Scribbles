function biggerHalf(inputArray) {
    return inputArray.sort((a, b) => a - b)
        .slice(Math.floor(inputArray.length / 2))
}