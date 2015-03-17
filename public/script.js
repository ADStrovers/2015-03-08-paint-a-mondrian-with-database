var colorArray = [];
var fullCanvasArray = [];
var saveRowArray = [];
var pointerColor = "color-1";

function setPointerColor() {
  pointerColor = this.className;
};

function setCanvasColor() {
  var classNamesMinusColor = this.className.length - 7;
  var classNames = this.className.substring(0, classNamesMinusColor);
  this.className = classNames + pointerColor;
};

window.onload = function() {
  fullCanvasArray = document.getElementsByClassName("box")
  
  // Save button functionality...  It's a monster.
  var save_button = document.getElementById("save-button")
  var req = new XMLHttpRequest;
  save_button.addEventListener("click", function(e) {
    e.preventDefault();
    req.open("post", "mondrian");
    var formData = new FormData();
    req.addEventListener("load", function() {
      var save_div = document.getElementsByClassName("save-output")[0]
      save_div.innerHTML = req.response
    });
    var rowDivList = []
    var rowNodeList = document.getElementsByClassName("canvas")[0].childNodes;
    for (i = 0; i < rowNodeList.length; i++) {
      if (rowNodeList[i].tagName === "DIV") {
        rowDivList.push(rowNodeList[i]);
      };
    };
    var numberOfRows = rowDivList.length;
    var numberOfColumns = fullCanvasArray.length / numberOfRows;
    for (i = 0; i < numberOfRows; i++) {
      for (x = 0; x < numberOfColumns; x++) {
        var position = i * numberOfColumns + x;
        saveRowArray.push(fullCanvasArray[position].className.slice(10));
      };
      var rowNumber = "row_" + (i + 1).toString();
      var saveString = saveRowArray.join();
      formData.append(rowNumber, saveString);
      saveRowArray = []
    };
    req.send(formData);
  });
  
  // Load button functionality
  var load_button = document.getElementById("load-button");
  var req2 = new XMLHttpRequest;
  load_button.addEventListener("click", function(e) {
    e.preventDefault();
    var load_value = document.getElementById("load-value").value;
    req2.addEventListener("load", function() {
      var canvas_div = document.getElementsByClassName("canvas")[0];
      canvas_div.innerHTML = req2.response;
    });
    var url = "mondrian/" + load_value.toString();
    req2.open("post", url);
    req2.send();
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
  
  for (i = 0; i < fullCanvasArray.length; i++) {
    fullCanvasArray[i].addEventListener("click", setCanvasColor);
  };
};