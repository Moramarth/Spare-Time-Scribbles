function cars(stringsArray) {
    const cars = {};

    const actions = {
        create: (name) => {
            cars[name] = {
                own: {},
                inherited: null,
            }
        },

        inherits: (ownName, parentName) => {
            actions.create(ownName)
            cars[ownName].inherited = cars[parentName]
        },
        set: (name, key, value) => {
            cars[name].own[key] = value
        },

        print: (name) => {
            const toPrint = getObjectAttributes(cars[name])
            console.log(toPrint.join(','))
        }
    }

    function getObjectAttributes(obj) {
        const objectAttributes = []
        Object.entries(obj.own).forEach(([key, value]) => {
            objectAttributes.push(`${key}:${value}`)
        })
        if (obj.inherited === null) {
            return objectAttributes
        }
        return objectAttributes.concat(getObjectAttributes(obj.inherited))
    }

    for (const entry of stringsArray) {
        const [command, ...rest] = entry.split(" ")

        if (!rest.includes('inherit')) {
            actions[command](...rest)
        } else {
            actions.inherits(rest[0], rest[2])
        }
    }
}
