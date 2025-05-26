

<!-- Link to your CSS -->
<link rel="stylesheet" href="./css/view.css">
<script src="./js/view.js"></script>

<div class="view-container" style="display: flex; gap: 2rem; padding: 1rem;">

  <!-- Left side: Product Image -->
  <div class="product-image-container" style="flex: 1;">
    <!-- Image inserted dynamically by view.js -->
  </div>

  <!-- Middle: Product Info -->
  <div class="product-details" style="flex: 2;">
    <h1 id="product-title">Loading...</h1>
    <p><strong>Brand:</strong> <span id="brand">Loading...</span></p>
    <p><strong>Category:</strong> <span id="product-department">Loading...</span></p>
    <p><strong>Description:</strong> <span id="product-description">Loading...</span></p>
    <p><strong>Average Price:</strong> <span id="average-price">Calculating...</span></p>

  </div>

  <!-- Right side: Vendor Prices (future) -->
  <div id="vendor-prices" style="flex: 1; min-width: 300px;">
    <!-- Vendor price listings go here later -->
  </div>

</div>



