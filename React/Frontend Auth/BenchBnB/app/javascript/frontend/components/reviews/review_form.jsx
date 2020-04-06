import React from "react";

class ReviewForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      rating: 1,
      comment: "",
    };
    this.updateProperty = this.updateProperty.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateProperty(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    const { benchId, userId } = this.props;
    const formReview = {
      review: Object.assign({}, this.state, {
        api_bench_id: benchId,
        user_id: userId,
      }),
    };
    this.props.createReview(formReview);
  }

  render() {
    const { userId } = this.props;
    return (
      userId && (
        <form className="review-form" onSubmit={this.handleSubmit}>
          <h3>Leave a Review!</h3>
          <div>
            <label htmlFor="review-comment-input">Comment:</label>
            <textarea
              placeholder="comment"
              onChange={this.updateProperty("comment")}
              value={this.state.comment}
              id="review-comment-input"
            ></textarea>
          </div>
          <div>
            <label htmlFor="review-rating-input">Rating:</label>
            <input
              type="range"
              onChange={this.updateProperty("rating")}
              value={this.state.rating}
              min="1"
              max="5"
              id="review-rating-input"
            ></input>
            <span>{this.state.rating} / 5</span>
          </div>
          <div>
            <button type="submit">Add Review</button>
          </div>
        </form>
      )
    );
  }
}

export default ReviewForm;
