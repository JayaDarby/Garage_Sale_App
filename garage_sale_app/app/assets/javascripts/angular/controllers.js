app.controller('HomeController', function($scope, $location, $http) {
	$scope.testing = "It's working!";
	$scope.garageSales = [];
	$http.get("./garage_sales.json")
    .then(function (data) {
    	$scope.restaurants = data;
    }, function(response){
    	console.log(response);
    	console.log('error!');
    });
});