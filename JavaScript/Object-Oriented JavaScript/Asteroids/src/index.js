const MovingObject = require("./moving_object.js")
window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext("2d");
})

// {pos:[30,50], vel:[5,5], radius:30, color:"green"}