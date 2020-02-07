document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addPlace = (e) => {
    e.preventDefault();
    const placeInputEl = document.querySelector(".favorite-input");
    const newPlace = placeInputEl.value;
    placeInputEl.value = "";

    const placeList = document.getElementById("sf-places");
    const placeLi = document.createElement("li");
    placeLi.textContent = newPlace;
    placeList.appendChild(placeLi);
  }

  document.querySelector(".list-container form").addEventListener("submit", addPlace);
  // adding new photos

  const togglePuppyForm = (e) => {
    const form = document.querySelector(".photo-form-container");
    if (form.classList.contains("hidden")) {
      form.classList.remove("hidden");
    } else {
      form.classList.add("hidden");
    }
  }

  const addPuppy = (e) => {
    e.preventDefault();
    const newPuppyInput = document.querySelector(".photo-url-input");
    const newPuppyUrl = newPuppyInput.value;
    newPuppyInput.value = "";
    
    const puppyList = document.querySelector(".dog-photos");
    const newPuppyImg = document.createElement("img");
    newPuppyImg.setAttribute("src", newPuppyUrl);
    const newPuppyLi = document.createElement("li");
    newPuppyLi.appendChild(newPuppyImg);
    puppyList.appendChild(newPuppyLi);
  }

  document.querySelector(".photo-show-button").addEventListener("click", togglePuppyForm);
  document.querySelector(".photo-form-container form").addEventListener("submit", addPuppy);
});
