App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeGridItem extends Marionette.ItemView
    template: templates.home_grid_item
    className: 'tile third home'
    tagName: 'li'
    events: ->
      "click .overlay": @getDetails
      "click .bottom-meta-info": @getDetails

    serializeData: ->
      _.extend {}, @model.attributes,
        homeSqFt: @model.getSqFt()
        homeBath: @model.getBath()
        homeBed: @model.getBed()
        homeImage: @model.getImage()
        homePrice: @model.getCost()

    modelEvents: ->
      "change:energyCost": ->
        @$('.monthly-summary').html templates.energy_cost(@serializeData())

    getDetails: ->
      App.execute 'showDetails', @model

    onShow: ->
      @$('.lazy').show().lazyload()
      @$('input').on 'change', (e) =>
        unless FileReader
          alert "Your browser does not support this feature. Try in Chrome."
          return

        f = new FileReader()

        f.onload = (e) =>
          r = $.xml2json(e.target.result).feed.entry.slice(4)
          length = r.length - 1

          avgCost = _(r).map((v) ->
            parseInt(v.content.IntervalBlock?.IntervalReading.cost, 10)
          ).compact().reduce((m, v) -> m+=v).valueOf()

          @model.set 'energyCost', (""+~~(avgCost/length)).slice(0,3)

        f.readAsText(arguments[0].originalEvent.target.files[0])
