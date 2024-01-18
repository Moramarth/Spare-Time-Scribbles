function townsToJSON(stringsArray) {
    stringsArray.shift()
    const output = []

    for (let element of stringsArray) {
        element = element.split('|')
            .filter(element => element !== "")
        const [town, latitude, longitude] = element
        output.push({
            'Town': town.trim(),
            'Latitude': Number(latitude.trim()).toFixed(2),
            'Longitude': Number(longitude.trim()).toFixed(2),
        })
    }
    console.log(JSON.stringify(output))
}