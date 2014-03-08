class window.Controller extends Marionette.Controller
  home: ->
    location = new Backbone.Model(
      'zip'   : "02906"
      'city'  : "Providence"
      'state' : "RI"
    )

    App.reqres.setHandler 'location', -> location

    App.OverlayRegion.reset()
    App.AppRegion.show new App.Views.Grid
    App.SearchRegion.show new App.Views.Search
