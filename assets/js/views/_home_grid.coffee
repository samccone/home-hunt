App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGrid extends Marionette.CollectionView
    tagName: 'ul'
    getItemView: -> Views.HomeGridItem

    addItemView: (model) ->
      super if model.shouldShow()

    onDomRefresh: ->
      @$('.lazy').show().lazyload()
