function carFactory(carObj
) {
    const engine = {
        small: { power: 90, volume: 1800 },
        normal: { power: 120, volume: 2400 },
        monster: { power: 200, volume: 3500 },
    }
    const numberOfTyres = 4

    const newCar = {
        model: '',
        engine: {
            power: 0,
            volume: 0,
        },
        carriage: {
            type: '',
            color: ''
        },
        wheels: []
    }

    newCar.model = carObj.model
    Object.values(engine).map((value) => {
        if (value.power >= carObj.power && newCar.engine.power === 0) {
            newCar.engine.power = value.power
            newCar.engine.volume = value.volume
        }
    })

    newCar.carriage.type = carObj.carriage
    newCar.carriage.color = carObj.color

    let wheel = Math.floor(carObj.wheelsize);
    if (wheel % 2 === 0) wheel -= 1;

    while (newCar.wheels.length < numberOfTyres) {
        newCar.wheels.push(wheel)
    }

    return newCar
}