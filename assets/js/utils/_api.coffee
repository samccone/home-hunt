App.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  base = "http://localhost:3333/"
  Utils.API =
    getHomes: ->
      $.getJSON("#{base}homes/#{App.request('zip')}?callback=?")

    getDemographics: ->
      $.getJSON("#{base}demographics/#{App.request('zip')}?callback=?")

    getTrends: ->
      $.getJSON("#{base}trends/#{App.request('state')}?callback=?")
