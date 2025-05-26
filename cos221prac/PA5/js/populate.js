const API = "../api.php";

function fetchProducts() {
   var xhr = new XMLHttpRequest();
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
    }

    const requestBody = JSON.stringify(
        {
            type : "getProducts",
            limit: 50
        }
    );
    xhr.send(requestBody);
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
                <div class="price-range">
                    <span>Price:</span>
                    <strong>${product.price ? product.price : 'N/A'}</strong>
                </div>
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


document.addEventListener('DOMContentLoaded', fetchProducts);
