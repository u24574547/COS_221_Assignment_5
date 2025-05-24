<?php
$site_title = "The Query Kings PriceCompare";
?>
</div>
</main>
<footer>
  <div class="container">
    <div class="footer-columns">
      <div class="footer-column">
        <h3>About <?php echo $site_title; ?></h3>
        <p>We help you find the best deals across multiple online stores. Compare prices, read reviews, and make informed purchasing decisions.</p>
      </div>
      <div class="footer-column">
        <h3>Quick Links</h3>
        <ul>
          <li><a href="pages/home.php">Home</a></li>
          <li><a href="index.php?page=about">About Us</a></li>
          <li><a href="index.php?page=contact">Contact</a></li>
          <li><a href="index.php?page=privacy">Privacy Policy</a></li>
          <li><a href="index.php?page=terms">Terms of Service</a></li>
        </ul>
      </div>
      <div class="footer-column">
        <h3>Categories</h3>
        <ul>
          <li><a href="index.php?page=category&id=electronics">Electronics</a></li>
          <li><a href="index.php?page=category&id=fashion">Fashion</a></li>
          <li><a href="index.php?page=category&id=home">Home & Kitchen</a></li>
          <li><a href="index.php?page=category&id=beauty">Beauty & Personal Care</a></li>
          <li><a href="index.php?page=category&id=toys">Toys & Games</a></li>
        </ul>
      </div>
    </div>
    <div class="copyright">
      <p>&copy; <?php echo date('Y'); ?> <?php echo $site_title; ?>. All Rights Reserved.</p>
    </div>
  </div>
</footer>
</body>
</html>
