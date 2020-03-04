import React from "react";

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { todo } = this.props;
    return (
      <ul className="todo-details">
        <li>
          <span className="todo-details-label">Body:</span> {todo.body}
        </li>
        <li>
          <span className="todo-details-label">Status:</span>{" "}
          {todo.done ? "Completed" : "Not Completed"}
        </li>
      </ul>
    );
  }
}

export default TodoDetailView;
