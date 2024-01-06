function townPopulation (inputArray) {
    const townInfo = {}
    for (let element of inputArray) {
        [cityName, population] = element.split(' <-> ')
        if (Object.keys(townInfo).find(key => key === cityName)) {
            townInfo[cityName] += Number(population)
        } else {
            townInfo[cityName] = Number(population)
        }
    }

    Object.entries(townInfo).map(([key, value]) => {
        console.log(`${key} : ${value}`)
    })
}