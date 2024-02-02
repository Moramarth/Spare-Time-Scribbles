function getFibonator() {
    let a = 0;
    let b = 1;

    const getNext = () => {
        [a, b] = [b, a + b];
        const result = a;
        return result;
    };

    return getNext;
}