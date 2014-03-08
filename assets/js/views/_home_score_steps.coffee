App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeScoreBase extends Marionette.ItemView
    className: 'home-score-segment'
    serializeData: ->
      address: @model.get('details').address

    events: ->
      "click .jump-section": @advance

    advance: ->
      App.vent.trigger 'advanceSection'

  class Views.HomeBasics extends Views.HomeScoreBase
    template: templates.home_basics
    onRender: ->
      @$('#state').val(@model.getState())

  class Views.EnergyPrices extends Views.HomeScoreBase
    template: templates.energy_prices

  class Views.BuildingDesign extends Views.HomeScoreBase
    template: templates.building_design

  class Views.Score extends Views.HomeScoreBase
    template: templates.home_score