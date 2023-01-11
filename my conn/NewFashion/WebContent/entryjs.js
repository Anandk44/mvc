
function validateForm() {
  var x = document.forms["myForm"]["billno"].value;
  if (x == "" || x == null) {
    alert("Please Enter billno");
    return false;
  }
  }