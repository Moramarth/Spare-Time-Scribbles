function magicMatrices(inputMatrice) {
    let targetSum;
    const loops = inputMatrice.length

    for (let i = 0; i < loops; i++) {
        let currentSum = inputMatrice[i].reduce((acc, curr) => {
            return acc + curr
        }, 0)

        if (targetSum && currentSum !== targetSum) {
            return false
        }
        targetSum = currentSum

        let columnSum = 0
        for (let j = 0; j < loops; j++) {
            columnSum += inputMatrice[j][i]
        }
        if (columnSum !== targetSum) return false;
    }
    return true
}