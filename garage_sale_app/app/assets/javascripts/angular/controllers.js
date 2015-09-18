app.controller('HomeController', function($scope, $location, $http) {
	$scope.testing = "It's working!";
	$scope.garageSales = [];
	$http.get("/api/garage_sales.json")
    .then(function (data) {
    	data.data.forEach(function(garageSale){
    	  if (garageSale.full_address !== null){
    		$scope.garageSales.push(garageSale.full_address);
    	  }
    	});
    $scope.firstGarageSale = $scope.garageSales[0];
    }, function(response){
    	console.log(response);
    	console.log('error!');
    });
    $scope.codeAddresses = function(addresses){
        console.log(addresses);
        addresses.forEach(function (address){
          geocoder.geocode( { 'address': address}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            setTimeout(function(){
                var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location,
                animation: google.maps.Animation.DROP
                }, 200);

            });
            
          } else {
            alert("Geocode was not successful for the following reason: " + status);
          }
         });

        });
        
      };
});