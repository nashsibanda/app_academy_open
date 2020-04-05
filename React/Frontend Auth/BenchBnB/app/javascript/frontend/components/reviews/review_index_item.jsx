import React from "react";

class ReviewIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { comment, rating } = this.props.review;
    return (
      <li className="review-index-item">
        <p>Comment: {comment}</p>
        <p>Rating: {rating}</p>
      </li>
    );
  }
}

export default ReviewIndexItem;
