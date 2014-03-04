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
      a = @model.get('details')['address']

      map = L.mapbox.map(@ui.map[0], 'snowcast.hdnkboal')
        .setView([a['latitude'], a['longitude']], 6)

      map.dragging.disable()
      map.touchZoom.disable()
      map.doubleClickZoom.disable()
      map.scrollWheelZoom.disable()
      # disable tap handler, if present.
      map.tap.disable() if map.tap?