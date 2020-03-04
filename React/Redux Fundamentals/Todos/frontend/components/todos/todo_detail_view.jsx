import React from "react";
import StepListContainer from "./../step_list/step_list_container";

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
        <li>
          <span className="todo-details-label">Steps:</span>
          <StepListContainer todo_id={todo.id} />
        </li>
      </ul>
    );
  }
}

export default TodoDetailView;
