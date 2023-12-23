function smallestTwoNumbers(inputArray) {
    const firstSmallestNumber = Math.min(...inputArray)

    inputArray.splice(inputArray.indexOf(firstSmallestNumber), 1)

    const secondSmallestNumber = Math.min(...inputArray)

    console.log(`${firstSmallestNumber} ${secondSmallestNumber}`)
}