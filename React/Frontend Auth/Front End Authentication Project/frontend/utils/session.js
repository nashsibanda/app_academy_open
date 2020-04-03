export const postUser = user =>
  $.ajax({
    type: "post",
    url: "/api/users",
    data: { user }
  });

export const postSession = user =>
  $.ajax({
    type: "post",
    url: "/api/session",
    data: { user }
  });

export const deleteSession = () =>
  $.ajax({
    type: "delete",
    url: "/api/session"
  });
