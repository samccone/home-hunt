App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeScorer extends Marionette.Layout
    className: 'small-contain contain home-score-tool'
    template: templates.home_score_tool