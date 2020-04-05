import React from "react";

class FilterForm extends React.Component {
  constructor(props) {
    super(props);
    this.updateFilter = this.updateFilterValue.bind(this);
  }

  updateFilterValue(property) {
    return e => {
      this.props.updateFilter(property, parseInt(e.target.value));
    };
  }

  render() {
    return (
      <form className="filter-form">
        <input
          type="number"
          placeholder="Minimum seats..."
          onChange={this.updateFilterValue("minSeating")}
        ></input>
        <input
          type="number"
          placeholder="Maximum seats..."
          onChange={this.updateFilterValue("maxSeating")}
        ></input>
      </form>
    );
  }
}

export default FilterForm;
