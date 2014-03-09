App.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  serializeFields = ->
    fields = @model.get('HES_Fields') || []
    @$('[name]').each (i, v) ->
      $v = $(v)

      fields.push({
        inputTableName: 'whole_house_input'
        inputColumnName: $v.attr('name')
        s_value: $v.val()
      })

    @model.set 'HES_Fields', fields

  class Views.HomeScoreBase extends Marionette.ItemView
    onShow: ->
      $scoreInputs = @$('.fancy-select,.fancy-input')

      $scoreInputs.on 'focus', ->
        $scoreInputs.parent().removeClass('active-col')
        $(@).parent().addClass('active-col')

    className: 'home-score-segment'
    serializeData: ->
      address: @model.get('details').address

    events: ->
      "click .jump-section": @advance

    advance: ->
      App.vent.trigger 'advanceSection'

  class Views.HomeBasics extends Views.HomeScoreBase
    template: templates.home_basics
    onRender: ->
      @$('#state').val(@model.getState())

    onClose: ->
      serializeFields.call(@)

  class Views.EnergyPrices extends Views.HomeScoreBase
    template: templates.energy_prices

    onClose: ->
      serializeFields.call(@)

  class Views.BuildingDesign extends Views.HomeScoreBase
    template: templates.building_design
    onClose: ->
      serializeFields.call(@)

  class Views.Score extends Views.HomeScoreBase
    serializeData: ->
      HESResults: @model.get('HESResults')

    modelEvents: ->
      "change:HESResults": @render

    getTemplate: ->
      if @model.get('HESResults')?
        templates.home_score
      else
        templates.home_score_loading

    onShow: ->
      @$(".cycle-slideshow").cycle
        speed: 2000
        slides: ".fact"

      @model.getHESScore()