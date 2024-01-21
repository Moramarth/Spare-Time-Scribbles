function lowestPricesInCities(stringsArray) {
    const productsData = {}

    for (const entry of stringsArray) {
        let [town, product, price] = entry.split(" | ")
        price = Number(price)

        if (!productsData[product]) {
            productsData[product] = {
                town,
                price,
            }
        } else if (productsData[product].price > price) {
            productsData[product].price = price
            productsData[product].town = town
        }
    }

    Object.entries(productsData).map(([key, value]) => {
        console.log(`${key} -> ${value.price} (${value.town})`)
    })
}