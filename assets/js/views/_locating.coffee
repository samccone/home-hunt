App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Locating extends Marionette.Layout
    template: templates.locating

    onShow: ->
      @getLocation()

    getLocation: ->
      # navigator.geolocation.getCurrentPosition  (p) ->
      #   geocoder = new google.maps.Geocoder()
      #   latlng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude)


      #   geocoder.geocode {'latLng': latlng}, (r) ->
      #     offset = if r[0].address_components[7]? then 0 else -1
      #     zip    = r[0].address_components[7+offset].short_name
      #     state  = r[0].address_components[5+offset].short_name

      App.reqres.setHandler 'zip', -> "02906"
      App.reqres.setHandler 'state', -> "RI"
      $('.blue-header .background').css
        'background-image':  "url(http://maps.googleapis.com/maps/api/staticmap?center=#{App.request('zip')}&zoom=9&size=650x150&scale=2&maptype=roadmap&sensor=false&style=hue:0x0091ff|visibility:on|weight:0.1)"

      App.OverlayRegion.reset()
      App.AppRegion.show new App.Views.Grid