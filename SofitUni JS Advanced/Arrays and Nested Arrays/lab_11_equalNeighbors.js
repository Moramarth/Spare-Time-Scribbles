function equalNeighbors(inputMatrix) {
    let equalPairsCount = 0;

    for (let rowIndex in inputMatrix) {
        const currentRow = inputMatrix[Number(rowIndex)];
        const nextRow = inputMatrix[Number(rowIndex) + 1];

        for (let elementIndex in currentRow) {
            if (nextRow) {
                if (currentRow[elementIndex] === nextRow[elementIndex])
                    equalPairsCount++;
                if (currentRow[elementIndex] === currentRow[Number(elementIndex) + 1])
                    equalPairsCount++;
            } else {
                if (currentRow[elementIndex] === currentRow[Number(elementIndex) + 1])
                    equalPairsCount++;
            }
        }
    }
    return equalPairsCount
}