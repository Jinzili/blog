var blogCtrls = angular.module('blogCtrls', ['tm.pagination']);

blogCtrls.controller('HelloCtrl', ['$scope',
    function($scope) {
	 $scope.pageClass="hello";
    }
]);

blogCtrls.controller('pageCtrl', ['$scope','pageService','$location',
    function($scope,pageService,$location) {
		var GetAllBlog = function () {
			 
	        var postData = {
	            pageIndex: $scope.paginationConf.currentPage,
	            pageSize: $scope.paginationConf.itemsPerPage
	        };
	
	        pageService.list(postData).success(function (response) {
	            $scope.paginationConf.totalItems = response.count;
	            $scope.blogs = response.items;
	        });
	
	    };
	
	    //配置分页基本参数
	    $scope.paginationConf = {
	        currentPage: 1,
	        itemsPerPage: 9,
	        perPageOptions: [9],
	    };
	
	    /***************************************************************
	    当页码和页面记录数发生变化时监控后台查询
	    如果把currentPage和itemsPerPage分开监控的话则会触发两次后台事件。 
	    ***************************************************************/
    	$scope.$watch('paginationConf.currentPage + paginationConf.itemsPerPage', GetAllBlog);
    	$scope.$watch(function(){
    		   return document.documentElement.clientHeight;
    		}, function(value) {
    		        angular.element(".myself").css("height",""+value+"px");
    		        angular.element(".right-box").css("height",""+value+"px");
    		  }
    	);
    	
    	$scope.validateKeyUp = function(e){
            var keycode = window.event?e.keyCode:e.which;
            if(keycode==13){
                $scope.validate();
            }
        };
    	
    	//验证密码
    	$scope.password = "";
    	$scope.validate = function(){
    		var input = $scope.password;
    		if(input == "" || input == null){
    			$scope.error = "请输入密码";
    		}else{
    			pageService.validate(input).success(function(response){
    				if(response.data == "true"){
    					$('#pwdBox').modal('hide');
    					$('#pwdBox').on('hidden.bs.modal', function (e) {
    						$location.path("/newblog");
						});
    				}else{
    					$scope.error = "密码错误";
    				}
    			});
    		}
    	};
    	
    	 
  	}
]);

blogCtrls.controller('blogCtrl', [ '$scope', 'pageService','$location',
   function($scope,pageService,$location) {
		//富文本编辑器
		var editor = new Simditor({
			  textarea: $('#editor'),
			  placeholder:'博客内容'
		});
		
		$scope.formData={
		};
		
		var blogId = 0;
		
		$scope.createNewBlog = function(isValid){
			$scope.formData.content = editor.sync();
			
			if(isValid){
				if($scope.formData.content == "" || $scope.formData.content == null){
					$scope.error="内容必填";
					return ;
				}
                pageService.createBlog($scope.formData).success(function(response){
        			if(response.status == 200){
        				blogId = response.data;
        				angular.element("#imgBox").modal('show');
        			}
        		});
            }else{
                $scope.error="标题、摘要必填";
            }
		};
		
		
		
		$scope.uploadImg = function(){
			var file = document.querySelector('input[type=file]').files[0];
			if(file == undefined){
				$('#imgBox').modal('hide');
				$('#imgBox').on('hidden.bs.modal', function (e) {
					$location.path("/index");
				});
				return ;
			}
			pageService.uploadImg(blogId).success(function(response){
				if(response.status == 200){
					$('#imgBox').modal('hide');
					$('#imgBox').on('hidden.bs.modal', function (e) {
						$location.path("/index");
					});
				}else{
					if(response.msg == "ext_failed"){
						$scope.uploadfailed = "上传文件格式不符合";
					}else{
						$scope.uploadfailed = "服务器异常";
					}
				}
			});
		};
	} 
]);
