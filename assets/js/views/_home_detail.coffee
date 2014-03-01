App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeDetail extends Marionette.Layout
    template: templates.home_detail
