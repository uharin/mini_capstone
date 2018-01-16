/* global axios */ 

var productContainer = document.querySelector(".row");

var productTemplate = document.querySelector("#card");

axios.get("http://localhost:3000/products").then(function(response) {
  console.log(response.data);

  var products = response.data;
  
  for (var i = 0; i < products.length; i++) {
    // get the copied productTemplate
    var productClone = productTemplate.content.cloneNode(true);
    // modify that thing with information from the db (products array)
    productClone.querySelector('.name').innerText = products[i].name;
    productClone.querySelector('.price').innerText = products[i].price;
    productClone.querySelector('.description').innerText = products[i].description;
    productClone.querySelector('.in-stock').innerText = products[i].in_stock;
    // productClone.querySelector('.image').src = products[i].image;
    productContainer.appendChild(productClone);
  }
});