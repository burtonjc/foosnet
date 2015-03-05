(function () {
    angular.module('application').controller('NavigationController', [
        'Application',

        function (Application) {
            console.log(Application);
        }
    ])
})()
