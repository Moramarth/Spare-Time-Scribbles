function stringLength(firstString, secondString, thirdString) {
    const totalLength = firstString.length
        + secondString.length
        + thirdString.length;
    
    const avgLength = Math.floor(totalLength / 3)

    console.log(totalLength)
    console.log(avgLength)
}