window.$1 = (argument) => {
  const nodeList = document.querySelectorAll(argument);
  return Array.from(nodeList);
}