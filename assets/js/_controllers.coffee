class window.Controller extends Marionette.Controller
  home: ->
    App.LoadingRegion.show new App.Views.Locating
