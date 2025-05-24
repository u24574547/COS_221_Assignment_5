<?php
$site_title = 'TQK PriceCompare';
$site_description = 'Find the best deals across multiple stores';

session_start();

$page = isset($_GET['page']) ? $_GET['page'] : 'home';

include 'includes/header.php';

switch ($page) {
  case 'home':
    var_dump($page);
    include 'pages/home.php';
    break;
  case 'product':
    include 'pages/product.php';
    break;
  case 'category':
    include 'pages/category.php';
    break;
  case 'search':
    include 'pages/search.php';
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
  default:
    include 'pages/404.php';
}

include 'includes/footer.php';
?>
