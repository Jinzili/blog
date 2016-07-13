var blogApp = angular.module('blogApp', [
    'ngRoute', 'ngAnimate',  'blogDirectices','blogCtrls','blogServices'
]);

blogApp.config(function($routeProvider) {
    $routeProvider.when('/hello', {
        templateUrl: 'tpls/hello.jsp',
        controller: 'HelloCtrl'
    }).when('/index', {
        templateUrl: 'tpls/blog-index.jsp',
        controller: 'pageCtrl'
    }).when('/newblog', {
        templateUrl: 'tpls/newblog.jsp',
        controller: 'blogCtrl'
    }).otherwise({
        redirectTo: '/hello'
    });
});
