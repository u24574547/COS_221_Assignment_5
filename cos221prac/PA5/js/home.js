window.onload = function (){
  const parent = document.getElementsByClassName("product-grid")[0];
  while (parent.firstChild) {
    parent.removeChild(parent.firstChild);
  }

  ajax({
    "type": "getProducts",
    "limit": 9
  }, function (data) {
    if(data.success===true){

      for (let i = 0; i < data.data.products.length; i++) {
        var image = document.createElement("img");
        image.src = JSON.parse(data.data.products[i].images)[0];
        image.alt = data.data.products[i].name;
        var imageButton = document.createElement("a");
        imageButton.appendChild(image);
        var spanner = document.createElement("span");
        spanner.className = "product-category";
        spanner.textContent = data.data.products[i].category;
        var imageDiv = document.createElement("div");
        imageDiv.className = "product-image";
        imageDiv.appendChild(imageButton);
        imageDiv.appendChild(spanner);

        const productInfo = document.createElement("div");
        productInfo.className = "product-info";

        const title = document.createElement("h3");
        const link = document.createElement("a");
        link.href = "#";
        link.textContent = data.data.products[i].name;
        title.appendChild(link);
        productInfo.appendChild(title);

        //const priceRange = document.createElement("div");
        //priceRange.className = "price-range";

        //const priceLabel = document.createElement("span");
        //priceLabel.textContent = "Price Range:";

        //const priceValue = document.createElement("strong");
        //priceValue.textContent = `$5 - $10, the placeholder`;

        //priceRange.appendChild(priceLabel);
        //priceRange.appendChild(priceValue);
        //productInfo.appendChild(priceRange);

        //const storeCount = document.createElement("div");
        //storeCount.className = "store-count";

        const storeIcon = document.createElement("i");
        storeIcon.className = "fas fa-store";

        //storeCount.appendChild(storeIcon);
        //storeCount.appendChild(document.createTextNode(` Available at [placeholder] stores`));
        //productInfo.appendChild(storeCount);

        const compareButton = document.createElement("a");
        compareButton.addEventListener("click", function () {
          const product = data.data.products[i];

          const queryString = new URLSearchParams({
            id: product.product_id,
            title: product.name,
            description: product.description,
            brand: product.brand,
            category: product.category,
            image: JSON.parse(product.images)[0]
          }).toString();
          //console.log("Image URL:", product.images[0]);
          //console.log(product.id);
          window.location.href = `index.php?page=view&${queryString}`;
        });

        compareButton.className = "compare-button";
        compareButton.textContent = "Compare Prices";

        productInfo.appendChild(compareButton);


        const productCard = document.createElement("div");
        productCard.className = "product-card";
        productCard.appendChild(imageDiv);
        productCard.appendChild(productInfo);

        parent.appendChild(productCard);
      }
    }
  });
};

function element(id) {
  return document.getElementById(id);
}

function hide(id) {
  element(id).style.display = "none";
}

function show(id) {
  element(id).style.display = "block";
}

function message(id, text) {
  element(id).innerHTML = text;
}

function ajax(data, callback) {
  var req = new XMLHttpRequest();
  req.onreadystatechange = function () {
    if (req.readyState == 4 && req.status == 200) {
      //console.log(req.responseText);

      var json = JSON.parse(req.responseText);
      callback(json);
    }
  };

  req.open("POST", "../api.php", true);
  req.setRequestHeader("Content-Type", "application/json");
  req.send(JSON.stringify(data));
}
