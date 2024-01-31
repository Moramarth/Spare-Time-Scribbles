function solution(number) {
    const numberToStore = number;

    return function addToStoredNumber(numberToAdd) {
        return numberToStore + numberToAdd;
    };
};
