import React from "react";

import GiphysIndex from "./giphys_index";

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { currentSearchTerm: "" };
    this.updateSearchTerm = this.updateSearchTerm.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  updateSearchTerm(e) {
    e.preventDefault();
    this.setState({ currentSearchTerm: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.currentSearchTerm);
  }

  render() {
    const { currentSearchTerm } = this.state;
    return (
      <div className="giphys-search-container">
        <h1>Search for Giphys!</h1>
        <form className="giphys-search-form" onSubmit={this.handleSubmit}>
          <input
            type="text"
            onChange={this.updateSearchTerm}
            value={currentSearchTerm}
            placeholder="Enter a search term..."
          ></input>
          <button type="submit"></button>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
