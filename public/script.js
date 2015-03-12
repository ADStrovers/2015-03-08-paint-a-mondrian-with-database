var colorArray = [];
var canvasArray = [];
var saveCanvasArray = []
var pointerColor = "white";
var req = new XMLHttpRequest

function setPointerColor() {
  pointerColor = this.className
}

function setCanvasColor() {
  var classNames = this.className.substring(0, 10)
  this.className = classNames + pointerColor;
}

window.onload = function() {
  canvasArray = document.getElementsByClassName("box")
  
  var save_button = document.getElementById("save-button")
  save_button.addEventListener("click", function(e) {
    e.preventDefault();
    req.addEventListener("load", function() {
      var save_div = document.getElementsByClassName("save-output")[0]
      save_div.innerHTML = req.response
    });
    for (i = 0; i < canvasArray.length; i++) {
      saveCanvasArray.push(canvasArray[i].className.slice(4));
    }
    var saveCanvasString = saveCanvasArray.join();
    var formData = new FormData();
    formData.append("saveString", saveCanvasString);
    req.open("post", "http://localhost:4567/mondrian");
    req.send(formData);
  });
  
  var childrenOfColors = document.getElementsByClassName("colors")[0].childNodes;
  for (i = 0; i < childrenOfColors.length; i++) {
    if (childrenOfColors[i].tagName === "DIV") {
      colorArray.push(childrenOfColors[i]);
    };
  };
  
  for (i = 0; i < colorArray.length; i++) {
    colorArray[i].addEventListener("click", setPointerColor);
  };
  
  for (i = 0; i < canvasArray.length; i++) {
    canvasArray[i].addEventListener("click", setCanvasColor);
  };
};