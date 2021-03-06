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
          offset = if r[0].address_components[7]? then 0 else -1
          zip    = r[0].address_components[7+offset].short_name
          city   = r[0].address_components[3+offset].long_name
          state  = r[0].address_components[5+offset].short_name

          App.request('location').set({
            'zip'   : zip
            'city'  : city
            'state' : state
          })

          App.OverlayRegion.reset()
          App.AppRegion.show new App.Views.Grid
          App.SearchRegion.show new App.Views.Search