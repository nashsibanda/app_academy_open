import React from "react";

class ReviewIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { comment, rating, username } = this.props.review;
    return (
      <li className="review-index-item">
        <p>Comment: {comment}</p>
        <p>Rating: {rating}</p>
        <p>Posted by: {username}</p>
      </li>
    );
  }
}

export default ReviewIndexItem;
