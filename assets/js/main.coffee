#=require _application
#=require _router
#=require _controllers
#=require_tree views
#=require_tree utils

App.on 'initialize:after', ->
  App.addRegions
    'AppRegion': '#app'

  App.Router = new Router(controller: new Controller)
  Backbone.history.start(pushState: true)

$ -> App.start()
