var colorArray = [];
var fullCanvasArray = [];
var saveRowArray = [];
var pointerColor = "white";
var req = new XMLHttpRequest;

function setPointerColor() {
  pointerColor = this.className;
};

function setCanvasColor() {
  var classNames = this.className.substring(0, 10);
  this.className = classNames + pointerColor;
};

window.onload = function() {
  fullCanvasArray = document.getElementsByClassName("box")
  
  // Save button functionality...  It's a monster.
  var save_button = document.getElementById("save-button")
  save_button.addEventListener("click", function(e) {
    e.preventDefault();
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
        console.log(position)
        saveRowArray.push(fullCanvasArray[position].className.slice(10));
      };
      var rowNumber = "row_" + (i + 1).toString();
      var saveString = saveRowArray.join();
      formData.append(rowNumber, saveString);
      saveRowArray = []
    };
    req.open("post", "http://localhost:4567/mondrian");
    req.send(formData);
  });
  
  // Load button functionality
  var load_button = document.getElementById("load-button");
  load_button.addEventListener("click", function(e) {
    e.preventDefault();
    var load_value = document.getElementById("load-value").value;
    req.addEventListener("load", function() {
      var canvas_div = document.getElementsByClassName("canvas")[0];
      canvas_div.innerHTML = req.response;
    });
    var url = "http://localhost:4567/mondrian/" + load_value.toString();
    req.open("post", url);
    req.send();
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