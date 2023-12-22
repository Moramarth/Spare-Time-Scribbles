function GCD(firstNumber, secondNumber) {
    if (secondNumber === 0) {
        console.log(firstNumber);
        return
    }

    return GCD(secondNumber, firstNumber % secondNumber)
}