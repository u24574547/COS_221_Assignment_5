<?php
$site_title = 'TQK PriceCompare';
$site_description = 'Find the best deals across multiple stores';

session_start();

$page = isset($_GET['page']) ? $_GET['page'] : 'home';

include 'includes/header.php';

switch ($page) {
  case 'home':
    include 'pages/home.php';
    break;
  case 'about':
    include 'pages/about.php';
    break;
  case 'contact':
    include 'pages/contact.php';
    break;
  case 'register':
    include 'pages/register.php';
    break;
  case 'login':
    include 'pages/login.php';
    break;
  case 'admin':
    include 'pages/admin.php';
    break;
  case 'viewall':
    include 'pages/viewall.php';
    break;
  case 'view':
    include 'pages/view.php';
    break;
  default:
    include 'pages/404.php';
}

include 'includes/footer.php';
?>
<script type='text/javascript' src='js/loginState.js'></script>
