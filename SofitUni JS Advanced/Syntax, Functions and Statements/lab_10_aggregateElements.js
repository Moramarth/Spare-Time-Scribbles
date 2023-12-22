function aggregateElements(inputArray) {
    const sumOfElements = inputArray.reduce((acc, curr) => {
        acc += curr
        return acc
    }, 0)

    const inverseSum = inputArray.reduce((acc, curr) => {
        acc += 1 / curr
        return acc
    }, 0)

    const stringRepresentation = inputArray.reduce((acc, curr) => {
        acc += String(curr)
        return acc
    }, "")

    console.log(sumOfElements)
    console.log(inverseSum)
    console.log(stringRepresentation)
}
