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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(elementArray) {\n    this.elementArray = elementArray;\n  }\n\n  html(string = null) {\n    if (string === null) {\n      return this.elementArray[0].innerHTML;\n    } else {\n      this.elementArray.forEach(element => {\n        element.innerHTML = string;\n      })\n    }\n  }\n\n  empty() {\n    this.elementArray.forEach(element => {\n      element.innerHTML = \"\";\n    })\n  }\n\n  append(child) {\n    if (child instanceof HTMLElement) {\n     this.elementArray.forEach(element => {\n       element.innerHTML = element.innerHTML + child.outerHTML;\n      });\n    } else if (typeof child === \"string\") {\n      this.elementArray.forEach(element => {\n        element.innerHTML = element.innerHTML + child;\n      });\n    } else if (typeof child.elementArray[Symbol.iterator] === \"function\") {\n      this.elementArray.forEach(element => {\n        child.elementArray.forEach(childElement => {\n          element.innerHTML = element.innerHTML + childElement.outerHTML;\n        });\n      })\n    }\n  }\n\n  attr(attribute, value = null) {\n    if (value === null) {\n      return this.elementArray[0].getAttribute(attribute);\n    } else {\n      this.elementArray.forEach(element => {\n        element.setAttribute(attribute, value);\n      })\n    }\n  }\n\n  addClass(className) {\n    this.elementArray.forEach(element => {\n      element.classList.add(className);\n    })\n  }\n\n  removeClass(className) {\n    this.elementArray.forEach(element => {\n      element.classList.remove(className);\n    })\n  }\n\n  // Traversal\n\n  children() {\n    const childrenArray = [];\n    this.elementArray.forEach(element => {\n      const elementChildren = Array.from(element.children);\n      childrenArray.push(...elementChildren);\n    })\n    return new DOMNodeCollection(childrenArray);\n  }\n\n  parent() {\n    const parentArray = [];\n    this.elementArray.forEach(element => {\n      if (!parentArray.includes(element.parentNode)) {\n        parentArray.push(element.parentNode);\n      }\n    });\n    return new DOMNodeCollection(parentArray);\n  }\n\n  find(selector) {\n    const subCollection = [];\n    this.elementArray.forEach(element => {\n      const subNodeCollection = Array.from(element.querySelectorAll(selector));\n      subCollection.push(...subNodeCollection);\n    })\n    return new DOMNodeCollection(subCollection);\n  }\n\n  remove() {\n    this.elementArray.forEach(element => {\n      element.outerHTML = \"\";\n    })\n  }\n\n  on(trigger, callback) {\n    this.elementArray.forEach(element => {\n      element.addEventListener(trigger, callback);\n      element[trigger + \"Callback\"] = callback;\n    })\n  }\n\n  off(trigger) {\n    this.elementArray.forEach(element => {\n      const callback = element[trigger + \"Callback\"];\n      if (callback) {\n        element.removeEventListener(trigger, callback);\n      }\n    })\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\nconst ReadyFunctions = [];\n\n\nwindow.$1 = (argument) => {\n  if (typeof argument === \"string\") {\n    const nodeList = document.querySelectorAll(argument);\n    const elementArray = Array.from(nodeList);\n    return new DOMNodeCollection(elementArray);\n  } else if (argument instanceof HTMLElement) {\n    const HTMLArray = [argument];\n    return new DOMNodeCollection(HTMLArray);\n  } else if (typeof argument === \"function\") {\n    ReadyFunctions.push(argument);\n  }\n}\n\nwindow.$1.extend = (...objects) => {\n  const outputObject = {};\n  objects.forEach(object => {\n    const objectKeys = Object.keys(object);\n    objectKeys.forEach(key => {\n      outputObject[key] = object[key];\n    })\n  })\n  return outputObject;\n}\n\nwindow.$1.ajax = (customOptions) => {\n  const defaults = {\n    url: window.location.href,\n    method: \"GET\",\n    data: \"\",\n    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',\n    success(data) {\n      console.log(\"Success!\");\n      console.log(data);\n    },\n    error() {\n      console.log(\"An error occurred!\");\n    }\n  }\n\n  const options = window.$1.extend(defaults, customOptions);\n\n  const request = new XMLHttpRequest;\n  request.open(options.method, options.url);\n  request.onload = function () {\n    options.success(JSON.parse(request.response));\n  };\n  request.send(options.data);\n}\n\nconst check = () => {\n  console.log(document.readyState);\n}\ncheck()\n\n$1(check)\n\n\nReadyFunctions.forEach(func => {\n  document.addEventListener(\"DOMContentLoaded\", func);\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });