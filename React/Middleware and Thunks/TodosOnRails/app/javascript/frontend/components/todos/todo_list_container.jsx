import { connect } from "react-redux";
import {
  fetchTodos,
  createTodo,
  updateTodo,
  deleteTodo
} from "../../actions/todo_actions";
import { allTodos } from "../../reducers/selectors";
import TodoList from "./todo_list";
import { clearErrors } from "../../actions/error_actions";

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors,
  state
});

const mapDispatchToProps = dispatch => ({
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo)),
  deleteTodo: todo => dispatch(deleteTodo(todo)),
  clearErrors: () => dispatch(clearErrors())
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
