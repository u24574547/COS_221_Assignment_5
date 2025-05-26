<?php?>
<section class="featured-products">
  <div class="section-header">
    <h2>All Products</h2>
    <div class="product-filters">
      <label for="category-filter">Filter by Category:</label>
      <select id="category-filter">
      <option value="all">All</option>
      <option value="electronics">Electronics</option>
      <option value="clothing">Clothing</option>
      <option value="books">Books</option>
      <!-- Add categories dynamically?-->
      </select>
    </div>
  </div>
  <div class="product-grid">
    <!-- Product cards will be populated here by populate.js -->
  </div>
</section>
<script src="js/populate.js"></script>
<script src="js/view.js"></script> <!-- For compare button redirection behavior -->
