App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGrid extends Marionette.CollectionView
    tagName: 'ul'
    getItemView: -> Views.HomeGridItem

    addItemView: (model, view, index) ->
      if index is 3
        @elBuffer.appendChild $(templates.commute_time({time: @commuteTime}))[0]

      if index is 7
        @elBuffer.appendChild $(templates.energy_fact())[0]
        @elBuffer.appendChild $(templates.family_size({size: parseFloat(@familySize)}))[0]

      if index is 8
        @elBuffer.appendChild $(templates.old_homes({percent: @homesBuildBefore1900}))[0]

      if model.shouldShow()
        super

    setDemographics: (@commuteTime, @familySize, @homesBuildBefore1900) ->

    onDomRefresh: ->
      @$('.lazy').show().lazyload()
