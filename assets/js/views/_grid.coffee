App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Grid extends Marionette.Layout
    template: templates.grid_layout
    regions:
      'homes': '.homes'

    initialize: ->
      @homeList = new App.Collections.Homes([])
      App.Utils.API.getHomes().then (d) =>
        @homeList.reset d.map.properties

    onShow: ->
      @homes.show(
        new Views.HomeGrid({collection @homeList})
      )
