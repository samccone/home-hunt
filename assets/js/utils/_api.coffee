App.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  base = "http://house-hunt-api.nodejitsu.com/"

  Utils.API =
    HESScoreUrl: -> "#{base}score/"
    homeUrlRoot: -> "#{base}details/"

    getWalkScore: (lat, lon) ->
      $.getJSON("#{base}walk_score/home/#{lat}/#{lon}?callback=?")

    getHomes: ->
      $.getJSON("#{base}homes/#{App.request('location').get('zip')}?callback=?")

    getDemographics: ->
      $.getJSON("#{base}demographics/#{App.request('location').get('zip')}?callback=?")

    getTrends: ->
      $.getJSON("#{base}trends/#{App.request('location').get('state')}?callback=?")
