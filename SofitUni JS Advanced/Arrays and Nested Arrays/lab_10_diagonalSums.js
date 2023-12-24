function diagonalSums(inputSquareMatrix) {
    let mainDiagonalSum = 0
    let secondaryDiagonalSum = 0

    const loops = inputSquareMatrix.length

    for (let i = 0; i < loops; i++) {
        mainDiagonalSum += inputSquareMatrix[i][i]
        secondaryDiagonalSum += inputSquareMatrix[i][loops - 1 - i]
    }

   console.log(`${mainDiagonalSum} ${secondaryDiagonalSum}`)
}