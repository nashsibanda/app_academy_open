const auth_token = decodeURIComponent(
  document.cookie.match("X-CSRF-Token=([^;]+)")[1]
);

const TodoApi = {
  fetchTodos: () =>
    $.ajax({
      type: "GET",
      url: "api/todos",
      dataType: "json",
      success(response) {
        console.log("Successfully run fetchTodos on load!");
      }
    }),
  createTodo: todo =>
    $.ajax({
      type: "POST",
      url: "api/todos",
      dataType: "json",
      data: todo,
      headers: {
        "X-CSRF-Token": auth_token
      },
      success(response) {
        console.log("Successfully posted a Todo with createTodo!");
      }
    }),
  updateTodo: todo => {
    $.ajax({
      type: "PATCH",
      url: `api/todos/${todo.id}`,
      data: todo,
      headers: {
        "X-CSRF-Token": auth_token
      },
      success(response) {
        console.log("Successfully updated a Todo with updateTodo!");
      }
    });
  }
};

export default TodoApi;
