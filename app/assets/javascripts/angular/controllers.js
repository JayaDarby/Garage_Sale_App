app.controller('HomeController', function($scope, $location, $http, $rootScope, $window, $rootScope, Cart) {

    //find
	$scope.testing = "It's working!";
	$scope.garageSaleAddresses = [];
    $scope.garageSales = [];
    $scope.items = [];
    $scope.cart = Cart.cart;
    $scope.addItemToCart = function(item){
        Cart.addItem(item);
    };
    $rootScope.numItems = Cart.numItems;

    $scope.gs = function(){
        $scope.garageSales.forEach(function(sale){
            console.log(sale)
        });
    };


    $scope.getGarageSales = function(){
        var distanceMeters;
        $scope.garageSales = [];
        $scope.garageSaleAddresses = [];
        var a, ee;
    	$http.get("/api/garage_sales/garage_sales.json")

      //   var a= new google.maps.LatLng(5,6)
      //   var b= new google.maps.LatLng(5,8)
      // var ee = google.maps.geometry.spherical.computeDistanceBetween(a,b);
        .then(function (data) {
            $scope.distanceMeters = parseInt($scope.garageDistance)*1609.34;
        	data.data.forEach(function(garageSale){
        	  if (garageSale.full_address !== null){
                                
                                    $scope.garageSales.push(garageSale);
                                
               
                //console.log(garageSale.full_address.split(' ').join('+'));
               // if ($scope.hasItems && garageSale.has_items || !$scope.hasItems && !garageSale.has_items){
                    geocoder.geocode({'address':garageSale.full_address}, function(results, status){
                        if(garageSale.id === 123)
                            console.log(status);
                        if (status == google.maps.GeocoderStatus.OK){
                            a = new google.maps.LatLng($window.homeLat, $window.homeLong);
                            //console.log('the results are'+ results[0].geometry.location)
                            ee = google.maps.geometry.spherical.computeDistanceBetween(results[0].geometry.location, a);
                            if (ee < $scope.distanceMeters){
                                
                                // $scope.$apply(function () {
                                //     $scope.garageSales.push(garageSale);
                                // });
                            
                            
                                //console.log(a)
                                //console.log(results[0].geometry.location)
                                marker = new google.maps.Marker({
                                   draggable:false,
                                   position: results[0].geometry.location,
                                   map: map,
                                   title: 'Your Location',
                                   animation: google.maps.Animation.DROP,
                                });
                            };
                          }
                          else{
                           // console.log(garageSale)
                          }
    
                            //console.log(results[0].geometry.location)
                        });
                   // };
                };
        		//$scope.garageSaleAddresses.push(garageSale.full_address);
                //$scope.garageSales.push(garageSale)
        	  });
        	}); 
    }

    $scope.getItems = function(){
        $http.get("/api/items/items.json")
        .then(function (data) {
            $scope.items = [];
            data.data.forEach(function(item){
              $scope.items.push(item);
            });
        });
    }

});

app.controller('NavController', function($scope, Cart){
  $scope.cart = Cart.cart;
});

app.controller('CartController', function($scope, Cart){
  $scope.cart = Cart.cart;
      $scope.addItemToCart = function(item){
        Cart.addItem(item);
    };

   $scope.data = function(){
        return Cart.cart;
      };

});


