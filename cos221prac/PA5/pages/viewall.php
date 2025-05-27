<?php?>
<section class="featured-products">
  <div class="section-header">
    <h2>All Products</h2>
    <div class="product-filters">
      <label for="category-filter">Filter by Category:</label>
      <select id="category-filter">
      <option value="all">All</option>
      
      <!-- Add categories dynamically-->
      </select>
      <label for="vendor-filter">Filter by Vendor:</label>
      <select id="vendor-filter">
        <option value="all">All</option>
        <!-- Dynamically populated with JavaScript -->
      </select>
      <button id="apply-filters">Apply</button>
    </div>
  </div>
  <div class="product-grid">
    <!-- Product cards will be populated here by populate.js -->
  </div>
</section>
<script src="js/populate.js"></script>
<script src="js/view.js"></script> <!-- For compare button redirection behavior -->