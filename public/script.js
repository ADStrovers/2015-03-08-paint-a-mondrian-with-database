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
  
  var save_button = document.getElementById("save-button")
  save_button.addEventListener("click", function(e) {
    e.preventDefault();
    var formData = new FormData();
    req.addEventListener("load", function() {
      var save_div = document.getElementsByClassName("save-output")[0]
      save_div.innerHTML = req.response
    });
    var columnDivList = []
    var columnNodeList = document.getElementsByClassName("canvas")[0].childNodes;
    for (i = 0; i < columnNodeList.length; i++) {
      if (columnNodeList[i].tagName === "DIV") {
        columnDivList.push(columnNodeList[i]);
      };
    };
    var numberOfRows = columnDivList.length;
    var numberOfColumns = fullCanvasArray.length / numberOfRows;
    for (i = 0; i < numberOfRows; i++) {
      for (x = 0; x < numberOfColumns; x++) {
        var position = i * numberOfRows + x;
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