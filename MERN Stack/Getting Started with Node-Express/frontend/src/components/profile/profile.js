import React, { Component } from "react";
import TweetBox from "../tweets/tweet_box";

export default class Profile extends Component {
  constructor(props) {
    super(props);

    this.state = {
      tweets: [],
    };
  }

  componentDidMount() {
    const { id } = this.props.currentUser;
    console.log(id);
    this.props.fetchUserTweets(id);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.tweets !== this.props.tweets) {
      this.setState({ tweets: this.props.tweets });
    }
  }

  render() {
    const { tweets } = this.state;
    if (tweets.length === 0) {
      return <div>This user has no tweets</div>;
    } else {
      return (
        <div>
          <h2>All of this user's tweets</h2>
          {tweets.map(tweet => (
            <TweetBox key={tweet._id} text={tweet.text} />
          ))}
        </div>
      );
    }
  }
}
