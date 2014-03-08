App.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  base = "http://house-hunt-api.nodejitsu.com/"
    HESScoreUrl: -> "#{base}score/"
  Utils.API =
    homeUrlRoot: -> "#{base}details/"
    getHomes: ->
      $.getJSON("#{base}homes/#{App.request('zip')}?callback=?")

    getDemographics: ->
      $.getJSON("#{base}demographics/#{App.request('zip')}?callback=?")

    getTrends: ->
      $.getJSON("#{base}trends/#{App.request('state')}?callback=?")
