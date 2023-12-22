function timeToWalk(numberOfSteps, stepLength, speed) {
    const distanceInMeters = numberOfSteps * stepLength

    const breakTimeSeconds = Math.floor(distanceInMeters / 500) * 60
    
    const timeInSeconds = ((distanceInMeters / 1000 / speed) * 60 * 60 + breakTimeSeconds)

    const hours = Math.floor(timeInSeconds / 3600)
    const minutes = Math.floor((timeInSeconds - hours * 3600) / 60)
    const seconds = Math.round(timeInSeconds - (hours * 3600) - (minutes * 60))

    console.log(`${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`)
}