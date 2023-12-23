function positiveAndNegative(inputArray) {
    let outputArray = [];

    for (let number of inputArray) {
        if (number < 0) outputArray.unshift(number);
        else outputArray.push(number)
    }

    for (let number of outputArray) {
        console.log(number)
    }
}