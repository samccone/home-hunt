App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Grid extends Marionette.Layout
    template: templates.grid_layout
    regions:
      'homes': '.homes'
      'energyTrends': '.energy-trends'

    initialize: ->
      @homeList     = new App.Collections.Homes([])
      @demograpics  = null

      App.Utils.API.getDemographics().then (d) =>
        tables = d['Demographics:demographics'].response[0].pages[0].page[2].tables[0].table[0].data[0].attribute
        @commuteTime = tables[6].values[0].nation[0].value[0]
        @familySize = tables[5].values[0].nation[0].value[0]
        @homesBuildBefore1900 = d['Demographics:demographics'].response[0].pages[0].page[1].tables[0].table[1].data[0].attribute[0].value[0]["_"]

        console.log @commuteTime, @familySize, @homesBuildBefore1900

      App.Utils.API.getHomes().then (d) =>
        @homeList.reset d.map.properties

    onShow: ->
      @homes.show new Views.HomeGrid({collection: @homeList})
      @energyTrends.show new Views.EnergyTrends
