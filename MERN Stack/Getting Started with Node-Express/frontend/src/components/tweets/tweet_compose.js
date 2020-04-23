import React, { Component } from "react";
import TweetBox from "./tweet_box";

export default class TweetCompose extends Component {
  constructor(props) {
    super(props);

    this.state = {
      text: "",
      newTweet: "",
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidUpdate(prevProps) {
    if (prevProps.newTweet !== this.props.newTweet) {
      this.setState({ newTweet: this.props.newTweet });
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    let tweet = {
      text: this.state.text,
    };

    this.props.composeTweet(tweet);
    this.setState({ text: "" });
  }

  update(e) {
    this.setState({ text: e.currentTarget.value });
  }

  render() {
    const { text, newTweet } = this.state;
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <div>
            <input
              type="text"
              value={text}
              onChange={this.update}
              placeholder="Write your tweet..."
            />
            <input type="submit" value="Submit" />
          </div>
        </form>
        <br />
        <TweetBox text={newTweet} />
      </div>
    );
  }
}
