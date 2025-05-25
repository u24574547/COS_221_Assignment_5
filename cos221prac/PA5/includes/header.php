<?php
// Header file for the price comparison website
$site_title = "TQK PriceCompare";
$site_description = "The best deals on the Internet!";
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="<?php echo $site_description; ?>">
  <title><?php echo $site_title; ?> - <?php echo ucfirst($page); ?></title>
  <link rel="stylesheet" href="css/style.css">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<header>
  <div class="container">
    <div class="logo">
      <a href="index.php">
        <h1><?php echo $site_title; ?></h1>
      </a>
    </div>
    <div class="search-bar">
      <form action="index.php?page=search" method="GET">
        <input type="hidden" name="page" value="search">
        <input type="text" name="query" placeholder="Search for products..." required>
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>
    <nav>
      <ul>
        <li><a href="index.php" <?php echo ($page == 'home') ? 'class="active"' : ''; ?>>Home</a></li>
        <li class="dropdown">
          <a href="#" <?php echo ($page == 'category') ? 'class="active"' : ''; ?>>Categories <i class="fas fa-chevron-down"></i></a>
          <div class="dropdown-content">
            <a href="index.php?page=category&id=electronics">Electronics</a>
            <a href="index.php?page=category&id=fashion">Fashion</a>
            <a href="index.php?page=category&id=home">Home & Kitchen</a>
            <a href="index.php?page=category&id=beauty">Beauty & Personal Care</a>
            <a href="index.php?page=category&id=toys">Toys & Games</a>
          </div>
        </li>
        <li><a href="index.php?page=about" <?php echo ($page == 'about') ? 'class="active"' : ''; ?>>About</a></li>
        <li><a href="index.php?page=contact" <?php echo ($page == 'contact') ? 'class="active"' : ''; ?>>Contact</a></li>
        <li><a href='index.php?page=admin' <?php echo ($page == 'admin') ? 'class="active"' : ''; ?>>Admin</a></li>
        <li <?php echo ($logged_in===true) ? 'style="display:none;"' : 'error with logging in'; ?>><a href='index.php?page=register' <?php echo ($page == 'register') ? 'class="active"' : ''; ?>>Register</a>
        <li <?php echo ($logged_in===true) ? 'style="display:none;"' : 'error with logging in'; ?>><a href='index.php?page=login' <?php echo ($page == 'login') ? 'class="active"' : ''; ?>>Login</a>
        </li>
      </ul>
    </nav>
    <div class="mobile-menu">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</header>
<main>
  <div class="container">
