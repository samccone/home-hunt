App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeScorer extends Marionette.Layout
    className: 'small-contain contain home-score-tool'
    template: templates.home_score_tool,
    step: 0,
    steps: ['HomeBasics', 'EnergyPrices', 'BuildingDesign', 'Score'],

    regions:
      stepRegion: '.current-step'

    initialize: ->
      App.vent.on 'advanceSection', =>
        ++@step
        @showSection()

    onShow: ->
      @showSection()

    showSection: ->
      @stepRegion.show new Views[@steps[@step]](model: @options.model)