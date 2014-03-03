App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.EnergyTrends extends Marionette.ItemView
    className: 'energy-trends tile full'
    template: templates.energy_trends
    events: ->
      'click li': @toggleChartLine

    toggleChartLine: (e) ->
      $t = $(e.currentTarget)
      index = null

      _.each @chartData, (d, i) ->
        if ~d.id.indexOf($t.data('id'))
          index = i

      $("[class*='#{$t.data('id')}']").toggle()
      @chart.redrawLine(index)
      $t.toggleClass 'disabled'

    onShow: ->
      App.Utils.API.getTrends().then (d) =>
        r = _.map(d, (v) ->
          id: v.series[0].series_id
          data: _.map(v.series[0].data, (vv) -> parseFloat(vv[1])).reverse()
        )

        @chartData = r
        @chart = new App.Utils.LineChart(r)

