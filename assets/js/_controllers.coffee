class window.Controller extends Marionette.Controller
  home: ->
    App.AppRegion.show new App.Views.Grid
