app.service('GarageSale', ['$resource', function($resource) {
  return $resource(
    "/api/garage_sales/:id.json",
    {id: "@id"},
    {update: {method: "PUT"}} 
  );
}]);

app.service('Item', ['$resource', function($resource) {
  return $resource(
    "/api/items/:id.json",
    {id: "@id"},
    {update: {method: "PUT"}} 
  );
}]);