App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.EnergyTrends extends Marionette.ItemView
    template: templates.energy_trends
    events: ->
      'click li': @toggleChartLine

    toggleChartLine: (e) ->
      $t = $(e.currentTarget)
      index = @chartData.indexOf(_.findWhere(@chartData,
        id: $t.data('id')
      ))

      $(".line#{index}").toggle()
      @chart.redrawLine(index)
      $t.toggleClass 'disabled'

    onShow: ->
      App.Utils.API.getTrends().then (d) =>
        r = _.map(d, (v) ->
          id: v.series[0].series_id
          data: _.map(v.series[0].data, (vv) -> parseFloat(vv[1]))
        )

        @chartData = r
        @chart = new App.Utils.LineChart(r.map (v) -> v.data.reverse())

