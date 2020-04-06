import React from "react";
import ReviewIndexItem from "./review_index_item";
import { ProtectedRoute } from "../../util/route_util";
import ReviewFormContainer from "./review_form_container";

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
    const { reviews, benchId } = this.props;
    return (
      <div className="reviews-container">
        <ReviewFormContainer benchId={benchId} />
        <ul className="reviews-index-list">
          {Object.keys(reviews).map(reviewId => {
            return (
              <ReviewIndexItem review={reviews[reviewId]} key={reviewId} />
            );
          })}
        </ul>
      </div>
    );
  }
}

export default ReviewIndex;
