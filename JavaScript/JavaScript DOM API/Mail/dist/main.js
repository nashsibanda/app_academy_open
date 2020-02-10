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
/***/ (function(module, exports, __webpack_require__) {

eval("const MessageStore = __webpack_require__(/*! ./message_store */ \"./src/message_store.js\");\n\nconst Inbox = {\n  render () {\n    const container = document.createElement(\"ul\");\n    container.className = \"messages\";\n    const messages = MessageStore.getInboxMessages();\n    messages.forEach(message => {\n      const messageNode = this.renderMessage(message);\n      container.appendChild(messageNode);\n    })\n    return container;\n  },\n  renderMessage(message) {\n    const liNode = document.createElement(\"li\");\n    liNode.className = \"message\";\n    liNode.innerHTML = `\n      <span class=\"from\">${message.from}</span>\n      <span class=\"subject\">${message.subject}</span>\n      <span class=\"body\">${message.body}</span>\n    `\n    return liNode;\n  }\n}\n\nmodule.exports = Inbox;\n\n//# sourceURL=webpack:///./src/inbox.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Router = __webpack_require__(/*! ./router */ \"./src/router.js\");\nconst Inbox = __webpack_require__(/*! ./inbox */ \"./src/inbox.js\");\nconst Sent = __webpack_require__(/*! ./sent */ \"./src/sent.js\")\n\nfunction setHashFragment (event) {\n  const target = event.currentTarget;\n  const locVar = target.innerText.toLowerCase();\n  window.location.hash = locVar;\n}\n\nfunction addSidebarLiListeners () {\n  const liElements = document.querySelectorAll(\".sidebar-nav li\");\n  liElements.forEach(element => {\n    element.addEventListener(\"click\", setHashFragment);\n  })\n}\n\nfunction onLoadCallback () {\n  contentNode = document.querySelector(\".content\")\n  window.router = new Router(contentNode, routes);\n  addSidebarLiListeners();\n  window.router.start();\n  window.location.hash = \"#inbox\";\n}\n\ndocument.addEventListener(\"DOMContentLoaded\", onLoadCallback);\n\nconst routes = {\n  // \"compose\": ,\n  \"sent\": Sent,\n  \"inbox\": Inbox\n}\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/message_store.js":
/*!******************************!*\
  !*** ./src/message_store.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("let messages = {\n  sent: [\n    {\n      to: \"friend@mail.com\",\n      subject: \"Check this out\",\n      body: \"It's so cool\"\n    },\n    { to: \"person@mail.com\", subject: \"zzz\", body: \"so booring\" }\n  ],\n  inbox: [\n    {\n      from: \"grandma@mail.com\",\n      subject: \"Fwd: Fwd: Fwd: Check this out\",\n      body:\n        \"Stay at home mom discovers cure for leg cramps. Doctors hate her\"\n    },\n    {\n      from: \"person@mail.com\",\n      subject: \"Questionnaire\",\n      body: \"Take this free quiz win $1000 dollars\"\n    }\n  ]\n};\n\nconst MessageStore = {\n  getInboxMessages() {\n    return messages.inbox;\n  },\n  getSentMessages() {\n    return messages.sent;\n  }\n}\n\nmodule.exports = MessageStore;\n\n//# sourceURL=webpack:///./src/message_store.js?");

/***/ }),

/***/ "./src/router.js":
/*!***********************!*\
  !*** ./src/router.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Router {\n  constructor(node, routes) {\n    this.node = node;\n    this.routes = routes;\n  }\n\n  start () {\n    this.render();\n    window.addEventListener(\"hashchange\", this.render.bind(this));\n  }\n\n  render () {\n    console.log(\"change!\");\n    // this.node.innerHTML = \"\";\n    const component = this.activeRoute();\n    if (!component) {\n      this.node.innerHTML = \"\";\n    } else {\n      this.node.innerHTML = \"\";\n      const newNode = component.render()\n      this.node.appendChild(newNode);\n    }\n    // const newPNode = document.createElement(\"p\");\n    // newPNode.innerHTML = newRouteName;\n  }\n\n  activeRoute () {\n    const routeHashFragment = window.location.hash.slice(1);\n    return this.routes[routeHashFragment];\n  }\n }\n\nmodule.exports = Router;\n\n//# sourceURL=webpack:///./src/router.js?");

/***/ }),

/***/ "./src/sent.js":
/*!*********************!*\
  !*** ./src/sent.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MessageStore = __webpack_require__(/*! ./message_store */ \"./src/message_store.js\");\n\nconst Sent = {\n  render() {\n    const container = document.createElement(\"ul\");\n    container.className = \"messages\";\n    const messages = MessageStore.getSentMessages();\n    messages.forEach(message => {\n      const messageNode = this.renderMessage(message);\n      container.appendChild(messageNode);\n    });\n    return container;\n  },\n  renderMessage(message) {\n    const liNode = document.createElement(\"li\");\n    liNode.className = \"message\";\n    liNode.innerHTML = `\n      <span class=\"to\">${message.to}</span>\n      <span class=\"subject\">${message.subject}</span>\n      <span class=\"body\">${message.body}</span>\n    `;\n    return liNode;\n  }\n};\n\nmodule.exports = Sent;\n\n\n//# sourceURL=webpack:///./src/sent.js?");

/***/ })

/******/ });