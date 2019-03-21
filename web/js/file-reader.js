function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function() {
     var output= document.getElementById("file-img");
           output.style.backgroundImage= "url('"+reader.result+"')";
    }

    reader.readAsDataURL(input.files[0]);
  }
}

