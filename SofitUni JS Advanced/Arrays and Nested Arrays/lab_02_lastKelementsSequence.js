function sequence(n, k) {
    let output = [1]

    while (output.length < n) {
        let currentNumber = 0

        for (let i = 1; i <= k; i++) {
            if (output[output.length - i])
                currentNumber += output[output.length - i]
        }
        output.push(currentNumber)
    }

    return output
}