/* global Vue, VueRouter, axios */

// =======================
// HOMEPAGE COMPONENT
// =======================

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      products: [],
      searchTerm: "",
      searchDesc: "",
      sortAttribute: "name",
      sortAsc: true
    };
  },
  created: function() {
    axios.get("/products").then(function(response) {
      console.log(response.data);
      this.products = response.data; 
    }.bind(this)
    );
  },
  methods: {
    isValidProductName: function(inputProduct) {
      return inputProduct.name.toLowerCase().includes(this.searchTerm.toLowerCase());
    },
    isValidProductDesc: function(inputDesc) {
      return inputDesc.description.includes(this.searchDesc);
    },
    writeAttribute: function(inputAttribute) {
      this.sortAsc = !this.sortAsc;
      this.sortAttribute = inputAttribute;
    }
  },
  computed: {
    sortedProducts: function() {
      if (this.sortAsc) {
        return this.products.sort(function(product1, product2) {
          return product1[this.sortAttribute].localeCompare(product2[this.sortAttribute]);
        }.bind(this));
      } else {
        return this.products.sort(function(product1, product2) {
          return product2[this.sortAttribute].localeCompare(product1[this.sortAttribute]);
        }.bind(this));
      }
    }
  }
};





// =======================
// SIGNUP VUE COMPONENT
// =======================

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// =======================
// LOGIN VUE COMPONENT
// =======================

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

// =======================
// LOGOUT VUE COMPONENT
// =======================

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

// =======================
// NEW PRODUCT COMPONENT
// =======================

var NewProduct = {
  template: "#new-product",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      inStock: "",
      errors: []
    };
  },
  methods: {
    createProduct: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        in_stock: this.inStock
      };
      axios
        .post("/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

// =======================
// SHOW PRODUCTS COMPONENT
// =======================

var ShowProduct = {
  template: "#show-product",
  data: function() {
    return {
      product: {}
    };
  },
  created: function() {
    axios
      .get("/products/" + this.$route.params.id)
      .then(function(response) {
        console.log(this.$route);
        console.log(this.$route.params.id);
        this.product = response.data;
      }.bind(this));
  },
  methods: {
  }
};

// =======================
// EDIT PRODUCT COMPONENT
// =======================

var EditProduct = {
  template: "#edit-product",
  data: function() {
    return {
      product: {},
      errors: []
    };
  },
  methods: {
    editProduct: function() {
      var params = {
        name: this.product.name,
        price: this.product.price,
        description: this.product.description,
        in_stock: this.product.inStock
      };
      axios
        .patch("/products/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  created: function() {
    axios
      .get("/products/" + this.$route.params.id)
      .then(function(response) {
        this.product = response.data;
      }.bind(this));
  },
};

// =======================
// ROUTER
// =======================

var router = new VueRouter({
  routes: [
    {path: "/", component: HomePage},
    {path: "/signup", component: SignupPage},
    {path: "/login", component: LoginPage},
    {path: "/logout", component: LogoutPage},
    {path: "/products/:id/edit", component: EditProduct },
    {path: "/products/new", component: NewProduct},
    {path: "/products/:id", component: ShowProduct }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

// =======================
// VUE OBJECT
// =======================

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }

});
