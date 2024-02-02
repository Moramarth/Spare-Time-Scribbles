function sortArray(numbersArray, order) {

    const sortBy = {
        asc: (a, b) => (a - b),
        desc: (a, b) => (b - a),
    }

   return numbersArray.sort(sortBy[order])
}