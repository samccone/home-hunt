class window.Controller extends Marionette.Controller
  home: ->
    App.OverlayRegion.show new App.Views.Locating
