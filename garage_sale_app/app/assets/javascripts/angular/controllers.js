app.controller('HomeController', function($scope, $location, $http) {
	$scope.testing = "It's working!";
	$scope.garageSales = [];
	$http.get("./api/garage_sales.json")
    .then(function (data) {
    	data.data.forEach(function(garageSale){
    	  if (garageSale.full_address !== null){
    		$scope.garageSales.push(garageSale.full_address);
    	  }
    	});
    console.log($scope.garageSales);
    }, function(response){
    	console.log(response);
    	console.log('error!');
    });
});