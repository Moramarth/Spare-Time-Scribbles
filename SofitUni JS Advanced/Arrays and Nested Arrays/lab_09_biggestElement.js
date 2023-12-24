function biggestElement(inputMatrix) {
    const biggestOfEach = inputMatrix.map((element) => Math.max(...element))

    return Math.max(...biggestOfEach)
}