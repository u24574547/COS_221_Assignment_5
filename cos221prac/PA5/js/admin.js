function element(id) {
  return document.getElementById(id);
}

function hide(id) {
  element(id).style.display = "none";
}

function show(id) {
  element(id).style.display = "block";
}

function message(id, text) {
  element(id).innerHTML = text;
}

function ajax(data, callback) {
  var req = new XMLHttpRequest();
  req.onreadystatechange = function () {
    if (req.readyState === 4 && req.status === 200) {
      console.log(req.responseText);

      var json = JSON.parse(req.responseText);
      callback(json);
    }
    else if(req.readyState === 4) console.log("Request Failed");
  };

  req.open("POST", "../api.php", true);
  req.setRequestHeader("Content-Type", "application/json");
  req.send(JSON.stringify(data));
}

function editUserDetails() {
  var fname = element('fname').value;
  var lname = element('lname').value;
  var email = element('email').value;
  var userType = element('userType').value;
  console.log(
    "First Name:", fname,
    "| Last Name:", lname,
    "| Email:", email,
    "| User Type:", userType
  );


  /*ajax({
    "type": "register",
    'fname': fname,
    'lname': lname,
    "email": email,
    "password": password
  }, function (data) {
    console.log(data.message);

  });*/
}

window.onload = function () {
  document.getElementById("search-form").addEventListener("submit", function (event) {
    event.preventDefault();
    const formData = new FormData(this);
    const query = formData.get("query");

    ajax({
      "api_key": localStorage.getItem("api_key"), "type": "getUser", "email": query
    }, (response) => {
      if (response.success) {
        const form = document.getElementById("updateUserForm");
        form.elements["fname"].value = response.data.fname;
        form.elements["lname"].value = response.data.lname;
        form.elements["email"].value = response.data.email;
        form.elements["userType"].value = response.data.type;
        console.log("Updated details form.");
      }
      else alert("An error occurred during update: "+response.data);
    });
    console.log("Searching for:", query);
  });
}
