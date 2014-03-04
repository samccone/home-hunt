App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeDetail extends Marionette.Layout
    template: templates.home_detail
    className: 'home-detail'
    ui:
      "map": '.home-location'

    events: ->
      "click .close": @close

    serializeData: ->
      details: @model.get('details')

    onDomRefresh: ->
      # style here http://gmaps-samples-v3.googlecode.com/svn/trunk/styledmaps/wizard/index.html
      a = @model.get('details')['address'][0]
      location = "#{a.latitude[0]},#{a.longitude[0]}"
      marker    = "&markers=color:blue%7C#{location}"
      @ui.map.attr 'src', "http://maps.googleapis.com/maps/api/staticmap?center=#{location}&zoom=15&size=650x150&scale=2&maptype=roadmap&sensor=false&style=hue:0x0091ff|visibility:on|weight:0.1#{marker}"