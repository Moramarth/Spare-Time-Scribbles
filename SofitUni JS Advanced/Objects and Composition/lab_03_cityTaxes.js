function cityTaxes(name, population, treasury) {
    const taxRate = 10
    const city = {
        name,
        population,
        treasury,
        taxRate,
        collectTaxes,
        applyGrowth,
        applyRecession,
    }

    function collectTaxes() {
        city.treasury += Math.floor(city.taxRate * population)
    }

    function applyGrowth(percentage) {
        city.population += Math.floor(city.population * (percentage / 100))
    }

    function applyRecession(percentage) {
        city.treasury -= Math.floor(city.treasury * (percentage / 100))
    }
    return city
}