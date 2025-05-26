// Get product data from URL query parameters
function getProductFromUrl() {
    const params = new URLSearchParams(window.location.search);
    return {
        id: params.get("id"),
        title: params.get("title"),
        description: params.get("description"),
        image_url: params.get("image"),
        brand: params.get("brand"),
        category: params.get("category")
    };
}

// Display product details on the page
function displayProductDetails(product) {
    if (!product.id) {
        document.querySelector(".view-container").innerHTML = "<p>Product not found.</p>";
        return;
    }

    // Update image
    const imgElem = document.createElement("img");
    imgElem.src = product.image_url || "";
    imgElem.alt = product.title || "Product image";
    imgElem.id = "product-image";

    // Insert image
    const imgContainer = document.querySelector(".product-image-container");
    const existingImg = document.getElementById("product-image");
    if (existingImg) existingImg.remove();
    imgContainer.appendChild(imgElem);

    // Update product info text fields
    document.getElementById("product-title").textContent = product.title || "No title";
    document.getElementById("brand").textContent = product.brand || "No brand info";
    document.getElementById("product-department").textContent = product.category || "No category";
    document.getElementById("product-description").textContent = product.description || "No description";
}

// Fetch listings from API
function fetchVendorListings(productId) {
    fetch("../api.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            type: "getVendorListingsForProduct",
            product_id: parseInt(productId)
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success && data.data && Array.isArray(data.data.listings)) {
            renderVendorListings(data.data.listings);
        } else {
            document.getElementById("vendor-prices").innerHTML = "<p>No vendor listings found.</p>";
        }
    })
    .catch(error => {
        console.error("Error fetching vendor listings:", error);
        document.getElementById("vendor-prices").innerHTML = "<p>Error loading vendor prices.</p>";
    });
}

function renderVendorListings(listings) {
    const container = document.getElementById("vendor-prices");
    container.innerHTML = "<h2>Prices</h2>";

    let total = 0;
    let count = 0;

    listings.forEach(listing => {
        const price = parseFloat(listing.price);
        if (!isNaN(price)) {
            total += price;
            count++;
        }

        const item = document.createElement("div");
        item.className = "vendor-listing";

        item.innerHTML = `
            <p><strong>Vendor:</strong> <a href="${listing.website_url}" target="_blank">${listing.vendor_name}</a></p>
            <p><strong>Price:</strong> ${listing.currency} ${price.toFixed(2)}</p>
            <p><strong>In Stock:</strong> ${listing.in_stock ? "Yes" : "No"}</p>
            <hr>
        `;

        container.appendChild(item);
    });

    // Calculate and update average price
    const avg = count > 0 ? (total / count).toFixed(2) : "N/A";
    const avgDisplay = document.getElementById("average-price");
    if (avgDisplay) {
        avgDisplay.textContent = count > 0 ? `$${avg}` : "No pricing data";
    }
}


// Initialize once DOM is ready
document.addEventListener("DOMContentLoaded", () => {
    const product = getProductFromUrl();

    if (product.id) {
        displayProductDetails(product);
        fetchVendorListings(product.id);
    } else {
        document.querySelector(".view-container").innerHTML = "<p>Product not found in URL.</p>";
    }
});
