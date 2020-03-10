const auth_token = decodeURIComponent(
  document.cookie.match("X-CSRF-Token=([^;]+)")[1]
);

const StepApi = {
  fetchSteps: todo_id =>
    $.ajax({
      type: "GET",
      url: `api/todos/${todo_id}/steps`,
      dataType: "json",
      success(response) {
        console.log("Successfully fetched Steps with fetchSteps");
      }
    })
};

export default StepApi;
