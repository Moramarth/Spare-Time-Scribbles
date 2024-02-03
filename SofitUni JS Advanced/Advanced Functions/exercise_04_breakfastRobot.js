function breakfastRobot() {
    const availableIngredients = {
        protein: 0,
        carbohydrate: 0,
        fat: 0,
        flavour: 0,
    }

    const recipes = {
        apple: {
            carbohydrate: 1,
            flavour: 2,
        },
        lemonade: {
            carbohydrate: 10,
            flavour: 20,
        },
        burger: {
            carbohydrate: 5,
            fat: 7,
            flavour: 3,
        },
        eggs: {
            protein: 5,
            fat: 1,
            flavour: 1,
        },
        turkey: {
            protein: 10,
            carbohydrate: 10,
            fat: 10,
            flavour: 10,
        }
    }

    const commandHandler = {
        restock: restockSupplies,
        prepare: prepareBreakfast,
        report: reportStatus,

    }

    function restockSupplies(ingredient, quantity) {
        availableIngredients[ingredient] += Number(quantity)
        return `Success`
    }

    function prepareBreakfast(requestedType, quantity) {
        const ingredientsNeeded = { ...recipes[requestedType] }
        for (const ingredient in ingredientsNeeded) {
            ingredientsNeeded[ingredient] *= Number(quantity)

            if (ingredientsNeeded[ingredient] > availableIngredients[ingredient]) {
                return `Error: not enough ${ingredient} in stock`
            }
        }

        for (const key in ingredientsNeeded) {
            availableIngredients[key] -= ingredientsNeeded[key]
        }
        return `Success`
    }

    function reportStatus() {
        output = []
        Object.keys(availableIngredients).forEach(key => output.push(
            `${key}=${availableIngredients[key]}`
        ))
        return output.join(" ")
    }

    return function main(commandString) {
        const [command, ...rest] = commandString.split(' ')

        return commandHandler[command](...rest)
    }
}
