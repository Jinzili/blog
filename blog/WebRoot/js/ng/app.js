var blogApp = angular.module('blogApp', [
    'ngRoute', 'ngAnimate',  'blogDirectices','blogCtrls','blogService'
]);

blogApp.config(function($routeProvider) {
    $routeProvider.when('/hello', {
        templateUrl: 'tpls/hello.jsp',
        controller: 'HelloCtrl'
    }).when('/index', {
        templateUrl: 'tpls/blog-index.jsp',
        controller: 'BookListCtrl'
    }).otherwise({
        redirectTo: '/hello'
    });
});
