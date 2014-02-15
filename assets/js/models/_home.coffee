App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Home extends Backbone.Model
    getBed: ->
      @attributes[7][1]

    getBath: ->
      @attributes[7][2]

    getSqFt: ->
      @attributes[7][3]

    hasImage: ->
      @attributes[7][5]?

    getImage: ->
      @attributes[7][5].replace('p_a', 'p_d')

    getCost: ->
      @attributes[3]
