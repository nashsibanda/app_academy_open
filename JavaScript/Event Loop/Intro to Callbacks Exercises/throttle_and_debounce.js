Function.prototype.myThrottle = function (interval) {
  let tooSoon = false;
  return (...args) => {
    if (!tooSoon) {
      tooSoon = true;
      setTimeout( () => tooSoon = false, interval);
      this(...args);
    }
  }
};

class Neuron {
  fire() {
    console.log("Firing!");
  }
}

const neuron = new Neuron();
// When we create a new Neuron,
// we can call #fire as frequently as we want

neuron.fire = neuron.fire.myThrottle(300);
// The following code will try to #fire the neuron every 10ms. Try it in the console:
const interval = setInterval(() => {
  neuron.fire();
}, 10);
