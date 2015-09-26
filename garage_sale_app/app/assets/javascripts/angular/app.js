var app = angular.module('GarageSaleApp', ['ngRoute', 'angularFileUpload']);

app.config(['$httpProvider', '$locationProvider', function($httpProvider, $locationProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
 //    $locationProvider.html5Mode({
	//   enabled: true,
	//   requireBase: false
	// });
}]);

