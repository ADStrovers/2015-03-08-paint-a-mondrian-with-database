var colorArray = [];
var canvasArray = [];
var pointerColor = "white";
var req = new XMLHttpRequest

function setPointerColor() {
  pointerColor = this.className
}

function setCanvasColor() {
  this.style.backgroundColor = pointerColor;
}

window.onload = function() {
  canvasArray = document.getElementsByClassName("box")
  
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