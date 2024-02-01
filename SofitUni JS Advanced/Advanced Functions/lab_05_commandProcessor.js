function commandProcessor() {
    let initialString = ""

    function append(string) {
        initialString += string
    }
    function removeStart(n) {
        initialString = initialString.slice(n)
    }
    function removeEnd(n) {
        initialString = initialString.slice(0, initialString.length - n)
    }
    function print() {
        console.log(initialString)
    }
    return { append, removeStart, removeEnd, print}
}
