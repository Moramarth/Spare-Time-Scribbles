function createFormatter(separator, symbol, symbolIsFirst, formatterFunc ) {
    return function(value) {
        return formatterFunc(separator,symbol,symbolIsFirst, value)
    }
}
