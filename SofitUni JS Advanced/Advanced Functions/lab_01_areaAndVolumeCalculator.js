function areaAndVolumeCalculator(areaFunc, volumeFunc, input) {
    const output = []
    let x, y, z;

    JSON.parse(input).map(obj => {
        x = obj.x
        y = obj.y
        z = obj.z

        const boundAreaFunc = areaFunc.bind({ x, y });
        const boundVolumeFunc = volumeFunc.bind({ x, y, z });

        output.push({
            area: boundAreaFunc(), volume: boundVolumeFunc()
        })
    })

    return output
}