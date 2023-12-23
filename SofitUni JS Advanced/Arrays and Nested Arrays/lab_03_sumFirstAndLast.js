function sumFirstAndLast(inputArray) {
    if (inputArray.length > 1)
        return Number(inputArray.shift()) + Number(inputArray.pop())
    else if (inputArray.length == 1) {
        return Number(inputArray.pop()) * 2
    }
}