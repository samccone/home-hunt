App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Grid extends Marionette.Layout
    template: templates.grid_layout
    regions:
      'homes': '.homes'

    initialize: ->
      @homeList     = new App.Collections.Homes([])
      demographics  = new Backbone.Model

      App.reqres.setHandler 'demographics', -> demographics

      queries = $.when(App.Utils.API.getDemographics(), App.Utils.API.getHomes())

      queries.then (d, homes) =>
        base    = d[0]['Demographics:demographics'].response[0]
        tables  = base.pages[0].page[2].tables[0].table[0].data[0].attribute
        demographics.set
          commuteTime: tables[6].values[0].nation[0].value[0]
          familySize: tables[5].values[0].nation[0].value[0]
          homesBuildBefore1900: d[0]['Demographics:demographics'].response[0].pages[0].page[1].tables[0].table[1].data[0].attribute[0].value[0]["_"]
          latitude: base['region'][0]['latitude'][0]
          longitude: base['region'][0]['longitude'][0]


        @homeList.reset homes[0].map.properties.slice(0, App.request('maxHomes'))

    onShow: ->
      @homes.show new Views.HomeGrid
        collection: @homeList
        demographics: App.request('demographics')
