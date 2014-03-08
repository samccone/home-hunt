App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeScorer extends Marionette.Layout
    className: 'small-contain contain home-score-tool'
    template: templates.home_score_tool
    steps: ['HomeBasics', 'EnergyPrices', 'BuildingDesign', 'Score']
    step: 0
    ui:
      inputPrompt: '.score-helper-prompt'

    regions:
      stepRegion: '.current-step'

    initialize: ->
      @listenTo App.vent, 'advanceSection', =>
        ++@step
        @showSection()

    onShow: ->
      @showSection()

    showSection: ->
      @ui.inputPrompt.hide() if @step is @steps.length-1

      @stepRegion.show new Views[@steps[@step]](model: @model)