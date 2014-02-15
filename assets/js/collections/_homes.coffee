App.module "Collections", (Collections, App, Backbone, Marionette, $, _) ->
  class Collections.Homes extends Backbone.Collection
    model: App.Models.Home
