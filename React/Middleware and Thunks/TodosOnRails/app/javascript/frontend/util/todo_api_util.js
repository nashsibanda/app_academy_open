const TodoApi = {
  fetchTodos: () =>
    $.ajax({
      type: "GET",
      url: "api/todos",
      dataType: "json",
      success(response) {
        console.log("Successfully run fetchTodos!");
      }
    })
};

export default TodoApi;
