let hammerTime = function (time) {
  setTimeout(function () {
    console.log(`${time} is hammertime!`)
  }, 3000);
}

// Tea and Biscuits - readline doesn't seem to work properly on my end...

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

function teaAndBiscuits () {
  reader.question("Would you like a cup of tea?", function (teaInput) {
    console.log(`You replied ${teaInput}`);
    reader.question("Would you also like some biscuits?", function (biscInput) {
      console.log(`You replied ${biscInput}`);
      const firstRes = (teaInput === "yes") ? "do" : "don't";
      const secondRes = (biscInput === "yes") ? "do" : "don't";
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits, got it.`);
      reader.close();
    });
  });

};

// Cats and Dogs

function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();

apply