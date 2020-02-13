import React from 'react';
import ReactDOM from 'react-dom';
import HelloWorld from './hello_world';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<HelloWorld/>, root);
});
