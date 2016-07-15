var blogServices = angular.module('blogServices', []);

blogServices.service('pageService', ['$http',
    function($http) {
		this.list = function(postData){
			return $http.post('/blog/blog/getAllBlogs', postData);
		};
		this.validate = function(input){
			return $http.post('/blog/blog/validate',input);
		};
		this.createBlog = function(formData){
			return $http.post('/blog/blog/createBlog',formData);
		};
		this.uploadImg = function(blogId){
			var fd = new FormData();
			var file = document.querySelector('input[type=file]').files[0];
			fd.append('blogId',blogId);
			fd.append('img', file); 
			return $http({
				method:'POST',
				url:"/blog/blog/uploadImg",
				data: fd,
				headers: {'Content-Type':undefined},
				transformRequest: angular.identity 
			});
		};
		
		this.getBlogDetail = function(blogId){
			return $http.post('/blog/blog/getBlogDetail',blogId);
		};
	}
]);

blogServices.service('dataService',function(){
	var Data = {};
	this.setData = function(storedata){
		console.log(storedata);
		Data = storedata;
	};
	
	this.getData = function(){
		return Data;
	};
});