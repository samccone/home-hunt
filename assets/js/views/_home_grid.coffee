App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGrid extends Marionette.CollectionView
    getEmptyView: -> Views.EmptyHomeGrid
    tagName: 'ul'
    getItemView: -> Views.HomeGridItem

    initialize: ->
      @demographics = @options.demographics

    addItemView: (model, view, index) ->
      d = @demographics
      if index is 3
        @elBuffer.appendChild $(templates.commute_time({time: d.get('commuteTime')}))[0]

      if index is 5
        @energyTrends = new Views.EnergyTrends
        @elBuffer.appendChild @energyTrends.render().el
        @elBuffer.appendChild $(templates.energy_fact())[0]

      if index is 6
        @elBuffer.appendChild new Views.WalkScore({
          model: d
        }).render().el

      if index is 10
        @elBuffer.appendChild $(templates.family_size({size: parseFloat(d.get('familySize'))}))[0]

      if index is 13
        @elBuffer.appendChild $(templates.old_homes({percent: d.get('homesBuildBefore1900')}))[0]

      if model.shouldShow?()
        super

    onDomRefresh: ->
      @energyTrends?.triggerMethod('show')

