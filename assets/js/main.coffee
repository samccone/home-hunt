#=require _application
#=require _router
#=require _controllers
#=require_tree models
#=require_tree collections
#=require_tree views
#=require_tree utils

App.on 'initialize:after', ->
  App.addRegions
    'AppRegion': '#app'
    'OverlayRegion' : '.app-overlay'
    'SearchRegion': '.search-container'

  App.reqres.setHandler 'maxHomes', -> 20
  App.Router = new Router(controller: new Controller)
  Backbone.history.start(pushState: true)

  App.commands.setHandler 'showDetails', (d) ->
    d.fetch()
    d.once 'sync', ->
      App.OverlayRegion.show new App.Views.HomeDetail(model: d)

$ -> App.start()
