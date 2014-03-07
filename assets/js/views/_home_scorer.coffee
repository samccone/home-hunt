App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeScorer extends Marionette.Layout
    className: 'small-contain contain home-score-tool'
    template: templates.home_score_tool,
    step: 0,
    steps: ['HomeBasics', 'EnergyPrices', 'BuildingDesign', 'Score'],

    regions:
      stepRegion: '.current-step'

    onShow: ->
      @stepRegion.show new Views[@steps[@step]]