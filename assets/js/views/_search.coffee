App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Search extends Marionette.Layout
    template: templates.search
    ui:
      locateButton: ".near-me"

    events: ->
      "click @ui.locateButton": @locate

    locate: ->
      App.OverlayRegion.show new App.Views.Locating
      @ui.locateButton.hide()

    serializeData: ->
      city: App.request('city')
      state: App.request('state')