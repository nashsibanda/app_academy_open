import React from "react";

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { todo, key } = this.props;
    return <li key={key}>{todo.title}</li>;
  }
}

export default TodoListItem;
