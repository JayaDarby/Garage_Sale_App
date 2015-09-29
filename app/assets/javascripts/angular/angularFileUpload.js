'use strict';


angular


    .module('GarageSaleApp')


    .controller('GarageSaleController', ['$scope', 'FileUploader', '$http', '$location', '$window', function($scope, FileUploader, $http, $location, $window) {
        $scope.garage_sale = {};
        var uploader = $scope.uploader = new FileUploader({
            url: ''
        });

        $scope.hello = function(garageSale, user_id){
            console.log('hello');
            console.log(garageSale);
            $http.post('/users/'+'1'+'/garage_sales', {garage_sale: garageSale})
              .then(function(response) {                
                $scope.garage_sale.id = response.data.id;
                uploader.uploadAll();
            }).then(function(resp){
                var newPath = $location.path();
                newPath = newPath.replace('new',$scope.garage_sale.id)
               // $window.location = newPath; 
                // this callback will be called asynchronously
                // when the response is available
                console.log(response);
              }, function(response) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.
            });
        }

        // FILTERS

        uploader.filters.push({
            name: 'customFilter',
            fn: function(item /*{File|FileLikeObject}*/, options) {
                return this.queue.length < 10;
            }
        });

        // CALLBACKS

        uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
            //console.info('onWhenAddingFileFailed', item, filter, options);
        };
        uploader.onAfterAddingFile = function(fileItem) {
            //console.info('onAfterAddingFile', fileItem);
        };
        uploader.onAfterAddingAll = function(addedFileItems) {
            //console.info('onAfterAddingAll', addedFileItems);
        };
        uploader.onBeforeUploadItem = function(item) {
           item = item.file;
           item.garage_sale_id = 'gkjfghjf';
           item.url = '/api/pictures/pictures'
           console.log(item);
           console.log('SHITS ABOUT TO GET UPLOADED!!!');
        };
        uploader.onProgressItem = function(fileItem, progress) {
           // console.info('onProgressItem', fileItem, progress);
        };
        uploader.onProgressAll = function(progress) {
           // console.info('onProgressAll', progress);
        };
        uploader.onSuccessItem = function(fileItem, response, status, headers) {
            console.info('onSuccessItem', fileItem, response, status, headers);
        };
        uploader.onErrorItem = function(fileItem, response, status, headers) {
           //console.info('onErrorItem', fileItem, response, status, headers);
        };
        uploader.onCancelItem = function(fileItem, response, status, headers) {
           // console.info('onCancelItem', fileItem, response, status, headers);
        };
        uploader.onCompleteItem = function(fileItem, response, status, headers) {
          // console.info('onCompleteItem', fileItem, response, status, headers);
        };
        uploader.onCompleteAll = function() {
            console.info('onCompleteAll');
        };

        console.info('uploader', uploader);
    }]);