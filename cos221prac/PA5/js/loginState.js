if(localStorage.getItem("logged_in")==="1"){
  window.onload = function(){
    var registerTab = document.getElementById("register-tab");
    registerTab.style.display = "none";
    var loginTab = document.getElementById("login-tab");
    loginTab.style.display = "none";
    if(localStorage.getItem("is_admin")==="true") document.getElementById("admin-tab").style.display = "";
  }
}
