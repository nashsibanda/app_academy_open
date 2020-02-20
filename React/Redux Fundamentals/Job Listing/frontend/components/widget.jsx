import React from "react";
import Job from "./job";
import { selectLocation } from "./../actions";
import ReactHtmlParser, {
  processNodes,
  convertNodeToElement,
  htmlparser2
} from "react-html-parser";

class Widget extends React.Component {
  constructor(props) {
    super(props);
    this.forceUpdate = this.forceUpdate.bind(this);

    // require this component to re-render whenever the store's state changes
    this.props.store.subscribe(this.forceUpdate);
    this.cities = ["San Francisco", "Seattle", "New York", "Austin", "Remote"];
    this.selectLocation = selectLocation.bind(this);
  }

  fetchJobListings(city) {
    $.ajax({
      crossDomain: true,
      dataType: "json",
      url: `https://github-jobs-proxy.appspot.com/positions?description=python&location=${city}`,
      type: "GET",
      success: function(resp) {
        // tell the store to update with the new location and jobs;
        // use the action creator 'selectLocation' to build the object to
        // be dispatched
        this.props.store.dispatch(this.selectLocation(city, resp));
      }.bind(this)
    });
  }

  render() {
    // get the store's current state and deconstruct it into 'jobs'
    // and 'city' variables
    const { city, jobs } = this.props.store.getState();
    const cityOptions = this.cities.map(city => (
      <button
        onClick={() => {
          this.fetchJobListings(city);
        }}
        key={city}
        className="job-option"
      >
        {city}
      </button>
    ));

    const jobListings = jobs.map(job => (
      <Job
        key={job.id}
        title={job.title}
        company={job.company}
        location={job.location}
        type={job.type}
        description={ReactHtmlParser(job.description)}
        info={job.url}
      />
    ));

    return (
      <div>
        <h1>Github JavaScript Job Listings</h1>
        <h3>City: {city}</h3>

        <div className="location-selector">
          Location:
          {cityOptions}
        </div>

        <h3>{jobListings.length} Job Listings</h3>
        <ol className="listings-list">{jobListings}</ol>
      </div>
    );
  }
}

export default Widget;
