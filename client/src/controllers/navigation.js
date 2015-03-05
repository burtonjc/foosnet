(function () {
    angular.module('application').controller('NavigationController', [
        '$scope',
        'Application',

        function ($scope, Application) {
            $scope.user = Application.session.user;
        }
    ]);
})();
