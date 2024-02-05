function add(initialValue) {
    let sum = initialValue;

    const addNext = (nextValue) => {
        sum += nextValue;
        return addNext;
    };

    addNext.toString = () => sum;

    return addNext;
}