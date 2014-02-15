App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGridItem extends Marionette.ItemView
    template: templates.home_grid_item
    serializeData: ->
      homeSqFt: @model.getSqFt()
      homeBath: @model.getBath()
      homeBed: @model.getBed()
      homeImage: @model.getImage()
      homePrice: @model.getCost()
