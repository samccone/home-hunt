App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGridItem extends Marionette.ItemView
    template: templates.home_grid_item
    templateHelpers: ->
      homeImage: @model.getImage()
      homePrice: @model.getCost()

    onDomRefresh: ->
      @$('.lazy').show().lazyload()
