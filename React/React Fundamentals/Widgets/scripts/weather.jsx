import React from "react";

class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      location: null,
      weather: null,
      displayLocation: null,
      currentLocation: true,
      searchString: ""
    };
    this.updateLocation = this.updateLocation.bind(this);
    this.getWeather = this.getWeather.bind(this);
    this.getCurrentPosition = this.getCurrentPosition.bind(this);
    this.apiKey = "77a44e14550c384216a2bea5c7672597";
    this.geogAPICall = this.geogAPICall.bind(this);
    this.searchAPICall = this.searchAPICall.bind(this);
    this.setSearchString = this.setSearchString.bind(this);
    this.submitSearch = this.submitSearch.bind(this);
  }

  componentDidMount() {
    this.getCurrentPosition();
  }

  getCurrentPosition() {
    navigator.geolocation.getCurrentPosition(this.updateLocation);
  }

  getWeather() {
    const location = this.state.location;
    if (typeof location === "object") {
      this.requestWeatherXML(this.geogAPICall());
    } else if (typeof location === "string") {
      this.requestWeatherXML(this.searchAPICall(location));
    }
  }

  geogAPICall() {
    return `http://api.openweathermap.org/data/2.5/weather?lat=${this.state.location.latitude}&lon=${this.state.location.longitude}&units=metric&appid=${this.apiKey}`;
  }

  searchAPICall() {
    return `http://api.openweathermap.org/data/2.5/weather?q=${this.state.searchString}&units=metric&appid=${this.apiKey}`;
  }

  updateLocation(position) {
    if (typeof position === "object") {
      this.setState(
        { location: position.coords, currentLocation: true },
        this.getWeather
      );
    } else if (typeof position === "string") {
      this.setState(
        { location: position, currentLocation: false },
        this.getWeather
      );
    }
  }

  requestWeatherXML(callURL) {
    const request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState === XMLHttpRequest.DONE) {
        if (request.status === 200) {
          const response = JSON.parse(request.response);
          this.setState({
            weather: response,
            displayLocation: `${response["name"]}, ${response.sys.country}`,
            searchString: ""
          });
        } else if (request.readyState === 400) {
          alert("There was an error 400");
        } else {
          alert("Something other than 200 was returned...");
        }
      }
    }.bind(this);
    request.open("GET", callURL, true);
    request.send();
  }

  setSearchString(e) {
    e.preventDefault();
    if (e.currentTarget.value) {
      this.setState({ searchString: e.currentTarget.value });
    } else {
      this.setState({ searchString: "" });
    }
  }

  submitSearch(e) {
    e.preventDefault();
    this.updateLocation(this.state.searchString);
  }

  render() {
    const {
      displayLocation,
      currentLocation,
      weather,
      location,
      searchString
    } = this.state;
    console.log(weather);
    return (
      <div className="widget-container">
        <h2>Weather</h2>
        <div className="weather-widget widget">
          {location ? (
            <header className="weather-widget-title-row">
              <p>
                {currentLocation
                  ? "Your current location is... "
                  : "This is the weather in... "}
              </p>
              <h3>{displayLocation}</h3>
            </header>
          ) : (
            <header className="weather-widget-title-row">
              <p>Fetching location...</p>
            </header>
          )}
          <section className="weather-search">
            <form onSubmit={this.submitSearch}>
              <input
                type="text"
                placeholder="Enter a city or town here..."
                value={searchString}
                onChange={this.setSearchString}
              ></input>
              <button type="submit">Search</button>
              <button type="button" onClick={this.getCurrentPosition}>
                Find My Location
              </button>
            </form>
          </section>
          {weather && (
            <main className="weather-widget-content">
              <div className="weather-temps">
                <h4>Temperatures</h4>
                <section className="weather-current-temp">
                  <span>Now:</span>
                  <span>{weather.main.temp}°C</span>
                </section>
                <section className="weather-feels-temp">
                  <span>Feels Like:</span>
                  <span>{weather.main.feels_like}°C</span>
                </section>
              </div>
              <div className="weather-conditions">
                <h4>Conditions</h4>
                <section className="weather-headline-conditions">
                  <span>{weather.weather[0].main}, </span>
                  <span>{weather.weather[0].description}</span>
                </section>
                <section className="weather-wind-speed">
                  <span>Windspeed:</span>
                  <span>{weather.wind.speed}m/s</span>
                </section>
                <section className="weather-humidity">
                  <span>Humidity:</span>
                  <span>{weather.main.humidity}%</span>
                </section>
              </div>
            </main>
          )}
        </div>
      </div>
    );
  }
}

export default Weather;
