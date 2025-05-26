<?php
$page = "home";

$featured_products = [
  [
    'id' => 1,
    'name' => 'Samsung Galaxy S24 Ultra',
    'image' => 'assets/images/products/samsung-s24.jpg',
    'lowest_price' => 999.99,
    'highest_price' => 1199.99,
    'stores' => 5,
    'category' => 'Electronics'
  ],
  [
    'id' => 2,
    'name' => 'Sony WH-1000XM5 Headphones',
    'image' => 'assets/images/products/sony-headphones.jpg',
    'lowest_price' => 299.99,
    'highest_price' => 349.99,
    'stores' => 6,
    'category' => 'Electronics'
  ],
  [
    'id' => 3,
    'name' => 'Apple Watch Series 9',
    'image' => 'assets/images/products/apple-watch.jpg',
    'lowest_price' => 399.99,
    'highest_price' => 429.99,
    'stores' => 4,
    'category' => 'Electronics'
  ],
  [
    'id' => 4,
    'name' => 'Nike Air Max 270',
    'image' => 'assets/images/products/nike-airmax.jpg',
    'lowest_price' => 129.99,
    'highest_price' => 159.99,
    'stores' => 7,
    'category' => 'Fashion'
  ],
  [
    'id' => 5,
    'name' => 'Instant Pot Duo 7-in-1',
    'image' => 'assets/images/products/instant-pot.jpg',
    'lowest_price' => 79.99,
    'highest_price' => 99.99,
    'stores' => 8,
    'category' => 'Home & Kitchen'
  ],
  [
    'id' => 6,
    'name' => 'LEGO Star Wars Millennium Falcon',
    'image' => 'assets/images/products/lego-starwars.jpg',
    'lowest_price' => 149.99,
    'highest_price' => 169.99,
    'stores' => 3,
    'category' => 'Toys & Games'
  ],
];

// Get popular categories
$popular_categories = [
  [
    'id' => 'electronics',
    'name' => 'Electronics',
    'icon' => 'fas fa-laptop',
    'count' => 1250
  ],
  [
    'id' => 'fashion',
    'name' => 'Fashion',
    'icon' => 'fas fa-tshirt',
    'count' => 876
  ],
  [
    'id' => 'home',
    'name' => 'Home & Kitchen',
    'icon' => 'fas fa-home',
    'count' => 932
  ],
  [
    'id' => 'beauty',
    'name' => 'Beauty & Personal Care',
    'icon' => 'fas fa-spa',
    'count' => 658
  ],
  [
    'id' => 'toys',
    'name' => 'Toys & Games',
    'icon' => 'fas fa-gamepad',
    'count' => 423
  ],
];

// Get top stores
$top_stores = [
  [
    'id' => 1,
    'name' => 'Amazon',
    'logo' => 'assets/images/stores/amazon.png',
    'products' => 5280
  ],
  [
    'id' => 2,
    'name' => 'Best Buy',
    'logo' => 'assets/images/stores/bestbuy.png',
    'products' => 3420
  ],
  [
    'id' => 3,
    'name' => 'Walmart',
    'logo' => 'assets/images/stores/walmart.png',
    'products' => 4150
  ],
  [ 
    'id' => 4,
    'name' => 'Target',
    'logo' => 'assets/images/stores/target.png',
    'products' => 3680
  ],
];
?>
<script type='text/javascript' src='js/home.js'></script>
<section class="hero">
  <div class="hero-content">
    <h1>Find the Best Deals Across the Web</h1>
    <p>Compare prices from hundreds of stores to ensure you always get the best deal</p>
    <div class="hero-search">
      <form action="" method="GET">
        <input type="hidden" name="page" value="search">
        <input type="text" name="query" placeholder="What are you looking for?" required>
        <button type="submit">Search</button>
      </form>
    </div>
  </div>
</section>

<section class="featured-products">
  <div class="section-header">
    <h2>Featured Products</h2>
    <a href="?page=viewall" class="view-all">View All</a>
  </div>
  <div class="product-grid">
    <?php foreach ($featured_products as $product): ?>
      <div class="product-card">
        <div class="product-image">
          <a href="">
            <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>">
          </a>
          <span class="product-category"><?php echo $product['category']; ?></span>
        </div>
        <div class="product-info">
          <h3><a href=""><?php echo $product['name']; ?></a></h3>
          <div class="price-range">
            <span>Price Range:</span>
            <strong><?php echo $product['lowest_price']; ?> - <?php echo $product['highest_price']; ?></strong>
          </div>
          <div class="store-count">
            <i class="fas fa-store"></i> Available at <?php echo $product['stores']; ?> stores
          </div>
          <a href="" class="compare-button">Compare Prices</a>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
</section>

<section class="categories">
  <div class="section-header">
    <h2>Popular Categories</h2>
  </div>
  <div class="category-grid">
    <?php foreach ($popular_categories as $category): ?>
      <a href="" class="category-card">
        <div class="category-icon">
          <i class="<?php echo $category['icon']; ?>"></i>
        </div>
        <h3><?php echo $category['name']; ?></h3>
        <span><?php echo $category['count']; ?> products</span>
      </a>
    <?php endforeach; ?>
  </div>
</section>

<section class="stores">
  <div class="section-header">
    <h2>Featured Stores</h2>
  </div>
  <div class="store-grid">
    <?php foreach ($top_stores as $store): ?>
      <a href="" class="store-card">
        <div class="store-logo">
          <img src="<?php echo $store['logo']; ?>" alt="<?php echo $store['name']; ?> Logo">
        </div>
        <h3><?php echo $store['name']; ?></h3>
        <span><?php echo $store['products']; ?> products</span>
      </a>
    <?php endforeach; ?>
  </div>
</section>

<section class="how-it-works">
  <div class="section-header">
    <h2>How It Works</h2>
  </div>
  <div class="steps">
    <div class="step">
      <div class="step-icon">
        <i class="fas fa-search"></i>
      </div>
      <h3>Search</h3>
      <p>Enter the product you're looking for</p>
    </div>
    <div class="step">
      <div class="step-icon">
        <i class="fas fa-chart-bar"></i>
      </div>
      <h3>Compare</h3>
      <p>View prices across multiple retailers</p>
    </div>
    <div class="step">
      <div class="step-icon">
        <i class="fas fa-tags"></i>
      </div>
      <h3>Save</h3>
      <p>Find the best deal and save money</p>
    </div>
  </div>
</section>

<section class="newsletter">
  <div class="newsletter-content">
    <h2>Stay Updated on the Best Deals</h2>
    <p>Subscribe to our newsletter and never miss out on great savings</p>
    <form action="" method="POST" class="newsletter-form">
      <label>
        <input type="email" name="email" placeholder="Your email address" required>
      </label>
      <button type="submit">Subscribe</button>
    </form>
  </div>
</section>
<script src = "js/populate.js"></script>
