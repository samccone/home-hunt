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

  App.reqres.setHandler 'maxHomes', -> 20
  App.Router = new Router(controller: new Controller)
  Backbone.history.start(pushState: true)

$ -> App.start()
