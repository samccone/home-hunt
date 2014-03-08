App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Home extends Backbone.Model
    url: -> "#{App.Utils.API.homeUrlRoot()}#{@getZillowId()}"

    parse: (d) ->
      if zillowLabel = d.address.indexOf('is For Sale - Zillow')
        @set 'details',
          address: d.address.substring(0, zillowLabel)
      else
        @set 'details', d

    getState: ->
      @get('details').address.split(',')[2].split(" ")[1]

    getBed: ->
      @attributes[7][1]

    getBath: ->
      @attributes[7][2]

    getSqFt: ->
      @attributes[7][3]

    shouldShow: ->
      @attributes[7][5]? and @getSqFt()?

    getImage: ->
      @attributes[7][5].replace('p_a', 'p_d')

    getCost: ->
      @attributes[3]

    getZillowId: ->
      @attributes[0]

    getHESScore: ->
      $.post "#{App.Utils.API.HESScoreUrl()}", {
        zip: App.request('zip')
        inputs: @get('HES_Fields')
      }, (d) =>
        @set('HESResults', d)