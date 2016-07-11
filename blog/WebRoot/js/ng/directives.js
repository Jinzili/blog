var blogDirectices = angular.module('blogDirectices', []);

blogDirectices.directive(
        "headerBg",
        function( $interval ) {
            //将用户界面的事件绑定到$scope上
            function link( $scope, element, attributes ) {
            	var i = "0" + Math.ceil(Math.random()*9);
        		element.css("background-image","url('http://blog.dandyweng.com/wp-content/themes/albatross/images/overlay.png'),url('http://blog.dandyweng.com/wp-content/themes/albatross/backgrounds/"+ i +".jpg')");
                //当timeout被定义时，它返回一个promise对象
            	var timer = $interval(function(){
            		var i = "0" + Math.ceil(Math.random()*9);
            		element.css("background-image","url('http://blog.dandyweng.com/wp-content/themes/albatross/images/overlay.png'),url('http://blog.dandyweng.com/wp-content/themes/albatross/backgrounds/"+ i +".jpg')");
            	},3000);
            };
          return({
                link: link,
                scope: false
            });

        }
);

blogDirectices.directive(
        "ngHeight",
        function() {
            //将用户界面的事件绑定到$scope上
            function link( $scope, element, attributes ) {
            	var height = document.documentElement.clientHeight;
            	element.css("height",""+height+"px");
            };
          return({
                link: link,
                scope: false
            });

        }
);