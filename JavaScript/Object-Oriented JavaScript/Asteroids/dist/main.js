/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "../../../../../../../.nvm/versions/node/v12.14.1/lib/node_modules/webpack/buildin/global.js":
/*!***********************************!*\
  !*** (webpack)/buildin/global.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("var g;\n\n// This works in non-strict mode\ng = (function() {\n\treturn this;\n})();\n\ntry {\n\t// This works if eval is allowed (see CSP)\n\tg = g || new Function(\"return this\")();\n} catch (e) {\n\t// This works if the window reference is available\n\tif (typeof window === \"object\") g = window;\n}\n\n// g can still be undefined, but nothing to do about it...\n// We return undefined, instead of nothing here, so it's\n// easier to handle this case. if(!global) { ...}\n\nmodule.exports = g;\n\n\n//# sourceURL=webpack:///(webpack)/buildin/global.js?");

/***/ }),

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nconst DEFAULTS = {\n  COLOR: \"#554935\",\n  RADIUS: 30,\n  SPEED: 3\n}\n\nfunction Asteroid(options) {\n  options = options || {};\n  options.color = options.color || DEFAULTS.COLOR;\n  options.radius = DEFAULTS.RADIUS;\n  options.pos = options.pos;\n  options.vel = Utils.randomVec(DEFAULTS.SPEED);\n  options.game = options.game\n\n  MovingObject.call(this, options);\n}\nUtils.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function (otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate();\n  }\n}\n\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Utils = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\n\nfunction Bullet(options) {\n  options = options || {};\n  options.pos = options.pos;\n  options.vel = options.vel;\n  options.color = options.color || DEFAULTS.COLOR;\n  options.radius = options.radius || DEFAULTS.RADIUS;\n  options.game = options.game;\n\n  MovingObject.call(this, options);\n}\nUtils.inherits(Bullet, MovingObject)\n\n\nconst DEFAULTS = {\n  COLOR: \"#aaaaaa\",\n  RADIUS: 2\n}\n\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\");\n\nfunction Game () {\n  this.asteroids = [];\n  this.bullets = [];\n  this.addAsteroids();\n  this.addShip();\n}\n\nGame.DIM_X = 500;\nGame.DIM_Y = 500;\nGame.NUM_ASTEROIDS = 10;\n\nGame.prototype.addShip = function () {\n  this.ship = new Ship({\n    pos: this.randomPosition(),\n    game: this\n  })\n}\n\nGame.prototype.addBullet = function (bullet) {\n  this.bullets.push(bullet);\n}\n\nGame.prototype.allObjects = function () {\n  return this.asteroids.concat(this.ship, this.bullets);\n}\n\nGame.prototype.checkCollisions = function () {\n  for (let i = 0; i < this.allObjects().length; i++) {\n    const rootAst = this.allObjects()[i];\n    for (let j = 0; j < this.allObjects().length; j++) {\n      const compAst = this.allObjects()[j];\n      if (rootAst !== compAst && rootAst.isCollidedWith(compAst)) {\n        // console.log(\"Collision!\");\n        rootAst.collideWith(compAst);\n      }\n    }\n  }\n}\n\nGame.prototype.remove = function (object) {\n  if (object instanceof Bullet) {\n    let arrIndex = this.bullets.indexOf(object);\n    this.bullets.splice(arrIndex, 1);\n  } else if (object instanceof Asteroid) {\n    let arrIndex = this.asteroids.indexOf(object);\n    this.asteroids.splice(arrIndex, 1);\n  }\n}\n\nGame.prototype.step = function () {\n  this.moveObjects();\n  this.checkCollisions();\n}\n\nGame.prototype.addAsteroids = function () {\n  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n    let newAsteroid = new Asteroid( {\n      pos: this.randomPosition(),\n      game: this,\n    } )\n    this.asteroids.push(newAsteroid);\n  }\n}\n\nGame.prototype.randomPosition = function () {\n  let randX = Math.round(Math.random() * Game.DIM_X);\n  let randY = Math.round(Math.random() * Game.DIM_Y);\n  return [randX, randY]\n}\n\nGame.prototype.moveObjects = function () {\n  for (let i = 0; i < this.allObjects().length; i++) {\n    const element = this.allObjects()[i];\n    element.move();\n  }\n}\n\nGame.prototype.draw = function (ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  for (let i = 0; i < this.allObjects().length; i++) {\n    const element = this.allObjects()[i];\n    element.draw(ctx);\n  }\n}\n\nGame.prototype.wrap = function (pos) {\n  let bleed = 30;\n  if (pos[0] < (0 - bleed)) {\n    return [(Game.DIM_X + bleed), pos[1]];\n  } else if (pos[1] < (0 - bleed)) {\n    return [pos[0], (Game.DIM_Y + bleed)];\n  } else if (pos[0] > (Game.DIM_X + bleed)) {\n    return [(0 - bleed), pos[1]];\n  } else if (pos[1] > (Game.DIM_Y + bleed)) {\n    return [pos[0], (0 - bleed)];\n  } else {\n    return pos;\n  }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("/* WEBPACK VAR INJECTION */(function(global) {function GameView(game, ctx) {\n  this.game = game;\n  this.ctx = ctx;\n  this.ship = this.game.ship;\n}\n\nGameView.MOVES = {\n  \"w\": [0, -1],\n  \"a\": [-1, 0],\n  \"s\": [0, 1],\n  \"d\": [1, 0]\n}\n\nGameView.prototype.start = function () {\n  this.bindKeyHandlers();\n  const renderInterval = window.setInterval(this.render, 20);\n}\n\nGameView.prototype.render = function () {\n  console.log(\"Iterating...\")\n  this.game.step();\n  this.game.draw(this.ctx);\n}\n\nGameView.prototype.bindKeyHandlers = function () {\n  const ship = this.ship;\n  Object.keys(GameView.MOVES).forEach(key => {\n    const dir = GameView.MOVES[key];\n    global.key(key, function () { ship.power(dir); })\n  });\n  global.key(\"space\", function () { ship.fireBullet(); })\n}\n\nmodule.exports = GameView;\n/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./../../../../../../../../.nvm/versions/node/v12.14.1/lib/node_modules/webpack/buildin/global.js */ \"../../../../../../../.nvm/versions/node/v12.14.1/lib/node_modules/webpack/buildin/global.js\")))\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nwindow.GameView = GameView;\nwindow.Game = Game;\nwindow.Asteroid = Asteroid;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  window.ctx = document.getElementById('game-canvas').getContext(\"2d\");\n  window.game = new Game();\n  window.gview = new GameView(game, ctx);\n  // window.ast1 = new Asteroid ({pos: [100, 100], game: window.game });\n  // window.ast2 = new Asteroid({ pos: [140, 140], game: window.game, color: \"#4b8d6c\" });\n  // window.ast1.draw(window.ctx);\n  // window.ast2.draw(window.ctx);\n  // console.log(ast1.isCollidedWith(ast2))\n  window.gview.start();\n})\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Utils = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.beginPath();\n  ctx.arc(...this.pos, this.radius, 0, Math.PI * 2);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n  let newPos = [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];\n  this.pos = this.game.wrap(newPos);\n}\n\nMovingObject.prototype.isCollidedWith = function (otherObject) {\n  let distBetween = Utils.dist(this.pos, otherObject.pos);\n  let sumOfRadii = this.radius + otherObject.radius;\n  return sumOfRadii > distBetween; \n}\n\nMovingObject.prototype.collideWith = function (otherObject) {\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__(/*! ./bullet */ \"./src/bullet.js\");\n\nfunction Ship(options) {\n  options = options || {};\n  options.color = options.color || DEFAULTS.COLOR;\n  options.radius = options.radius || DEFAULTS.RADIUS;\n  options.pos = options.pos;\n  options.vel = [0, 0];\n  options.game = options.game;\n\n  MovingObject.call(this, options);\n}\nUtils.inherits(Ship, MovingObject)\n\nconst DEFAULTS = {\n  COLOR: \"#4e85b0\",\n  RADIUS: 10\n}\n\nShip.prototype.relocate = function () {\n  console.log(\"Relocating...\");\n  this.pos = this.game.randomPosition();\n  this.vel = [0, 0];\n}\n\nShip.prototype.power = function (impulse) {\n  this.vel = [(this.vel[0] + impulse[0]), (this.vel[1] + impulse[1])];\n}\n\nShip.prototype.fireBullet = function () {\n  \n  const shipVel = this.vel;\n  function bulletVel() {\n    let newVel = [0, 0]\n    if (shipVel[0] > 0) {\n      newVel[0] = Math.max(8, (shipVel[0] * 1.5) );\n    } else if (shipVel[0] < 0) {\n      newVel[0] = Math.min(-8, (shipVel[0] * 1.5));\n    }\n    if (shipVel[1] > 0) {\n      newVel[1] = Math.max(8, (shipVel[1] * 1.5) );\n    } else if (shipVel[1] < 0) {\n      newVel[1] = Math.min(-8, (shipVel[1] * 1.5));\n    }\n    return newVel;\n  }\n  const bulletOptions = {\n    pos: this.pos,\n    vel: bulletVel(),\n    game: this.game\n  }\n  const bullet = new Bullet (bulletOptions);\n  this.game.addBullet(bullet);\n}\n\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    childClass.prototype = Object.create(parentClass.prototype);\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  scale(vec, scaleAmount) {\n    return [vec[0] * scaleAmount, vec[1] * scaleAmount]\n  },\n  dist(point1, point2) {\n    return Math.sqrt(((point1[0] - point2[0]) ** 2) + ((point1[1] - point2[1]) ** 2))\n  }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });