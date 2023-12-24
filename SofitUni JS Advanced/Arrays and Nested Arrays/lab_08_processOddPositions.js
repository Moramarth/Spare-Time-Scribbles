function processOddPositions(inputArray) {
    let outputArray = []
    
    for (let index in inputArray) {
        if (index % 2 !== 0){
            outputArray.push(inputArray[index] * 2)
        }
    }
    return outputArray.reverse()
}