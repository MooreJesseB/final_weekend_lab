hangman = angular.module "hangman", []

hangman.controller "IndexCtrl", ["$scope", ($scope) -> 

  $scope.alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split ""

  init = ->
    $scope.active = false

    $scope.hideButton = true
    $scope.hideSecret = true
    $scope.message = "Start a new game!"
    $scope.alert = false
    $scope.placeholder = ""
    $scope.canvas = false


  init()

  start = ->
    $scope.man = []
    $scope.man.push false
    $scope.man.push false
    $scope.man.push false
    $scope.man.push false
    $scope.man.push false
    $scope.man.push false

    $scope.counter = 0
    $scope.win = false
    $scope.lose = false
    $scope.secret = false
    $scope.guessed = []
    $scope.hideButton = false
    $scope.canvas = true

  $scope.setSecret = (word) ->

    start()
    $scope.secret = word.toUpperCase().split ""
    $scope.hideSecret = true
    $scope.word = null

    checkGuessed()

  $scope.letterSubmit = (letter) ->
    if $scope.active == true
      this.hideButton = true
      console.log letter
      if contains(letter, $scope.secret)
        console.log "found a letter!"
        $scope.guessed.push letter
      else
        $scope.man[$scope.counter] = true
        $scope.counter++

      checkGuessed()
      checkGame()

  $scope.startGame = ->
      init()
      $scope.alert = true
      $scope.hideSecret = false
      $scope.active = true
      setTimeout ->
        angular.element("#focus-me").trigger "focus"
        
      , 0
      

  checkGuessed = ->
    $scope.placeholder = ""
    $scope.secret.forEach (item) ->
      console.log item
      if contains(item, $scope.guessed)
        $scope.placeholder += (item)
      else
        $scope.placeholder += "_ "

  checkGame = ->
    console.log "$scope secret array"
    console.log $scope.secret
    console.log "secret string"
    console.log $scope.secret.join("")
    console.log "Guessed array"
    console.log $scope.guessed
    console.log "guessed joined"
    console.log $scope.guessed.join("")
    if $scope.secret.join("") == $scope.placeholder
      $scope.active = false
      $scope.message = "You win!"
      $scope.alert = false
    else if $scope.counter >= 5
      $scope.active = false
      $scope.message = "You lose!"
      $scope.alert = false
]

contains = (item, array) ->
  tempBool = false
  if array.length > 0
    array.forEach (x) ->
      if item == x
        tempBool = true
  return tempBool