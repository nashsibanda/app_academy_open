import React from "react";

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchString: "" };
    this.updateSearchString = this.updateSearchString.bind(this);
    this.selectName = this.selectName.bind(this);
  }

  updateSearchString(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      this.setState({ searchString: e.currentTarget.value });
    } else {
      this.setState({ searchString: "" });
    }
  }

  selectName(e) {
    e.preventDefault();
    this.setState({ searchString: e.currentTarget.innerHTML });
  }

  render() {
    // console.log(this.state.searchString);
    const list = this.props;
    const indices = Object.keys(list);
    const { searchString } = this.state;
    const searchLen = searchString.length;
    return (
      <div className="widget-container">
        <h2>AutoComplete</h2>
        <div className="autocomplete-widget widget">
          <input
            type="text"
            placeholder="Search this list..."
            onChange={this.updateSearchString}
            value={searchString}
          ></input>
          <div className="autocomplete-list">
            <ul>
              {indices.map(index => {
                return (
                  <li
                    key={[index]}
                    className={
                      list[index].slice(0, searchLen).toLowerCase() ===
                      searchString.toLowerCase()
                        ? "valid"
                        : "invalid"
                    }
                    onClick={this.selectName}
                  >
                    {list[index]}
                  </li>
                );
              }, this)}
              {/* <li>
                {list[0].slice(0, searchLen).toLowerCase() === searchString
                  ? "true"
                  : "false"}
              </li> */}
            </ul>
          </div>
        </div>
      </div>
    );
  }
}

export default Autocomplete;
