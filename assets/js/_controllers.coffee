class window.Controller extends Marionette.Controller
  home: ->
    App.reqres.setHandler 'zip', -> "02906"
    App.reqres.setHandler 'city', -> "Providence"
    App.reqres.setHandler 'state', -> "RI"

    $('.blue-header .background').css
      'background-image':  "url(http://maps.googleapis.com/maps/api/staticmap?center=#{App.request('zip')}&zoom=9&size=650x150&scale=2&maptype=roadmap&sensor=false&style=hue:0x0091ff|visibility:on|weight:0.1)"

    App.OverlayRegion.reset()
    App.AppRegion.show new App.Views.Grid
    App.SearchRegion.show new App.Views.Search
