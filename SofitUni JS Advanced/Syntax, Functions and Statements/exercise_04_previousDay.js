function previousDay(year, month, day) {
    const date = new Date(year, month - 1, day)

    date.setDate(date.getDate() - 1)

    const currentYear = date.getFullYear()
    const currentMonth = date.getMonth()
    const currentDay = date.getDate()


    console.log(`${currentYear}-${currentMonth + 1}-${currentDay}`)
}