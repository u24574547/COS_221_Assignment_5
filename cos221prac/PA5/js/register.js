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

function register() {
    var fname = element('fname').value;
    var lname = element('lname').value;
    var email = element('email').value;
    var password = element('password').value;

    ajax({
        "type": "register",
        'fname': fname,
        'lname': lname,
        "email": email,
        "password": password
    }, function (data) {
        console.log(data.message);
    });
}

console.log('register loaded');
