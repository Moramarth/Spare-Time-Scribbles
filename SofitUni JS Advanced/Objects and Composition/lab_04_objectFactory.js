function objectFactory(library, orders) {
    const objectsArray = []

    for (const order of orders) {
        const currentObject = order.template
        const parts = order.parts

        for (const part of parts) {
            currentObject[part] = library[part];
        }
        objectsArray.push(currentObject)
    }
    return objectsArray
}
