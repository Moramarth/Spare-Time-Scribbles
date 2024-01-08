function calorieObject(stringsArray) {
    const loops = stringsArray.length
    const outputObj = {}
    for (let i = 0; i < loops; i += 2) {
        outputObj[stringsArray[i]] = Number(stringsArray[i + 1])
    }
    console.log(outputObj)
}