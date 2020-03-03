import React from "react";
import TodoListContainer from "./todos/todo_list_container";

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Todos!</h1>
        <TodoListContainer />
      </div>
    );
  }
}

export default App;
