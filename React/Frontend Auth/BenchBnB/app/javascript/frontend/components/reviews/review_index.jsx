import React from "react";
import ReviewIndexItem from "./review_index_item";

class ReviewIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    console.log(`benchId = ` + this.props.benchId);
    this.props.fetchReviews("benches", this.props.benchId);
  }

  componentWillUnmount() {
    this.props.clearReviews();
  }

  render() {
    const { reviews } = this.props;
    return (
      <ul className="reviews-index">
        {Object.keys(reviews).map(reviewId => {
          return <ReviewIndexItem review={reviews[reviewId]} key={reviewId} />;
        })}
      </ul>
    );
  }
}

export default ReviewIndex;
