App.module "Models", (Models, App, Backbone, Marionette, $, _) ->
  class Models.Home extends Backbone.Model
    hasImage: ->
      @attributes[7][5]?

    getImage: ->
      @attributes[7][5].replace('p_a', 'p_d')

    getCost: ->
      @attributes[3]
