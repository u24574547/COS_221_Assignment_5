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
    <nav>
      <ul>
        <li><a href="index.php" <?php echo ($page == 'home') ? 'class="active"' : ''; ?>>Home</a></li>
        <li><a href='index.php?page=viewall' <?php echo ($page == 'viewall') ? 'class="active"' : ''; ?>>Products</a></li>
        <li><a href="index.php?page=about" <?php echo ($page == 'about') ? 'class="active"' : ''; ?>>About</a></li>
        <li><a href="index.php?page=contact" <?php echo ($page == 'contact') ? 'class="active"' : ''; ?>>Contact</a></li>
        <li style="display:none;" id="admin-tab"><a href='index.php?page=admin' <?php echo ($page == 'admin') ? 'class="active"' : ''; ?>>Admin</a></li>
        <li id='register-tab'><a href='index.php?page=register' <?php echo ($page == 'register') ? 'class="active"' : ''; ?>>Register</a>
        <li id='login-tab'><a href='index.php?page=login' <?php echo ($page == 'login') ? 'class="active"' : ''; ?>>Login</a>
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
