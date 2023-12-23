function evenPosition(array) {
    const loops = array.length
    let output = []

    for (let i = 0; i < loops; i += 2){
        output.push(array[i])
    }

    console.log(output.join(" "))
}