App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.EnergyTrends extends Marionette.ItemView
    template: templates.energy_trends
    onShow: ->
      new App.Utils.LineChart([
            [2,5,7,3,15,4, 15, 2, 10, 10, 20, 6, 30, 10, 20],
            [2,5,2,3,2,4, 2, 2, 10, 10, 20, 50, 30, 60, 20],
            [90,10,5,100]
          ])
