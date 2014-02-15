App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Grid extends Marionette.Layout
    template: templates.grid_layout
