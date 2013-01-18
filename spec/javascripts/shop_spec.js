describe("Feminity shop", function(){

  it("downloads initial category list", function(){

    waitsFor(function(){
      return useCase.categories.length > 0;},
      'Should download categories', 1500);

    runs(function(){
      expect(useCase.categories.length).toBeGreaterThan(0);
    });
  });
  
  it("downloads initial products list", function(){

    waitsFor(function(){
      return useCase.products.length > 0;},
      'Should download products', 1500);

    runs(function(){
      expect(useCase.products.length).toBeGreaterThan(0);
    });
  });

  it("updates the cart on product addition", function(){
   
    useCase.cart = [];

    runs(function(){
      useCase.addProductToCart(1);
    });

    waitsFor(function(){
      return useCase.cart.length == 1;},
      'Should update cart', 1500);

    runs(function(){
      expect(useCase.cart.length).toEqual(1);
    });
  });

  it("finds products for a category", function(){
    waitsFor(function(){
      return useCase.products.length > 0;},
      'Should download products', 1500);

    runs(function(){
      pr = useCase.findProductsForCategory(1);
      expect(pr.length).toBeGreaterThan(0);
      for(var i=0; i<pr.length; i++){
        expect(pr[i].category_id).toEqual(1);
      }
    });
  });

  it("updates cart's sum on product addition", function(){
   
    useCase.cart = [];
    var sum, length;
    runs(function(){
      sum = useCase.cartSum();
      length = useCase.cart.length;
      useCase.addProductToCart(1);
    });

    waitsFor(function(){
      return useCase.cart.length == 1;},
      'Should update cart', 1500);

    runs(function(){
      expect(sum).not.toEqual(useCase.cartSum);
    });
  });

  it("updates cart's sum on product deletion", function(){
   
    useCase.cart = [new Product(1, "", "", 10000, 1), new Product(2, "", "", 10000, 1)];
    var sum, length;
    runs(function(){
      sum = useCase.cartSum();
      length = useCase.cart.length;
      useCase.deleteProductFromCart(1);
    });

    waitsFor(function(){
      console.log(useCase.cart.length)
      return useCase.cart.length == 1;},
      'Should update cart', 1500);

    runs(function(){
      expect(useCase.cartSum()).toEqual(sum-100.0);
    });
  });
});
