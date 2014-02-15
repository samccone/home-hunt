App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.EnergyTrends extends Marionette.ItemView
    template: templates.energy_trends
    onShow: ->
      App.Utils.API.getTrends().then (d) ->
        r = _.map(d, (v) ->
          id: v.series[0].series_id
          data: _.map(v.series[0].data, (vv) -> parseFloat(vv[1]))
        )

        new App.Utils.LineChart(r.map (v) -> v.data.reverse())
