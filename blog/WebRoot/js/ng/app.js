var bookStoreApp = angular.module('bookStoreApp', [
    'ngRoute', 'ngAnimate', 'bookStoreCtrls', 'bookStoreFilters',
    'bookStoreServices', 'bookStoreDirectives'
]);

bookStoreApp.config(function($routeProvider) {
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
