(function () {
    angular.module('application').service('Application', [
        '$window',

        function ($window) {
            return $window.Application;
        }
    ]);
})()
