class Clock {
  constructor() {
    const time = new Date();
    this.hours = time.getHours();
    this.minutes = time.getMinutes();
    this.seconds = time.getSeconds();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    function pad(num) {
      let numStr = num + "";
      if (numStr.length < 2) {
        numStr = "0" + numStr;
      }
      return numStr;
    }

    let timeString = `${pad(this.hours)}:${pad(this.minutes)}:${pad(this.seconds)}`
    console.log(timeString);
  }

  _tick(fun) {
    this.seconds++;
    if (this.seconds >= 60) {
      this.seconds = 0;
      this.minutes++;
      if (this.minutes >= 60) {
        this.minutes = 0;
        this.hours++;
        if (this.hours >= 24) {
          this.hours == 0;
        }
      }
    }
    this.printTime();
  }
}

const clock = new Clock();