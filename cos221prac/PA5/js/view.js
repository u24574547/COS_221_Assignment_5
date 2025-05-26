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
function displayProductDetails() {
    const product = getProductFromUrl();

    if (!product.id) {
        document.querySelector(".view-container").innerHTML = "<p>Product not found.</p>";
        return;
    }

    // Update image on the left
    const imgElem = document.createElement("img");
    imgElem.src = product.image_url || "";
    imgElem.alt = product.title || "Product image";
    imgElem.id = "product-image";  // optional for CSS styling

    // Insert image inside the dedicated image container
    const imgContainer = document.querySelector(".product-image-container");
    // Remove previous image if any
    const existingImg = document.getElementById("product-image");
    if (existingImg) existingImg.remove();
    imgContainer.appendChild(imgElem);


    // Update product info text fields
    document.getElementById("product-title").textContent = product.title || "No title";
    document.getElementById("brand").textContent = product.brand || "No brand info";
    document.getElementById("product-department").textContent = product.category || "No category";
    document.getElementById("product-description").textContent = product.description || "No description";
}

// Run display function when DOM is loaded
document.addEventListener("DOMContentLoaded", displayProductDetails);
