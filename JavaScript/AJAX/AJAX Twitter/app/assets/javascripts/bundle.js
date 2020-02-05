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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => (
    $.ajax({
      type: "POST",
      url: `/users/${id}/follow`,
      dataType: "json",
      success(response) {
        console.log("Now followed!")
      }
    })
  ),
  unfollowUser: id => (
    $.ajax({
      type: "DELETE",
      url: `/users/${id}/follow`,
      dataType: "json",
      success(response) {
        console.log("Now unfollowed!")
      }
    })
  ),
  searchUsers: query => (
    $.ajax({
      type: "GET",
      url: "/users/search",
      dataType: "json",
      data: {query},
      success(response) {
        console.log("Searched!")
      }
    })
  ),
  createTweet: data => (
    $.ajax({
      type: "POST",
      url: "/tweets",
      dataType: "json",
      data: data,
      success(response) {
        console.log("Tweet posted!")
      }
    })
  )
}

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    switch (this.followState) {
      case "unfollowed":
        this.$el.text("Follow!");
        this.$el.prop("disabled", false);
        break;
      case "followed":
        this.$el.text("Unfollow!");
        this.$el.prop("disabled", false);
        break;
      case "following":
        this.$el.text("Following...");
        this.$el.prop("disabled", true);
        break;
      case "unfollowing":
        this.$el.text("Unfollowing...");
        this.$el.prop("disabled", true);
        break;
    }
  }

  handleClick() {
    const followToggle = this;
    event.preventDefault();
    if (followToggle.followState === "followed") {
      followToggle.followState = "unfollowing";
      followToggle.render();
      APIUtil.unfollowUser(followToggle.userId).then( () => {
        followToggle.followState = "unfollowed";
        followToggle.render();
      })
    } else if (followToggle.followState === "unfollowed") {
      followToggle.followState = "following";
      followToggle.render();
      APIUtil.followUser(followToggle.userId).then( () => {
        followToggle.followState = "followed";
        followToggle.render();
      })
    };
  }

  toggleFollowState() {
    if (this.followState === "followed") {
      this.followState = "unfollowed";
    } else {
      this.followState = "followed";
    };
  }
}

module.exports = FollowToggle;

/***/ }),

/***/ "./frontend/tweet-compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet-compose.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class TweetCompose {
  constructor(el) {
    this.$el = $(el);
    this.$el.on("submit", this.submitHandler.bind(this));
    this.$el.on("input", "textarea", this.charsLeft.bind(this));
    this.$el.on("click", ".new-mention-select-btn", this.newUserSelect.bind(this));
    this.$el.on("click", "a.remove-mentioned-user", this.removeMentionedUser.bind(this));
    this.$tweetsUl = $(this.$el.data("tweets-ul"));
  }

  submitHandler() {
    event.preventDefault();
    const tweetCompose = this;
    let formData = tweetCompose.$el.serializeJSON();
    tweetCompose.$el.find(":input").prop("disabled", true);
    tweetCompose.$el.find(".form-button").val("Posting...");
    APIUtil.createTweet(formData).then( (response) => {
      tweetCompose.handleSuccess(response);
      console.log(response);
    });
  }

  clearInput() {
    this.$el.find("textarea").val("");
    this.$el.find(".mentions-select-list").empty();
  }

  handleSuccess(response) {
    this.clearInput();
    this.$el.find(":input").prop("disabled", false);
    this.$el.find(".form-button").val("Post Tweet!");
    let $successMessage = $("<div>");
    $successMessage.text("Tweet successfully posted!");
    $successMessage.addClass("tweet-post-success-message");
    this.$el.append($successMessage);
    let $newTweet = $("<li>");
    let tweetContent = JSON.stringify(response);
    $newTweet.append(tweetContent);
    this.$tweetsUl.prepend($newTweet);
    setTimeout(() => {
      $(".tweet-post-success-message").remove();
    }, 3000);
  }

  charsLeft() {
    let $charsLeft = $(event.currentTarget).find(".chars-left");
    let currentLength = $(event.currentTarget).find("textarea").val().length;
    let currentValue = 140 - currentLength;
    $charsLeft.text(currentValue);
    if (currentValue < 20) {
      $charsLeft.addClass("low-remaining-characters")
    } else if (currentValue >= 20) {
      $charsLeft.removeClass("low-remaining-characters");
    }
  }

  newUserSelect() {
    const $mentionsList = this.$el.find(".mentions-select-list");
    let $newListItem = $("<li>");
    let $newSelect = $("<select>", {
      "class": "user-mention-select",
      "name": "tweet[mentioned_user_ids][]"
    });
    let $defaultOption = $("<option>", {
      "disabled": true,
      "selected": true,
      text: "Select a user to mention..."
    });
    $newSelect.append($defaultOption);
    for (let i = 0; i < window.users.length; i++) {
      const user = window.users[i];
      let $userOption = $("<option>", {
        "value": user.id,
        text: user.username
      });
      $newSelect.append($userOption);
    }
    let $selectRemover = $("<a>", {
      "href": "#",
      "class": "remove-mentioned-user form-button",
      text: "x"
    })
    $newListItem.append($newSelect, $selectRemover);
    $mentionsList.append($newListItem);
  }

  removeMentionedUser() {
    const $clickedRemover = $(event.target);
    $clickedRemover.parent().remove();
    return false;
  }
}

module.exports = TweetCompose;

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search */ "./frontend/users_search.js");
const TweetCompose = __webpack_require__(/*! ./tweet-compose */ "./frontend/tweet-compose.js")

$(() => {
  $(".follow-toggle").each(function() {
    new FollowToggle(this);
    console.log("Follow toggle called");
  })

  $(".users-search").each(function() {
    new UsersSearch(this);
    console.log("User search called");
  })

  $(".tweet-compose").each(function() {
    new TweetCompose(this);
    console.log("Tweet compose called")
  })
});

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find("input");
    this.$ul = this.$el.find(".users");
    this.$el.on("input", this.handleInput.bind(this));
  }

  handleInput() {
    const usersSearch = this;
    APIUtil.searchUsers(this.$input.val()).then( (response) => {
      usersSearch.renderResults(response)
    })
  }

  renderResults(response) {
    this.$ul.empty();
    const $usersSearchUl = this.$ul;
    response.forEach(function(element) {
      let $userListElement = $("<li>");
      let $userLink = $("<a>");
      let $userFollowButton = $("<button>");
      $userFollowButton.addClass("follow-toggle");
      let followToggleOptions = {
        followState: (element.followed ? "followed" : "unfollowed"),
        userId: element.id
      };
      new FollowToggle($userFollowButton, followToggleOptions);
      $userLink.attr("href", `/users/${element.id}`);
      $userLink.text(element.username);
      $userListElement.append($userLink, $userFollowButton);
      $usersSearchUl.append($userListElement);
    })
  }

}

module.exports = UsersSearch;

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map