document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("mycanvas");
  const ctx = myCanvas.getContext('2d');

  ctx.fillStyle = "red"
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "black";
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(200, 100);
  ctx.lineTo(225, 125);
  ctx.lineTo(225, 75);
  // ctx.closePath();
  // ctx.strokeStyle = "black";
  // ctx.lineWidth = 10;
  // ctx.stroke();
  ctx.fillStyle = "yellow";
  ctx.fill();
  
  ctx.beginPath();
  ctx.arc(250, 370, 100, 0, 2 * Math.PI);
  ctx.fillStyle = "rgb(60.1%, 85.1%, 60.1%)";
  ctx.fill();
  ctx.moveTo(250, 270);
  ctx.lineTo(250, 370);
  ctx.lineTo(160, 420);
  ctx.moveTo(250, 370);
  ctx.lineTo(340, 420);
  ctx.stroke();

});
