App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeDetail extends Marionette.Layout
    template: templates.home_detail
    className: 'home-detail'
    regions:
      "homeScoreRegion": '.home-score-steps'

    ui:
      "map": '.home-location'

    events: ->
      "click .close": @close

    serializeData: ->
      details: @model.get('details')

    onShow: ->
      $(window).on 'keydown', (e) => @close() if e.keyCode is 27

      $('html').addClass 'detail-view'
      @initialScroll = window.scrollY
      window.scroll(0, 0)
      @homeScoreRegion.show new Views.HomeScorer({
        model: @model
      })

    onClose: ->
      $(window).off 'keydown'
      $('html').removeClass 'detail-view'
      window.scroll(0, @initialScroll)

    onDomRefresh: ->
      # style here http://gmaps-samples-v3.googlecode.com/svn/trunk/styledmaps/wizard/index.html
      location  = encodeURIComponent(@model.get('details')['address'])
      @ui.map.css
        'background-image': "url(http://maps.googleapis.com/maps/api/staticmap?center=#{location}&zoom=13&size=440x90&scale=2&maptype=roadmap&sensor=false&style=hue:0x0091ff|visibility:on|weight:0.1)"
