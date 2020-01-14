Function.prototype.myBind = function (context) {
  return () => this.apply(context);
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

class BigLamp {
  constructor() {
    this.name = "a massive lamp";
  }
}

const turnOn = function() {
  console.log(`Turning on ${this.name}`);
}

const lamp = new Lamp();
const bLamp = new BigLamp();

turnOn();

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(bLamp);

boundTurnOn();
myBoundTurnOn();