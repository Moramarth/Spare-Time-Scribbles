function argumentInfo(...arguments) {
    const typesCounter = {};

    for (const arg of arguments) {
        currentType = [typeof (arg)]
        console.log(`${currentType}: ${arg}`)
        if (!typesCounter[currentType]) {
            typesCounter[currentType] = 1
        } else {
            typesCounter[currentType] += 1
        }
    }

    Object.entries(typesCounter)
        .sort((a, b) => (typesCounter[b[0]] - typesCounter[a[0]]))
        .forEach(([key, value]) => console.log(`${key} = ${value}`))

}