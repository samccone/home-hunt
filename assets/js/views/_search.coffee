App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Search extends Marionette.Layout
    template: templates.search
    ui:
      locateButton: ".near-me"

    onShow: ->
      $('.blue-header .background').css
        'background-image':  "url(http://maps.googleapis.com/maps/api/staticmap?center=#{App.request('location').get('zip')}&zoom=9&size=650x150&scale=2&maptype=roadmap&sensor=false&style=hue:0x0091ff|visibility:on|weight:0.1)"

    events: ->
      "click @ui.locateButton": @locate

    locate: ->
      App.OverlayRegion.show new App.Views.Locating
      @ui.locateButton.hide()

    serializeData: ->
      _.extend({}, App.request('location').attributes)