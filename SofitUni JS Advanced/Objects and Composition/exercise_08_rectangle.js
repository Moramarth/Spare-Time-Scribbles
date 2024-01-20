function rectangle(width, height, color) {
   
    color = color[0].toUpperCase() + color.slice(1).toLowerCase()

    const rectangleObj = {
        width,
        height,
        color,
        calcArea: () => width * height
    }
    return rectangleObj
}