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
        if (req.readyState == 4 && req.status == 200) {
            console.log(req.responseText);

            var json = JSON.parse(req.responseText);
            callback(json);
        }
    };

    req.open("POST", "../api.php", true);
    req.setRequestHeader("Content-Type", "application/json");
    req.send(JSON.stringify(data));
}

function login() {
    var email = element('email').value;
    var password = element('password').value;

    ajax({
        "type": "login",
        "email": email,
        "password": password
    }, function (data) {
      if(data.success===true){
        localStorage.setItem("api_key",data.data.api_key);
        localStorage.setItem("is_admin",data.data.is_admin);
        localStorage.setItem("logged_in","1");
        window.location.replace("index.php");
      }
    });
}

console.log('login loaded');
