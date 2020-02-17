import React from "react";
import { CSSTransitionGroup } from "react-transition-group";

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
              <CSSTransitionGroup
                transitionName="list"
                transitionEnterTimeout={500}
                transitionLeaveTimeout={500}
              >
                {indices.map(index => {
                  return (
                    list[index].slice(0, searchLen).toLowerCase() ===
                      searchString.toLowerCase() && (
                      <li key={[index]} onClick={this.selectName}>
                        {list[index]}
                      </li>
                    )
                  );
                }, this)}
              </CSSTransitionGroup>
            </ul>
          </div>
        </div>
      </div>
    );
  }
}

export default Autocomplete;
