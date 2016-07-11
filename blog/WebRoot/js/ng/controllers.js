var blogCtrls = angular.module('blogCtrls', ['tm.pagination']);

blogCtrls.controller('HelloCtrl', ['$scope',
    function($scope) {
       
    }
]);

blogCtrls.controller('pageCtrl', ['$scope','pageService',
    function($scope,pageService) {
		var GetAllBlog = function () {
			 
	        var postData = {
	            pageIndex: $scope.paginationConf.currentPage,
	            pageSize: $scope.paginationConf.itemsPerPage
	        }
	
	        pageService.list(postData).success(function (response) {
	            $scope.paginationConf.totalItems = response.count;
	            $scope.persons = response.items;
	        });
	
	    }
	
	    //配置分页基本参数
	    $scope.paginationConf = {
	        currentPage: 1,
	        itemsPerPage: 9
	    };
	
	    /***************************************************************
	    当页码和页面记录数发生变化时监控后台查询
	    如果把currentPage和itemsPerPage分开监控的话则会触发两次后台事件。 
	    ***************************************************************/
	    	$scope.$watch('paginationConf.currentPage + paginationConf.itemsPerPage', GetAllBlog);
	    }
]);

