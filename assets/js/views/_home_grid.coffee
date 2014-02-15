App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGrid extends Marionette.CollectionView
    getItemView: -> Views.HomeGridItem
