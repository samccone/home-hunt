App.module "Utils", (Utils, App, Backbone, Marionette, $, _) ->
  marginBottom    = 22
  marginTop       = 22
  height          = 400 + marginBottom
  width           = 750
  leftRightMargin = 10
  diameter        = 4

  class Utils.LineChart
    constructor: (@data) ->
      @chart = d3.select('.chart')
                .attr('width', width)
                .attr 'height', height

      @y = d3.scale.linear()
            .domain([0, d3.max(_.flatten(_.map(@data, (d) -> d.data)))])
            .range([height-marginBottom, marginTop])

      @x = d3.scale.linear()
            .domain([0, @data[0].data.length])
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
              .orient("bottom")
              .tickFormat (d, i) ->
                1969 + ~~(44 * i/8)

      @chart.append('g')
           .attr('transform', -> "translate(0, #{height - marginBottom})")
           .call xAxis

    drawLine: (d, i, initial) ->
      empty= d.data.map -> 0

      if initial
        @chart.append("svg:path").attr("d", @line(empty))
                              .attr('class', "line#{i} id-#{d.id}")
                              .transition().duration(500)
                              .attr("d", @line(d.data))
      else
        @chart.selectAll("circle.line#{i}")
           .attr('cy', height-marginBottom)

        @chart.select("path.line#{i}").attr("d", @line(empty))
                              .transition().duration(500)
                              .attr("d", @line(d.data))

      @chart.selectAll("circle.line#{i}")
           .data(empty).enter()
           .append('circle')
           .attr('class', "line#{i} id-#{d.id}")
           .attr('cx', @line.x())
           .attr('cy', @line.y())
           .attr('r', diameter)

      @chart.selectAll("circle.line#{i}")
           .data(d.data)
           .transition().duration(500)
           .attr('cx', @line.x())
           .attr('cy', @line.y())

    redrawLine: (i) ->
      @drawLine @data[i], i, false
