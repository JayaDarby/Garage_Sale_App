var app = angular.module('GarageSaleApp', ['ngRoute', 'ngAnimate', 'angularFileUpload']);

app.config(['$httpProvider', '$locationProvider', function($httpProvider, $locationProvider) {

  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');

 //    $locationProvider.html5Mode({
	//   enabled: true,
	//   requireBase: false
	// });
}])


app.factory("Cart", function($rootScope){
    var Cart = {};
    Cart.cart = [];
    Cart.numItems = 0;

    Cart.addItem = function(obj){
    	Cart.cart.push(obj)
    	Cart.numItems += 1;
    };

    return Cart;
});


