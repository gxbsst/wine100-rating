APP.controller 'MainController', ($scope, $window, $document, $http) ->

  $scope.hover = {}
  $scope.award_value = {}
  $scope.final_award_value = {}
#  $scope.final_award_value[96]=2
  $scope.award = (wine_id, award) ->
    $http.post('/awards.json', { wine_id: wine_id, 'award': award}, {cache: false})
    .success((data, status, headers, config) ->
      $scope.award_value[wine_id] = data.award
    )
    .error((data, status, headers, config) ->
      alert(status)
    )

  $scope.finalAward = ( wine_id, final) ->
    $http.post('/final_awards.json', { wine_id: wine_id, final: final}, {cache: false})
    .success((data, status, headers, config) ->
      $scope.final_award_value[wine_id] = data.final
    )
    .error((data, status, headers, config) ->
      alert(status)
    )


