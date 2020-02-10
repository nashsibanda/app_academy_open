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

/***/ "./src/inbox.js":
/*!**********************!*\
  !*** ./src/inbox.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Inbox = {\n  render () {\n    const ulContainer = document.createElement(\"ul\");\n    ulContainer.className = \"messages\";\n    ulContainer.innerHTML = \"An Inbox Message\";\n    return ulContainer;\n  }\n}\n\nmodule.exports = Inbox;\n\n//# sourceURL=webpack:///./src/inbox.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Router = __webpack_require__(/*! ./router */ \"./src/router.js\");\nconst Inbox = __webpack_require__(/*! ./inbox */ \"./src/inbox.js\");\n\nfunction setHashFragment (event) {\n  const target = event.currentTarget;\n  const locVar = target.innerText.toLowerCase();\n  window.location.hash = locVar;\n}\n\nfunction addSidebarLiListeners () {\n  const liElements = document.querySelectorAll(\".sidebar-nav li\");\n  liElements.forEach(element => {\n    element.addEventListener(\"click\", setHashFragment);\n  })\n}\n\nfunction onLoadCallback () {\n  contentNode = document.querySelector(\".content\")\n  window.router = new Router(contentNode, routes);\n  addSidebarLiListeners();\n  window.router.start();\n}\n\ndocument.addEventListener(\"DOMContentLoaded\", onLoadCallback);\n\nconst routes = {\n  // \"compose\": ,\n  // \"sent\": ,\n  \"inbox\": Inbox\n}\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/router.js":
/*!***********************!*\
  !*** ./src/router.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Router {\n  constructor(node, routes) {\n    this.node = node;\n    this.routes = routes;\n  }\n\n  start () {\n    this.render();\n    window.addEventListener(\"hashchange\", this.render.bind(this));\n  }\n\n  render () {\n    console.log(\"change!\");\n    // this.node.innerHTML = \"\";\n    const component = this.activeRoute();\n    if (!component) {\n      this.node.innerHTML = \"\";\n    } else {\n      this.node.innerHTML = \"\";\n      const newNode = component.render()\n      this.node.appendChild(newNode);\n    }\n    // const newPNode = document.createElement(\"p\");\n    // newPNode.innerHTML = newRouteName;\n  }\n\n  activeRoute () {\n    const routeHashFragment = window.location.hash.slice(1);\n    return this.routes[routeHashFragment];\n  }\n }\n\nmodule.exports = Router;\n\n//# sourceURL=webpack:///./src/router.js?");

/***/ })

/******/ });