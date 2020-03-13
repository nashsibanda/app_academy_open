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
        // console.log("Successfully fetched Steps with fetchSteps!");
      }
    }),
  createStep: step =>
    $.ajax({
      type: "POST",
      url: `api/steps`,
      dataType: "json",
      data: step,
      headers: {
        "X-CSRF-Token": auth_token
      },
      success(response) {
        // console.log("Successfully added step using createStep!");
      }
    }),
  updateStep: step =>
    $.ajax({
      type: "PATCH",
      url: `api/steps/${step.step.id}`,
      dataType: "json",
      data: step,
      headers: {
        "X-CSRF-Token": auth_token
      },
      success(response) {
        // console.log("Successfully updated step using updateStep!");
      }
    }),
  deleteStep: step =>
    $.ajax({
      type: "DELETE",
      url: `api/steps/${step.id}`,
      dataType: "json",
      headers: {
        "X-CSRF-Token": auth_token
      },
      success(response) {
        // console.log("Successfully removed step with deleteStep!");
      }
    })
};

export default StepApi;
