App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeDetail extends Marionette.Layout
    template: templates.home_detail
    className: 'home-detail'
    events: ->
      "click .close": @close

    serializeData: ->
      details: @model.get('details')