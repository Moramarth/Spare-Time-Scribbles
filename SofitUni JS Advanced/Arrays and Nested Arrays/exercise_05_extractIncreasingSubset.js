function extractIncreasingSubset(inputArray) {
    return inputArray.reduce((acc, curr) => {
        if (acc.length === 0 ) acc.push(curr);
        else if (curr >= acc.slice(-1)) acc.push(curr);
        return acc
    }, [])
}