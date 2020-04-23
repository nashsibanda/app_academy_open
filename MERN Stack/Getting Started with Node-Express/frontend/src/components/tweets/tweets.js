import React from "react";
import TweetBox from "./tweet_box";
import { withRouter } from "react-router-dom";

class Tweets extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      tweets: [],
    };
  }

  componentDidMount() {
    this.props.fetchTweets();
  }

  componentDidUpdate(prevProps) {
    if (prevProps.tweets !== this.state.tweets) {
      this.setState({ tweets: this.props.tweets });
    }
  }

  render() {
    const { tweets } = this.state;
    if (tweets.length === 0) {
      return <div>There are no tweets</div>;
    } else {
      return (
        <div>
          <h2>
            {tweets.map(tweet => (
              <TweetBox key={tweet._id} text={tweet.text} />
            ))}
          </h2>
        </div>
      );
    }
  }
}

export default withRouter(Tweets);
