App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.EmptyHomeGrid extends Marionette.ItemView
    tagName: 'li'
    template: templates.empty_home_grid