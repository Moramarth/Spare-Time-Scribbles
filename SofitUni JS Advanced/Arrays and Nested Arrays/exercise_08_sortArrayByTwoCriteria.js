function sortArrayByTwoCriteria(inputArray) {
    const outputArray = inputArray.sort(customSort)
    console.log(outputArray.join('\n'))

    function customSort(a, b) {
        const sortByLength = (a.length - b.length)

        if (sortByLength === 0) {
            return a.localeCompare(b, undefined, { sensitivity: 'base' })
        }

        return sortByLength
    }
}