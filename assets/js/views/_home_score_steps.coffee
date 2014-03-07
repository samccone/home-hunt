App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeBasics extends Marionette.ItemView
    className: 'home-score-segment'
    template: templates.home_basics

  class Views.EnergyPrices extends Marionette.ItemView
    className: 'home-score-segment'
    template: templates.energy_prices

  class Views.BuildingDesign extends Marionette.ItemView
    className: 'home-score-segment'
    template: templates.building_design

  class Views.Score extends Marionette.ItemView
    className: 'home-score-segment'
    template: templates.home_score