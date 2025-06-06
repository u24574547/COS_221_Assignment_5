// const API = "http://localhost/COS%20221/Assignment%205/COS_221_Assignment_5/cos221prac/api.php";
const API = "../api.php";
// Changed fetchProducts to accept optional catgeory
function fetchProducts() {
   var xhr = new XMLHttpRequest();
   var category = document.getElementById('category-filter').value;
   var vendorId = document.getElementById('vendor-filter').value;

   xhr.open("POST", API, true);
   xhr.setRequestHeader("Content-Type", "application/json");

   xhr.onreadystatechange = function() {
       if (xhr.readyState == 4 && xhr.status == 200) {
           try {
               var response = JSON.parse(xhr.responseText);
               let data = response.data.products;
               populateHTML(data);
           } catch(e) {
               console.error ("Failed to parse" +  JSON.parse(xhr.responseText));
           }
       }
   };

   var payload = {
       type: "getProducts",
       limit: 50
   };
   if (category && category !== 'all') {
       payload.category = category;
   }
   if (vendorId && vendorId !== 'all') {
       payload.vendor_id = vendorId;
   }

   xhr.send(JSON.stringify(payload));
}

// Helper funciton
async function callAPI(body) {
  const res = await fetch(API, {           // adjust path if needed
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body)
  });
  return res.json();
}

async function fetchCategories() {
  try {
    const json = await callAPI({ type: 'getCategories' });
    if (!json.success) throw new Error(json.data);
    const select = document.getElementById('category-filter');
    // Remove any existing non-default options
    select.querySelectorAll('option:not([value="all"])')
          .forEach(opt => opt.remove());
    // Add one <option> per category
    json.data.categories.forEach(cat => {
      const opt = document.createElement('option');
      opt.value = cat;
      opt.textContent = cat.charAt(0).toUpperCase() + cat.slice(1);
      select.appendChild(opt);
    });
  } catch (err) {
    console.error('Could not load categories:', err);
  }
}

async function fetchVendors() {
  try {
    const json = await callAPI({ type: 'getVendors' });
    if (!json.success) throw new Error(json.data);
    const select = document.getElementById('vendor-filter');

    // Clear existing options except "All"
    select.querySelectorAll('option:not([value="all"])')
          .forEach(opt => opt.remove());

    json.data.vendors.forEach(v => {
      const opt = document.createElement('option');
      opt.value = v.vendor_id;
      opt.textContent = v.name;
      select.appendChild(opt);
    });
  } catch (err) {
    console.error('Could not load vendors:', err);
  }
}



function populateHTML(products) {
    // Find the product grid container
    const grid = document.querySelector('.featured-products .product-grid');
    if (!grid) return;

    // Clear existing products
    grid.innerHTML = '';

    // Add fetched products
    products.forEach(product => {
        const card = document.createElement('div');

        let images = product.images;
    if (typeof images === "string") {
        try {
            images = JSON.parse(images);
        } catch (e) {
            images = [];
        }
    }

        console.log("IMAGE",  images[0], product.images[1]);
        card.className = 'product-card';
        card.innerHTML = `
            <div class="product-image">
                <a href="">
                    <img src="${images[0] || 'assets/images/products/apple-watch.jpg'}" alt="${product.name}">
                </a>
                <span class="product-category">${product.category || ''}</span>
            </div>
            <div class="product-info">
                <h3><a href="">${product.name}</a></h3>
                <div class="store-count">
                    <i class="fas fa-store"></i> Available at ${product.stores || 1} stores
                </div>
                <a href="#" class="compare-button">Compare Prices</a>
            </div>
        `;
        grid.appendChild(card);
        const compareBtn = card.querySelector('.compare-button');
        compareBtn.addEventListener('click', function (e) {
            e.preventDefault();

            // Parse images
            let images = product.images;
            if (typeof images === "string") {
                try {
                    images = JSON.parse(images);
                } catch {
                    images = [];
                }
            }

            const queryString = new URLSearchParams({
                id: product.product_id,
                title: product.name,
                description: product.description || '',
                brand: product.brand || '',
                category: product.category || '',
                image: images[0] || ''
            }).toString();

            window.location.href = `index.php?page=view&${queryString}`;
        });

    });
}


// Wire up on page load
document.addEventListener('DOMContentLoaded', () => {
  // populate the category dropdown
  fetchCategories();
  fetchVendors();

  // fetch all products initially
  fetchProducts();

  //re-fetch when Apply is clicked
  document.getElementById('apply-filters')
          .addEventListener('click', fetchProducts);
});