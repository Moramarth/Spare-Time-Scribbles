function calculator() {
    let firstInput, secondInput, resultBox;
    return {
        init: (selector1, selector2, resultSelector) => {
            firstInput = document.querySelector(selector1);
            secondInput = document.querySelector(selector2);
            resultBox = document.querySelector(resultSelector);
        },
        add: () => {
            resultBox.value = Number(firstInput.value) + Number(secondInput.value);
        },
        subtract: () => {
            resultBox.value = Number(firstInput.value) - Number(secondInput.value);
        },
    };
};
