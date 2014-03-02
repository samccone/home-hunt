App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Home extends Backbone.Model
    url: -> "#{App.Utils.API.homeUrlRoot()}#{@getZillowId()}"

    parse: (d) ->
      if d['SearchResults:searchresults']?
        @set 'details', d['SearchResults:searchresults']['response'][0]['results'][0]['result'][0]

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
