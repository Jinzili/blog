var blogServices = angular.module('blogServices', []);

blogServices.service('pageService', ['$http',
    function($http) {
		this.list = function(postData){
			return $http.post('/blog/blog/getAllBlogs', postData);
		};
	}
]);

blogServices.service('bookStoreService_2', ['$scope',
    function($scope) {}
]);
