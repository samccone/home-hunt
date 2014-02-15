App.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  marginBottom    = 22
  height          = 300 + marginBottom
  width           = 600
  leftRightMargin = 10
  diameter        = 2

  class Utils.LineChart
    constructor: (@data) ->
      @chart = d3.select('.chart')
                .attr('width', width)
                .attr 'height', height

      @y = d3.scale.linear()
            .domain([0, d3.max(_.flatten(@data))])
            .range([height-marginBottom, 0])

      @x = d3.scale.linear()
            .domain([0, @data[0].length])
            .range([leftRightMargin, width-leftRightMargin])

      @line = d3.svg.line()
             .interpolate("monotone")
             .x((d, i) => @x(i))
             .y @y

      @data.forEach (_d, i, initial = true) => @drawLine.apply(@, arguments)

      @drawAxis()

    drawAxis: ->
      xAxis = d3.svg.axis()
              .scale(@x)
              .orient "bottom"

      @chart.append('g')
           .attr('transform', -> "translate(0, #{height - marginBottom})")
           .call xAxis

    drawLine: (d, i, initial) ->
      empty= d.map -> 0
      if initial
        @chart.append("svg:path").attr("d", @line(empty))
                              .attr('class', "line#{i}")
                              .transition().duration(500)
                              .attr("d", @line(d))
      else
        @chart.selectAll("circle.line#{i}")
           .attr('cy', height-marginBottom)

        @chart.select("path.line#{i}").attr("d", @line(empty))
                              .transition().duration(500)
                              .attr("d", @line(d))

      @chart.selectAll("circle.line#{i}")
           .data(empty).enter()
           .append('circle')
           .attr('class', "line#{i}")
           .attr('cx', @line.x())
           .attr('cy', @line.y())
           .attr('r', diameter)

      @chart.selectAll("circle.line#{i}")
           .data(d)
           .transition().duration(500)
           .attr('cx', @line.x())
           .attr('cy', @line.y())

    redrawLine: (i) ->
      @drawLine @data[i], i, false
