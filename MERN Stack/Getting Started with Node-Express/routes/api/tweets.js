const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
const passport = require("passport");

const Tweet = require("../../models/Tweet");
const validateTweetInput = require("../../validation/tweets");

router.get("/test", (req, res) =>
  res.json({ msg: "This is the tweets route" })
);

router.get("/", (req, res) => {
  Tweet.find()
    .sort({ date: -1 })
    .then(tweets => res.json(tweets))
    .catch(err => res.status(404).json({ notweetsfound: "No tweets found" }));
});

router.get("/user/:user_id", (req, res) => {
  Tweet.find({ user: req.params.user_id })
    .then(tweets => res.json(tweets))
    .catch(err =>
      res.status(404).json({ notweetsfound: "No tweets found from that user" })
    );
});

router.get("/:id", (req, res) => {
  Tweet.findById(req.params.id)
    .then(tweet => res.json(tweet))
    .catch(err =>
      res.status(404).json({ notweetsfound: "No tweet found with that ID" })
    );
});

router.post(
  "/",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    const { errors, isValid } = validateTweetInput(req.body);

    if (!isValid) {
      return res.status(400).json(errors);
    }

    const newTweet = new Tweet({
      text: req.body.text,
      userId: req.user.id,
    });

    newTweet.save().then(tweet => res.json(tweet));
  }
);

router.delete(
  "/:id",
  passport.authenticate("jwt", { session: false }),
  (req, res) => {
    Tweet.findById(req.params.id)
      .then(tweet => {
        if (tweet.userId != req.user.id) {
          return res.status(403).json({
            notallowed: "You are not authorised to perform this action",
          });
        } else {
          tweet.delete().then(tweet => res.json(tweet));
        }
      })
      .catch(err => res.status(404).json({ tweetnotfound: "Tweet not found" }));
  }
);

module.exports = router;
