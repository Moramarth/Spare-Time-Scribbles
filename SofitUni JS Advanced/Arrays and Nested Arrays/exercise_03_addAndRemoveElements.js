function addAndRemoveElements(inputArray) {
    let initialNumber = 1
    let outputArray = []

    for (const command of inputArray) {
        if (command === "add") {
            outputArray.push(initialNumber)
        } else if (command === "remove" && outputArray.length > 0) {
            outputArray.pop()
        }
        initialNumber++
    }

    if (outputArray.length === 0) console.log('Empty');
    else console.log(outputArray.join('\n'))
}
