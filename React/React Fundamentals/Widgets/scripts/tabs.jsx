import React from "react";

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = { selectedTab: 0 };
    this.chooseTab = this.chooseTab.bind(this);
  }

  chooseTab(index) {
    this.setState({ selectedTab: index });
  }

  render() {
    const tabs = this.props;
    const indices = Object.keys(tabs);
    return (
      <div className="widget-container">
        <h2>Tabs</h2>
        <div>
          <div className="tabs-widget">
            <ul className="tabs-widget-nav">
              {indices.map(function(num, index) {
                return (
                  <li
                    onClick={() => this.chooseTab(index)}
                    key={index}
                    className={
                      this.state.selectedTab === index ? "selected" : ""
                    }
                  >
                    {tabs[num].title}
                  </li>
                );
              }, this)}
            </ul>
            <article className="tabs-widget-content">
              <p>{this.props[this.state.selectedTab].content}</p>
            </article>
          </div>
        </div>
      </div>
    );
  }
}

export default Tabs;
