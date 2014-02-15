App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.Locating extends Marionette.Layout
    template: templates.locating

    onShow: ->
      @getLocation()

    getLocation: ->
      navigator.geolocation.getCurrentPosition  (p) ->
        geocoder = new google.maps.Geocoder()
        latlng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude)


        geocoder.geocode {'latLng': latlng}, (r) ->
          zip   = r[0].address_components[7].short_name
          state = r[0].address_components[5].short_name

          App.reqres.setHandler 'zip', -> zip
          App.reqres.setHandler 'state', -> state

          App.AppRegion.show new App.Views.Grid
