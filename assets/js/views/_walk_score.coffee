App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.WalkScore extends Marionette.ItemView
    tagName: 'li'
    className: 'tile third demographic walk-score'
    template: templates.walk_score
    initialize: ->
      App.Utils.API.getWalkScore(@model.get('latitude'), @model.get('longitude')).then (d) =>
        @model.set 'walkScoreInfo': d

    modelEvents: ->
      "change:walkScoreInfo": @render

    serializeData: ->
      label: @model.get('walkScoreInfo')?.description
      score: @model.get('walkScoreInfo')?.walkscore