APP.controller 'MainController', ($scope, $window, $document, $http) ->

  $scope.award_value = {}
  $scope.final_award_value = {}
#  $scope.final_award_value[96]=2
  $scope.award = (user_id, wine_group_item_id, award) ->
    $http.post('/awards.json', {'refinery_member_id': user_id, 'wine_group_item_id': wine_group_item_id, 'award': award}, {cache: false})
    .success((data, status, headers, config) ->
      $scope.award_value[wine_group_item_id] = data.award
    )
    .error((data, status, headers, config) ->
      alert(status)
    )
