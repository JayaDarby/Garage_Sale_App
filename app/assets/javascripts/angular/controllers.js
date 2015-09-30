app.controller('HomeController', function($scope, $location, $http) {

    //find
	$scope.testing = "It's working!";
	$scope.garageSaleAddresses = [];
    $scope.garageSales = [];
    $scope.items = [];

    $scope.getGarageSales = function(){
        var distanceMeters;
    	$http.get("/api/garage_sales/garage_sales.json")
        .then(function (data) {
            $scope.garageSales = [];
            $scope.garageSaleAddresses = [];
        	data.data.forEach(function(garageSale){
                $scope.distanceMeters = parseInt($scope.distance)*1609.34;
        	  if (garageSale.full_address !== null){
        		$scope.garageSaleAddresses.push(garageSale.full_address);
                $scope.garageSales.push(garageSale)
        	  }
        	});
        });
    };
    $scope.getItems = function(){
        $http.get("/api/items/items.json")
        .then(function (data) {
            $scope.items = [];
            data.data.forEach(function(item){
              $scope.items.push(item);
            });
        });
    }
    $scope.firstGarageSale = $scope.garageSales[0];
    $scope.addItemToCart = function(){
        $http.get('/api/items/')
    }
});