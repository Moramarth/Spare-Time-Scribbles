function constructionCrew(workerObj) {
    if (workerObj.dizziness) {
        workerObj.levelOfHydrated += 0.1 * workerObj.weight * workerObj.experience
        workerObj.dizziness = false
    }
   
    return workerObj
}