app.service('GarageSale', ['$resource', function($resource) {
  return $resource(
    "/api/garage_sales/:id.json",
    {id: "@id"},
    {update: {method: "PUT"}} 
  );
}]);