function createAssemblyLine() {
    function hasClima(obj) {
        const temp = 21;
        const tempSettings = 21;
        function adjustTemp() {
            if (this.temp > this.tempSettings) this.temp--;
            else if (this.temp < this.tempSettings) this.temp++;
        }
        obj.temp = temp;
        obj.tempSettings = tempSettings;;
        obj.adjustTemp = adjustTemp;
    }

    function hasAudio(obj) {
        let currentTrack = null
        function nowPlaying() {
            if (this.currentTrack !== null && this.currentTrack)
                console.log(`Now playing '${this.currentTrack.name}' by ${this.currentTrack.artist}`)
        }
        obj.currentTrack = currentTrack
        obj.nowPlaying = nowPlaying
    }

    function hasParktronic(obj) {
        function checkDistance(distance) {
            if (distance < 0.1) console.log("Beep! Beep! Beep!");
            else if (distance < 0.25) console.log("Beep! Beep!");
            else if (distance < 0.5) console.log("Beep!");
            else console.log("")
        }
        obj.checkDistance = checkDistance
    }

    return { hasAudio, hasClima, hasParktronic }
}