var blogApp = angular.module('blogApp', [
    'ngRoute', 'ngAnimate',  'blogDirectices','blogCtrls','blogServices','ngCookies','ngSanitize'
]);

blogApp.config(function($routeProvider) {
    $routeProvider.when('/hello', {
        templateUrl: 'tpls/hello.jsp',
        controller: 'HelloCtrl'
    }).when('/index', {
        templateUrl: 'tpls/blog-index.jsp',
        controller: 'pageCtrl'
    }).when('/newblog', {
        templateUrl: 'tpls/blog-create.jsp',
        controller: 'blogCtrl'
    }).when('/detail', {
        templateUrl: 'tpls/blog-detail.jsp',
        controller: 'detailCtrl'
    }).when('/message', {
        templateUrl: 'tpls/blog-message.jsp',
        controller: 'messageCtrl'
    }).otherwise({
        redirectTo: '/hello'
    });
});
