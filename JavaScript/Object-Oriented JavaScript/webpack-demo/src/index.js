function component() {
  const element = document.createElement('div');

  //[From tutorial] Lodash, currently loaded via a script, is required for this line to work
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());