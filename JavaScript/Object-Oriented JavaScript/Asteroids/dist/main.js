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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\n\nconst DEFAULTS = {\n  COLOR: \"#554935\",\n  RADIUS: 30,\n  SPEED: 3\n}\n\nfunction Asteroid(options) {\n  options = options || {};\n  options.color = options.color || DEFAULTS.COLOR;\n  options.radius = DEFAULTS.RADIUS;\n  options.pos = options.pos;\n  options.vel = Utils.randomVec(DEFAULTS.SPEED);\n  options.game = options.game\n\n  MovingObject.call(this, options);\n}\n\nUtils.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game () {\n  this.asteroids = [];\n  this.ship = [];\n  this.bullets = [];\n  this.addAsteroids();\n}\n\nGame.DIM_X = 500;\nGame.DIM_Y = 500;\nGame.NUM_ASTEROIDS = 30;\n\nGame.prototype.addAsteroids = function () {\n  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n    let newAsteroid = new Asteroid( {\n      pos: this.randomPosition(),\n      game: this,\n    } )\n    this.asteroids.push(newAsteroid);\n  }\n}\n\nGame.prototype.randomPosition = function () {\n  let randX = Math.round(Math.random() * Game.DIM_X);\n  let randY = Math.round(Math.random() * Game.DIM_Y);\n  return [randX, randY]\n}\n\nGame.prototype.moveObjects = function () {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    const element = this.asteroids[i];\n    element.move();\n  }\n}\n\nGame.prototype.draw = function (ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  for (let i = 0; i < this.asteroids.length; i++) {\n    const element = this.asteroids[i];\n    element.draw(ctx);\n  }\n}\n\nGame.prototype.wrap = function (pos) {\n  let bleed = 30;\n  if (pos[0] < (0 - bleed)) {\n    return [(Game.DIM_X + bleed), pos[1]];\n  } else if (pos[1] < (0 - bleed)) {\n    return [pos[0], (Game.DIM_Y + bleed)];\n  } else if (pos[0] > (Game.DIM_X + bleed)) {\n    return [(0 - bleed), pos[1]];\n  } else if (pos[1] > (Game.DIM_Y + bleed)) {\n    return [pos[0], (0 - bleed)];\n  } else {\n    return pos;\n  }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(game, ctx) {\n  this.game = game;\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function () {\n  // let that = this;\n  const renderInterval = window.setInterval(this.render, 20);\n}\n\nGameView.prototype.render = function () {\n  console.log(\"Iterating...\")\n  this.game.moveObjects();\n  this.game.draw(this.ctx);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nwindow.GameView = GameView;\nwindow.Game = Game;\nwindow.Asteroid = Asteroid;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  window.ctx = document.getElementById('game-canvas').getContext(\"2d\");\n  window.game = new Game();\n  window.gview = new GameView(game, ctx);\n  window.ast1 = new Asteroid ({pos: [100, 100], game: window.game });\n  window.ast2 = new Asteroid({ pos: [140, 140], game: window.game, color: \"#4b8d6c\" });\n  window.ast1.draw(window.ctx);\n  window.ast2.draw(window.ctx);\n  console.log(ast1.isCollidedWith(ast2))\n  // window.gview.start();\n})\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Utils = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nfunction MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.beginPath();\n  ctx.arc(...this.pos, this.radius, 0, Math.PI * 2);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n  let newPos = [(this.pos[0] + this.vel[0]), (this.pos[1] + this.vel[1])];\n  this.pos = this.game.wrap(newPos);\n}\n\nMovingObject.prototype.isCollidedWith = function (otherObject) {\n  let distBetween = Utils.dist(this.pos, otherObject.pos);\n  let sumOfRadii = this.radius + otherObject.radius;\n  return sumOfRadii > distBetween; \n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

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