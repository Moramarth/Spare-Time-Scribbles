function listProcessor(stringsArray) {
    const innerList = []

    const processor = {
        add: (string) => {
            innerList.push(string)
        },
        remove: (string) => {
            while (innerList.includes(string)) {
                innerList.splice(innerList.indexOf(string), 1)
            };
        },
        print: () => {
            console.log(innerList.join(','))
        },
    }

    for (let entry of stringsArray) {
        const [command, value] = entry.split(' ')
        processor[command](value)
    }
}
